package com.mission.hrms.service.impl;

import com.mission.hrms.entity.Privilege;
import com.mission.hrms.repository.PrivilegeRepository;
import com.mission.hrms.service.PrivilegeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Privilege)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("privilegeService")
public class PrivilegeServiceImpl implements PrivilegeService {
   
   @Resource
    private PrivilegeRepository privilegeRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param prId 主键
     * @return 实例对象
     */
    @Override
    public Privilege queryById(Long prId) {
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
    public List<Privilege> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param privilege 实例对象
     * @return 实例对象
     */
    @Override
    public Privilege insert(Privilege privilege) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param privilege 实例对象
     * @return 实例对象
     */
    @Override
    public Privilege update(Privilege privilege) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param prId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long prId) {
        return false;
    }
}