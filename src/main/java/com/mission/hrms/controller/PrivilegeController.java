package com.mission.hrms.controller;

import com.mission.hrms.entity.Privilege;
import com.mission.hrms.service.PrivilegeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Privilege)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
@RestController
@RequestMapping("privilege")
public class PrivilegeController {
    /**
     * 服务对象
     */
    @Resource
    private PrivilegeService privilegeService;





    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Privilege selectOne(Long id) {
        return this.privilegeService.queryById(id);
    }

}