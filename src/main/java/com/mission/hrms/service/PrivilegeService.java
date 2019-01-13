package com.mission.hrms.service;

import com.mission.hrms.entity.Privilege;
import java.util.List;

/**
 * (Privilege)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
public interface PrivilegeService {

    /**
     * 通过ID查询单条数据
     *
     * @param prId 主键
     * @return 实例对象
     */
    Privilege queryById(Long prId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Privilege> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param privilege 实例对象
     * @return 实例对象
     */
    Privilege insert(Privilege privilege);

    /**
     * 修改数据
     *
     * @param privilege 实例对象
     * @return 实例对象
     */
    Privilege update(Privilege privilege);

    /**
     * 通过主键删除数据
     *
     * @param prId 主键
     * @return 是否成功
     */
    boolean deleteById(Long prId);

}