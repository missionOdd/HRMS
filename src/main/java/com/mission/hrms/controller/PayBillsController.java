package com.mission.hrms.controller;

import com.mission.hrms.common.exception.MyException;
import com.mission.hrms.common.vo.ResultVO;
import com.mission.hrms.entity.PayBills;
import com.mission.hrms.repository.PayBillsRepository;
import com.mission.hrms.service.PayBillsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * (PayBills)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
@RestController
@RequestMapping("payBills")
public class PayBillsController {
    /**
     * 服务对象
     */
    @Resource
    private PayBillsService payBillsService;

    @Resource
    private PayBillsRepository payBillsRepository;
    @PostMapping("update")
    public ResultVO update(Long pbId, String pbRegistrant, HttpServletResponse response) {

            PayBills payBills = payBillsRepository.findById(pbId).get();

        final Double[] total = {payBills.getPbTotal()};
            payBills.getWages().forEach(wage -> {
                total[0] = total[0] +wage.getWReward()-wage.getWFine();
           });

        if(payBillsRepository.updateSomeById(pbRegistrant,1,total[0],pbId)>0){

            try {
                response.sendRedirect("/page/pay?pbId="+pbId);
            } catch (IOException e) {
                throw new MyException("跳转失败");
            }
            return ResultVO.ok();
        }
        return ResultVO.bad();
    }


    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public PayBills selectOne(Long id) {
        return this.payBillsService.queryById(id);
    }

}