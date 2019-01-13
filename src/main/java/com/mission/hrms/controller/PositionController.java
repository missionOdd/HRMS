package com.mission.hrms.controller;

import com.mission.hrms.entity.Position;
import com.mission.hrms.service.PositionService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Position)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
@RestController
@RequestMapping("position")
public class PositionController {
    /**
     * 服务对象
     */
    @Resource
    private PositionService positionService;








    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Position selectOne(Long id) {
        return this.positionService.queryById(id);
    }

}