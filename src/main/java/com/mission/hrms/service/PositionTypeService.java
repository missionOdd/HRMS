package com.mission.hrms.service;

import com.mission.hrms.entity.PositionType;
import java.util.List;

/**
 * (PositionType)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
public interface PositionTypeService {

    /**
     * 通过ID查询单条数据
     *
     * @param ptId 主键
     * @return 实例对象
     */
    PositionType queryById(Long ptId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<PositionType> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param positionType 实例对象
     * @return 实例对象
     */
    PositionType insert(PositionType positionType);

    /**
     * 修改数据
     *
     * @param positionType 实例对象
     * @return 实例对象
     */
    PositionType update(PositionType positionType);

    /**
     * 通过主键删除数据
     *
     * @param ptId 主键
     * @return 是否成功
     */
    boolean deleteById(Long ptId);

}