package com.mission.hrms.controller;

import com.mission.hrms.entity.PositionType;
import com.mission.hrms.service.PositionTypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (PositionType)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
@RestController
@RequestMapping("positionType")
public class PositionTypeController {
    /**
     * 服务对象
     */
    @Resource
    private PositionTypeService positionTypeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public PositionType selectOne(Long id) {
        return this.positionTypeService.queryById(id);
    }

}