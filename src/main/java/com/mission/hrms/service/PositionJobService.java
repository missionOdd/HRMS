package com.mission.hrms.service;

import com.mission.hrms.entity.PositionJob;
import java.util.List;

/**
 * (PositionJob)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
public interface PositionJobService {

    /**
     * 通过ID查询单条数据
     *
     * @param pjId 主键
     * @return 实例对象
     */
    PositionJob queryById(Long pjId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<PositionJob> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param positionJob 实例对象
     * @return 实例对象
     */
    PositionJob insert(PositionJob positionJob);

    /**
     * 修改数据
     *
     * @param positionJob 实例对象
     * @return 实例对象
     */
    PositionJob update(PositionJob positionJob);

    /**
     * 通过主键删除数据
     *
     * @param pjId 主键
     * @return 是否成功
     */
    boolean deleteById(Long pjId);

}