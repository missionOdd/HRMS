package com.mission.hrms.controller;

import com.mission.hrms.entity.FirstOrg;
import com.mission.hrms.service.FirstOrgService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * (FirstOrg)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
@RestController
@RequestMapping("firstOrg")
public class FirstOrgController {
    /**
     * 服务对象
     */
    @Resource
    private FirstOrgService firstOrgService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public FirstOrg selectOne(Long id) {
        return this.firstOrgService.queryById(id);
    }

}