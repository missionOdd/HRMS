package com.mission.hrms.controller;


import com.mission.hrms.common.exception.MyException;
import com.mission.hrms.common.vo.ResultVO;
import com.mission.hrms.entity.dto.ArchiveDTO;
import com.mission.hrms.entity.dto.ArchiveUpdateDTO;
import com.mission.hrms.entity.projection.WageStandArch;
import com.mission.hrms.service.EmployeeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

/**
 * (Employee)表控制层
 *
 * @author makejava
 * @since 2019-01-11 13:01:15
 */
@RestController
@RequestMapping("employee")
public class EmployeeController {
    /**
     * 服务对象
     */
    @Resource
    private EmployeeService employeeService;



    @PostMapping("add")
    public ResultVO add(@Valid ArchiveDTO archiveDTO, HttpServletResponse response) {

        if (archiveDTO==null){
            return   ResultVO.bad();
        }
        if (employeeService.add(archiveDTO)){
            try {
                response.sendRedirect("/page/archlist");
            } catch (IOException e) {
                throw new MyException("跳转失败");
            }
            return   ResultVO.ok();
        }else {
            return  ResultVO.erro();
        }
    }

    @PostMapping("update")
    public ResultVO add(@Valid ArchiveUpdateDTO updateDTO, HttpServletResponse response) {

        if (updateDTO==null){
            return   ResultVO.bad();
        }
        if (employeeService.update(updateDTO)){
            try {
                response.sendRedirect("/page/archlist");
            } catch (IOException e) {
                throw new MyException("跳转失败");
            }
            return   ResultVO.ok();
        }else {
            return  ResultVO.erro();
        }
    }


    @GetMapping("getOne")
    public ResultVO selectOne(String wageStandardNum) {
       List<WageStandArch> simpleArchList= employeeService.getByWs(wageStandardNum);
        return ResultVO.ok(simpleArchList);
    }

}