package com.mission.hrms.controller;


import com.mission.hrms.common.exception.MyException;
import com.mission.hrms.common.vo.ResultVO;
import com.mission.hrms.entity.Wage;
import com.mission.hrms.entity.dto.WageDTO;
import com.mission.hrms.service.WageService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

/**
 * (Wage)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:22
 */
@RestController
@RequestMapping("wage")
public class WageController {
    /**
     * 服务对象
     */
    @Resource
    private WageService wageService;

    @PostMapping("update")
    public ResultVO update(@Valid WageDTO wageDTO,String pbId, HttpServletResponse response){
        if (wageService.update(wageDTO)){

          try {
            response.sendRedirect("/page/pay?pbId="+pbId);
          } catch (IOException e) {
            throw new MyException("跳转失败");
          }
          return ResultVO.ok();
        }else {
            return ResultVO.erro();
        }

    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Wage selectOne(Long id) {
        return this.wageService.queryById(id);
    }

}