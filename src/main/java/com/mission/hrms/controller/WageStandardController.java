package com.mission.hrms.controller;

import com.mission.hrms.common.exception.MyException;
import com.mission.hrms.common.vo.ResultVO;
import com.mission.hrms.entity.WageStandard;
import com.mission.hrms.service.WageStandardService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

/**
 * (WageStandard)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:22
 */
@RestController
@RequestMapping("wageStandard")
public class WageStandardController {
    /**
     * 服务对象
     */
    @Resource
    private WageStandardService wageStandardService;


    @PostMapping("add")
    public ResultVO add(@Valid WageStandard wageStandard, HttpServletResponse response) {
        if (wageStandardService.add(wageStandard)){

            try {
                response.sendRedirect("/page/listwagestandard");
            } catch (IOException e) {
                throw new MyException("跳转失败");
            }
            return ResultVO.ok();
        }else {
            return ResultVO.erro();
        }

    }


    /**
     * 绑定和生成 工资 订单 等
     * @return
     */
    @GetMapping("bind")
    public ResultVO bind() {
        wageStandardService.bind();
        return ResultVO.ok();
    }


    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public WageStandard selectOne(Long id) {
        return this.wageStandardService.queryById(id);
    }

}