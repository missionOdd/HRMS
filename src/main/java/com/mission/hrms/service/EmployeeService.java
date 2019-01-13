package com.mission.hrms.service;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.dto.ArchiveDTO;
import com.mission.hrms.entity.dto.ArchiveUpdateDTO;
import com.mission.hrms.entity.projection.WageStandArch;

import java.util.List;

/**
 * (Employee)表服务接口
 *
 * @author makejava
 * @since 2019-01-11 13:01:14
 */
public interface EmployeeService {

    /**
     * 通过ID查询单条数据
     *
     * @param emId 主键
     * @return 实例对象
     */
    Employee queryById(Long emId);

    List<WageStandArch> getByWs(String wsNum);

    List<Employee> getEmByWs(String wsNum);
    /**
     * 添加数据
     *
     * @param archiveDTO
     * @return 实例对象
     */
    boolean add(ArchiveDTO archiveDTO);



    /**
     * 添加数据
     *
     * @param updateDTO
     * @return 实例对象
     */
    boolean update(ArchiveUpdateDTO updateDTO);


    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Employee> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param employee 实例对象
     * @return 实例对象
     */
    Employee insert(Employee employee);

    /**
     * 修改数据
     *
     * @param employee 实例对象
     * @return 实例对象
     */
    Employee update(Employee employee);

    /**
     * 通过主键删除数据
     *
     * @param emId 主键
     * @return 是否成功
     */
    boolean deleteById(Long emId);

}