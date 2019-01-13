package com.mission.hrms.service.impl;

import com.mission.hrms.entity.ThirdOrg;
import com.mission.hrms.repository.ThirdOrgRepository;
import com.mission.hrms.service.ThirdOrgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (ThirdOrg)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("thirdOrgService")
public class ThirdOrgServiceImpl implements ThirdOrgService {
   
   @Resource
    private ThirdOrgRepository thirdOrgRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param tId 主键
     * @return 实例对象
     */
    @Override
    public ThirdOrg queryById(Long tId) {
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
    public List<ThirdOrg> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param thirdOrg 实例对象
     * @return 实例对象
     */
    @Override
    public ThirdOrg insert(ThirdOrg thirdOrg) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param thirdOrg 实例对象
     * @return 实例对象
     */
    @Override
    public ThirdOrg update(ThirdOrg thirdOrg) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param tId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long tId) {
        return false;
    }
}