package com.mission.hrms.service.impl;

import com.mission.hrms.entity.PayBills;
import com.mission.hrms.repository.PayBillsRepository;
import com.mission.hrms.service.PayBillsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (PayBills)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("payBillsService")
public class PayBillsServiceImpl implements PayBillsService {
   
   @Resource
    private PayBillsRepository payBillsRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param pbId 主键
     * @return 实例对象
     */
    @Override
    public PayBills queryById(Long pbId) {
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
    public List<PayBills> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param payBills 实例对象
     * @return 实例对象
     */
    @Override
    public PayBills insert(PayBills payBills) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param payBills 实例对象
     * @return 实例对象
     */
    @Override
    public PayBills update(PayBills payBills) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param pbId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long pbId) {
        return false;
    }
}