package com.mission.hrms.service;

import com.mission.hrms.entity.Organization;
import java.util.List;

/**
 * (Organization)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
public interface OrganizationService {

    /**
     * 通过ID查询单条数据
     *
     * @param orgId 主键
     * @return 实例对象
     */
    Organization queryById(Long orgId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Organization> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param organization 实例对象
     * @return 实例对象
     */
    Organization insert(Organization organization);

    /**
     * 修改数据
     *
     * @param organization 实例对象
     * @return 实例对象
     */
    Organization update(Organization organization);

    /**
     * 通过主键删除数据
     *
     * @param orgId 主键
     * @return 是否成功
     */
    boolean deleteById(Long orgId);

}