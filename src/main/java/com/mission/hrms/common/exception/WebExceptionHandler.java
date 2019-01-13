package com.mission.hrms.common.exception;

import cn.hutool.json.JSON;
import cn.hutool.json.JSONUtil;
import com.mission.hrms.common.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.mission.hrms.common.utils.HttpServletRequestUtil.isAjax;

/**
 * @author mission
 * @date 2018/10/6 0006-15:18
 */
@ControllerAdvice
@Slf4j
public class WebExceptionHandler {

  public static final String ERRO_VIEW ="sys/error";

  @ExceptionHandler(value =Exception.class)
  @ResponseBody
  public Object errorHandler(HttpServletRequest request, HttpServletResponse response , Exception e) throws Exception {
    log.error(e.toString());
    return getObject(request, e);
  }

  @ExceptionHandler(MyException.class)
  @ResponseBody
    public Object MyErrorHandler(HttpServletRequest request, HttpServletResponse response , Exception e) throws Exception{
      log.error(e.toString());
    return getObject(request, e);
  }


  private Object getObject(HttpServletRequest request, Exception e) {
    if (isAjax(request)) {
      JSON json;


      if (e instanceof HttpRequestMethodNotSupportedException){
        json = JSONUtil.parse(ResultVO.custom(501,"无权访问:"+e.toString()));
      }else
      if (e instanceof DuplicateKeyException){
        json = JSONUtil.parse(ResultVO.custom(503,"数据库操作失败,可能数据已经存在:"+e.toString()));
      }else
      if (e instanceof MyException){
        json = JSONUtil.parse(ResultVO.custom(505,"意料之中的异常:"+e.toString()));
      }else {
        json = JSONUtil.parse(ResultVO.custom(503,"其他异常:"+e.toString()));
      }
      log.error("错误:{}", json);
      return json;
    } else {
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.addObject("erro", e);
      modelAndView.addObject("url", request.getRequestURL());
      modelAndView.setViewName(ERRO_VIEW);
      return modelAndView;
    }
  }

}
