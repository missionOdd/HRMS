package com.mission.hrms.service.impl;

import com.mission.hrms.entity.PositionJob;
import com.mission.hrms.repository.PositionJobRepository;
import com.mission.hrms.service.PositionJobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (PositionJob)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("positionJobService")
public class PositionJobServiceImpl implements PositionJobService {
   
   @Resource
    private PositionJobRepository positionJobRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param pjId 主键
     * @return 实例对象
     */
    @Override
    public PositionJob queryById(Long pjId) {
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
    public List<PositionJob> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param positionJob 实例对象
     * @return 实例对象
     */
    @Override
    public PositionJob insert(PositionJob positionJob) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param positionJob 实例对象
     * @return 实例对象
     */
    @Override
    public PositionJob update(PositionJob positionJob) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param pjId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long pjId) {
        return false;
    }
}