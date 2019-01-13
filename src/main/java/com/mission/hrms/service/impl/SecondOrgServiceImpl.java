package com.mission.hrms.service.impl;

import com.mission.hrms.entity.SecondOrg;
import com.mission.hrms.repository.SecondOrgRepository;
import com.mission.hrms.service.SecondOrgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SecondOrg)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("secondOrgService")
public class SecondOrgServiceImpl implements SecondOrgService {
   
   @Resource
    private SecondOrgRepository secondOrgRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param sId 主键
     * @return 实例对象
     */
    @Override
    public SecondOrg queryById(Long sId) {
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
    public List<SecondOrg> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param secondOrg 实例对象
     * @return 实例对象
     */
    @Override
    public SecondOrg insert(SecondOrg secondOrg) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param secondOrg 实例对象
     * @return 实例对象
     */
    @Override
    public SecondOrg update(SecondOrg secondOrg) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param sId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long sId) {
        return false;
    }
}