package com.mission.hrms.service;

import com.mission.hrms.entity.WageStandard;
import java.util.List;

/**
 * (WageStandard)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:22
 */
public interface WageStandardService {

    /**
     * 提交数据
     *
     * @param WageStandard
     * @return
     */
     boolean add(WageStandard WageStandard);



    /**
     * 提交数据
     *
     * @param
     * @return
     */
    boolean bind();





    /**
     * 通过ID查询单条数据
     *
     * @param wsId 主键
     * @return 实例对象
     */
    WageStandard queryById(Long wsId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<WageStandard> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param wageStandard 实例对象
     * @return 实例对象
     */
    WageStandard insert(WageStandard wageStandard);

    /**
     * 修改数据
     *
     * @param wageStandard 实例对象
     * @return 实例对象
     */
    WageStandard update(WageStandard wageStandard);

    /**
     * 通过主键删除数据
     *
     * @param wsId 主键
     * @return 是否成功
     */
    boolean deleteById(Long wsId);

}