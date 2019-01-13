package com.mission.hrms.service;

import com.mission.hrms.entity.FirstOrg;
import java.util.List;

/**
 * (FirstOrg)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
public interface FirstOrgService {

    /**
     * 通过ID查询单条数据
     *
     * @param fId 主键
     * @return 实例对象
     */
    FirstOrg queryById(Long fId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<FirstOrg> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param firstOrg 实例对象
     * @return 实例对象
     */
    FirstOrg insert(FirstOrg firstOrg);

    /**
     * 修改数据
     *
     * @param firstOrg 实例对象
     * @return 实例对象
     */
    FirstOrg update(FirstOrg firstOrg);

    /**
     * 通过主键删除数据
     *
     * @param fId 主键
     * @return 是否成功
     */
    boolean deleteById(Long fId);

}