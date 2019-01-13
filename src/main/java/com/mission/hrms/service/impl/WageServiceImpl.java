package com.mission.hrms.service.impl;

import com.mission.hrms.entity.Wage;
import com.mission.hrms.entity.dto.WageDTO;
import com.mission.hrms.repository.WageRepository;
import com.mission.hrms.service.WageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Wage)表服务实现类
 *
 * @author makejava
 * @since 2019-01-11 13:49:57
 */
@Service("wageService")
public class WageServiceImpl implements WageService {
   
   @Resource
    private WageRepository wageRepository;

    /**
     * 通过ID查询单条数据
     *
     * @param wId 主键
     * @return 实例对象
     */
    @Override
    public Wage queryById(Long wId) {
        return null;
    }

  @Override
  public boolean update(WageDTO wageDTO) {
      if (wageRepository.updateSomeById(wageDTO.getWReward(),wageDTO.getWFine(),wageDTO.getWId())>0){
        return true;
      }
    return false;
  }

  /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Wage> queryAllByLimit(int offset, int limit) {
        return null;
    }

    /**
     * 新增数据
     *
     * @param wage 实例对象
     * @return 实例对象
     */
    @Override
    public Wage insert(Wage wage) {
      return null;
    }

    /**
     * 修改数据
     *
     * @param wage 实例对象
     * @return 实例对象
     */
    @Override
    public Wage update(Wage wage) {

        return null;
    }

    /**
     * 通过主键删除数据
     *
     * @param wId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long wId) {
        return false;
    }
}