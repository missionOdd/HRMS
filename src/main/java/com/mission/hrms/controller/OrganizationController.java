package com.mission.hrms.controller;

import com.mission.hrms.entity.Organization;
import com.mission.hrms.service.OrganizationService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Organization)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
@RestController
@RequestMapping("organization")
public class OrganizationController {
    /**
     * 服务对象
     */
    @Resource
    private OrganizationService organizationService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Organization selectOne(Long id) {
        return this.organizationService.queryById(id);
    }

}