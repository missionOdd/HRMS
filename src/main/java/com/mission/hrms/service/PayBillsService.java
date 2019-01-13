package com.mission.hrms.service;

import com.mission.hrms.entity.PayBills;
import java.util.List;

/**
 * (PayBills)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
public interface PayBillsService {

    /**
     * 通过ID查询单条数据
     *
     * @param pbId 主键
     * @return 实例对象
     */
    PayBills queryById(Long pbId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<PayBills> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param payBills 实例对象
     * @return 实例对象
     */
    PayBills insert(PayBills payBills);

    /**
     * 修改数据
     *
     * @param payBills 实例对象
     * @return 实例对象
     */
    PayBills update(PayBills payBills);

    /**
     * 通过主键删除数据
     *
     * @param pbId 主键
     * @return 是否成功
     */
    boolean deleteById(Long pbId);

}