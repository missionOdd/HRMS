package com.mission.hrms.service.impl;

import com.mission.hrms.entity.PositionType;
import com.mission.hrms.repository.PositionTypeRepository;
import com.mission.hrms.service.PositionTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (PositionType)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("positionTypeService")
public class PositionTypeServiceImpl implements PositionTypeService {
   
   @Resource
    private PositionTypeRepository positionTypeRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param ptId 主键
     * @return 实例对象
     */
    @Override
    public PositionType queryById(Long ptId) {
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
    public List<PositionType> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param positionType 实例对象
     * @return 实例对象
     */
    @Override
    public PositionType insert(PositionType positionType) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param positionType 实例对象
     * @return 实例对象
     */
    @Override
    public PositionType update(PositionType positionType) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param ptId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long ptId) {
        return false;
    }
}