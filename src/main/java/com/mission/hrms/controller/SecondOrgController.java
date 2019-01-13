package com.mission.hrms.controller;

import com.mission.hrms.entity.SecondOrg;
import com.mission.hrms.service.SecondOrgService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SecondOrg)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:22
 */
@RestController
@RequestMapping("secondOrg")
public class SecondOrgController {
    /**
     * 服务对象
     */
    @Resource
    private SecondOrgService secondOrgService;





    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SecondOrg selectOne(Long id) {
        return this.secondOrgService.queryById(id);
    }

}