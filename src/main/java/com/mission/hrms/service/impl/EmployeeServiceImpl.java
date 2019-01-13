package com.mission.hrms.service.impl;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.Organization;
import com.mission.hrms.entity.Position;
import com.mission.hrms.entity.dto.ArchiveDTO;
import com.mission.hrms.entity.dto.ArchiveUpdateDTO;
import com.mission.hrms.entity.projection.WageStandArch;
import com.mission.hrms.repository.EmployeeRepository;
import com.mission.hrms.repository.PositionRepository;
import com.mission.hrms.service.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.List;

/**
 * (Employee)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:56
 */
@Slf4j
@Transactional
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
   
   @Resource
    private EmployeeRepository employeeRepository;

  @Resource
  private PositionRepository positionRepository;



  @Override
  public boolean add(ArchiveDTO archiveDTO) {
    Employee employee=archiveDTO.convertEmployee();
    Position position =archiveDTO.convertPosition();
    Organization organization =archiveDTO.convertOrganization();
    employee.setEmState(0);
    employee.setEmArchNum( LocalDateTime.now().toInstant(ZoneOffset.of("+8")).toEpochMilli());
    employee.setPosition(position);
    employee.setOrg(organization);
    employee.setEmCreateTime(LocalDateTime.now());
    if (employeeRepository.save(employee)!=null){
      return true;
    }
    return false;
  }


  @Override
  public boolean update(ArchiveUpdateDTO updateDTO) {
    Employee employee =employeeRepository.getOne(updateDTO.getEmId());
    employee=updateDTO.convertEmployee(employee);
    employee.setEmState(1);
    if (employeeRepository.saveAndFlush(employee)!=null){
      return true;
    }
    return false;
  }



  @Override
  public List<WageStandArch> getByWs(String wsNum) {
    List<Position> positions =null;
    if (wsNum==null||wsNum==""){
      positions = positionRepository.findAll();
    }else {
      positions = positionRepository.findByPWageStandardLike("%"+wsNum+"%");
    }

    List<WageStandArch> simpleArchList=employeeRepository.findByPositionIn(positions);
    return simpleArchList;
  }

  @Override
  public List<Employee> getEmByWs(String wsNum) {
    List<Position> positions = positionRepository.findByPWageStandard(wsNum);
    List<Employee> employeeList=employeeRepository.findByPositionIsIn(positions);
    return employeeList;
  }


  /**
     * 通过ID查询单条数据
     *
     * @param emId 主键
     * @return 实例对象
     */
    @Override
    public Employee queryById(Long emId) {
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
    public List<Employee> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param employee 实例对象
     * @return 实例对象
     */
    @Override
    public Employee insert(Employee employee) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param employee 实例对象
     * @return 实例对象
     */
    @Override
    public Employee update(Employee employee) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param emId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long emId) {
        return false;
    }
}