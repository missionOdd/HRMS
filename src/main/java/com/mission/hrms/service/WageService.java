package com.mission.hrms.service;

import com.mission.hrms.entity.Wage;
import com.mission.hrms.entity.dto.WageDTO;

import java.util.List;

/**
 * (Wage)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:22
 */
public interface WageService {

    /**
     * 通过ID查询单条数据
     *
     * @param wId 主键
     * @return 实例对象
     */
    Wage queryById(Long wId);


    boolean update(WageDTO wageDTO);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Wage> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param wage 实例对象
     * @return 实例对象
     */
    Wage insert(Wage wage);

    /**
     * 修改数据
     *
     * @param wage 实例对象
     * @return 实例对象
     */
    Wage update(Wage wage);

    /**
     * 通过主键删除数据
     *
     * @param wId 主键
     * @return 是否成功
     */
    boolean deleteById(Long wId);

}