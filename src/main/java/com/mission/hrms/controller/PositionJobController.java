package com.mission.hrms.controller;

import com.mission.hrms.entity.PositionJob;
import com.mission.hrms.service.PositionJobService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (PositionJob)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:21
 */
@RestController
@RequestMapping("positionJob")
public class PositionJobController {
    /**
     * 服务对象
     */
    @Resource
    private PositionJobService positionJobService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public PositionJob selectOne(Long id) {
        return this.positionJobService.queryById(id);
    }

}