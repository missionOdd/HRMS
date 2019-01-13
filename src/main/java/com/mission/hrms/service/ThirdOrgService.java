package com.mission.hrms.service;

import com.mission.hrms.entity.ThirdOrg;
import java.util.List;

/**
 * (ThirdOrg)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:22
 */
public interface ThirdOrgService {

    /**
     * 通过ID查询单条数据
     *
     * @param tId 主键
     * @return 实例对象
     */
    ThirdOrg queryById(Long tId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<ThirdOrg> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param thirdOrg 实例对象
     * @return 实例对象
     */
    ThirdOrg insert(ThirdOrg thirdOrg);

    /**
     * 修改数据
     *
     * @param thirdOrg 实例对象
     * @return 实例对象
     */
    ThirdOrg update(ThirdOrg thirdOrg);

    /**
     * 通过主键删除数据
     *
     * @param tId 主键
     * @return 是否成功
     */
    boolean deleteById(Long tId);

}