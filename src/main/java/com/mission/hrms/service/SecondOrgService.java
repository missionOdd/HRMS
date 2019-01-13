package com.mission.hrms.service;

import com.mission.hrms.entity.SecondOrg;
import java.util.List;

/**
 * (SecondOrg)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
public interface SecondOrgService {

    /**
     * 通过ID查询单条数据
     *
     * @param sId 主键
     * @return 实例对象
     */
    SecondOrg queryById(Long sId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SecondOrg> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param secondOrg 实例对象
     * @return 实例对象
     */
    SecondOrg insert(SecondOrg secondOrg);

    /**
     * 修改数据
     *
     * @param secondOrg 实例对象
     * @return 实例对象
     */
    SecondOrg update(SecondOrg secondOrg);

    /**
     * 通过主键删除数据
     *
     * @param sId 主键
     * @return 是否成功
     */
    boolean deleteById(Long sId);

}