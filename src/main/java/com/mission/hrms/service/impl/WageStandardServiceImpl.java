package com.mission.hrms.service.impl;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.PayBills;
import com.mission.hrms.entity.Wage;
import com.mission.hrms.entity.WageStandard;
import com.mission.hrms.repository.EmployeeRepository;
import com.mission.hrms.repository.PayBillsRepository;
import com.mission.hrms.repository.WageRepository;
import com.mission.hrms.repository.WageStandardRepository;
import com.mission.hrms.service.EmployeeService;
import com.mission.hrms.service.WageStandardService;
import com.sun.istack.internal.NotNull;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * (WageStandard)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("wageStandardService")
@Transactional
public class WageStandardServiceImpl implements WageStandardService {
   
   @Resource
    private WageStandardRepository wageStandardRepository;

  @Resource
  private EmployeeService employeeService;

  @Resource
  private EmployeeRepository employeeRepository;


  @Resource
  private PayBillsRepository payBillsRepository;

  @Resource
  private WageRepository wageRepository;

  @Override

  public boolean add(@NotNull WageStandard wageStandard) {
    wageStandard.setWsCreateTime(LocalDateTime.now())
    .setWsEndowmentInsurance(wageStandard.getWsBaseWage()*0.08)
    .setWsHealthInsurance(wageStandard.getWsBaseWage()*0.02+3)
    .setWsUnemployedInsurance(wageStandard.getWsBaseWage()*0.005)
    .setWsHousingFund(wageStandard.getWsBaseWage()*0.08);


    Double total =wageStandard.getWsBaseWage()
        +wageStandard.getWsCommunicationAllowance()
        -wageStandard.getWsEndowmentInsurance()
       -wageStandard.getWsHealthInsurance()
        -wageStandard.getWsHousingFund()
        +wageStandard.getWsLunchAllowance()
        +wageStandard.getWsTravelAllowance()
        -wageStandard.getWsUnemployedInsurance();
    wageStandard.setWsTotal(total);
    if (wageStandardRepository.save(wageStandard)!=null){
      try {
        List<Employee> employeeList = employeeService.getEmByWs(wageStandard.getWsNum().toString());
        employeeList.forEach(x -> x.setWageStandard(wageStandard));
        employeeRepository.saveAll(employeeList);
      } catch (Exception e) {
        System.out.println("无插入的employeeList");
      }
      return true;
    }
    return false;
  }

  @Override
  public boolean bind() {
    List<WageStandard> wageStandardList =wageStandardRepository.findAll();
    wageStandardList.forEach(ws->{
      List<Employee> employeeList =employeeService.getEmByWs(ws.getWsNum().toString());
    if (employeeList!=null&&employeeList.size()!=0){
      Set<Wage> wageSet =new HashSet<>();
      employeeList.forEach(e->{
        if (e.getWageStandard()!=null){
          e.setWageStandard(ws);
        }
        List<Wage> wageList =wageRepository.findByEmployeeAndWState(e,0);
        if (wageList!=null&&wageList.size()>0){
          return;
        }
        Wage wage =new Wage();
        wage.setEmployee(e).setWCreateTime(LocalDateTime.now()).setWsNum(ws.getWsNum()).setWTotal(ws.getWsTotal()).setWState(0).setWFine(0.00).setWReward(0.00);
            try {
              wageRepository.save(wage);
              wageSet.add(wage);
            } catch (Exception e1) {
              System.out.println(e1.toString());
              System.out.println("工资绑定错误");
            }
          });
      PayBills payBills =new PayBills();
      if (wageSet.size()>0){
        payBills.setPbEmSum(wageSet.size())
            .setPbTotal(ws.getWsTotal()*wageSet.size())
            .setWages(wageSet).setPbState(0).setPbCreateDate(LocalDateTime.now()).setOrg(employeeList.get(0).getOrg());
        try {
          payBillsRepository.save(payBills);
        } catch (Exception e) {
          System.out.println(e.toString());
          System.out.println("支付订单添加错误");
        }
      }

    }


    });

    return true;
  }


  /**
     * 通过ID查询单条数据
     *
     * @param wsId 主键
     * @return 实例对象
     */
    @Override
    public WageStandard queryById(Long wsId) {
        return null;
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<WageStandard> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param wageStandard 实例对象
     * @return 实例对象
     */
    @Override
    public WageStandard insert(WageStandard wageStandard) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param wageStandard 实例对象
     * @return 实例对象
     */
    @Override
    public WageStandard update(WageStandard wageStandard) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param wsId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long wsId) {
        return false;
    }
}