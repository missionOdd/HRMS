package com.mission.hrms.service.impl;

import com.mission.hrms.entity.Organization;
import com.mission.hrms.repository.OrganizationRepository;
import com.mission.hrms.service.OrganizationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Organization)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("organizationService")
public class OrganizationServiceImpl implements OrganizationService {
   
   @Resource
    private OrganizationRepository organizationRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param orgId 主键
     * @return 实例对象
     */
    @Override
    public Organization queryById(Long orgId) {
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
    public List<Organization> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param organization 实例对象
     * @return 实例对象
     */
    @Override
    public Organization insert(Organization organization) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param organization 实例对象
     * @return 实例对象
     */
    @Override
    public Organization update(Organization organization) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param orgId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long orgId) {
        return false;
    }
}