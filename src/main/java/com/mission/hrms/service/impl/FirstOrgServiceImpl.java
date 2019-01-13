package com.mission.hrms.service.impl;

import com.mission.hrms.entity.FirstOrg;
import com.mission.hrms.repository.FirstOrgRepository;
import com.mission.hrms.service.FirstOrgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (FirstOrg)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("firstOrgService")
public class FirstOrgServiceImpl implements FirstOrgService {
   
   @Resource
    private FirstOrgRepository firstOrgRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param fId 主键
     * @return 实例对象
     */
    @Override
    public FirstOrg queryById(Long fId) {
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
    public List<FirstOrg> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param firstOrg 实例对象
     * @return 实例对象
     */
    @Override
    public FirstOrg insert(FirstOrg firstOrg) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param firstOrg 实例对象
     * @return 实例对象
     */
    @Override
    public FirstOrg update(FirstOrg firstOrg) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param fId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long fId) {
        return false;
    }
}