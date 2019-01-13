package com.mission.hrms.controller;

import com.mission.hrms.entity.ThirdOrg;
import com.mission.hrms.service.ThirdOrgService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (ThirdOrg)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:22
 */
@RestController
@RequestMapping("thirdOrg")
public class ThirdOrgController {
    /**
     * 服务对象
     */
    @Resource
    private ThirdOrgService thirdOrgService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public ThirdOrg selectOne(Long id) {
        return this.thirdOrgService.queryById(id);
    }

}