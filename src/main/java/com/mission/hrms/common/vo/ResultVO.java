package com.mission.hrms.common.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.mission.hrms.common.vo.enums.CodeStateEnum;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 统一返回给前端的Json数据
 * @author mission
 * @date 2018/10/5 0005-9:24
 */

@Getter
@Setter
public class ResultVO<T> implements Serializable {
  /**
   * 状态码
   */
  @ApiModelProperty(value = "状态码")
  private Integer state;
  /**
   * 状态信息
   */
  @ApiModelProperty(value = "状态信息")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String msg;
  /**
   * 数据统计
   */
  @ApiModelProperty(value = "数据统计")
  @JsonInclude(JsonInclude.Include.NON_EMPTY)
  private Long count;

  /**
   * 数据
   */
  @ApiModelProperty(value = "返回数据")
  @JsonInclude(JsonInclude.Include.NON_EMPTY)
  private  T data;

  public ResultVO(T data) {
    this.state=CodeStateEnum.SUCCESS.getState();
    this.msg=CodeStateEnum.SUCCESS.getStateInfo();
    this.data = data;
  }

  public ResultVO(T data, Long count) {
    this.state= CodeStateEnum.SUCCESS.getState();
    this.msg=CodeStateEnum.SUCCESS.getStateInfo();
    this.data = data;
    this.count=count;
  }

  public ResultVO(CodeStateEnum codeStateEnum, T data){
    this.state=codeStateEnum.getState();
    this.msg=codeStateEnum.getStateInfo();
    this.data = data;
  }

  public ResultVO(CodeStateEnum codeStateEnum, T data, Long count){
    this.state=codeStateEnum.getState();
    this.msg=codeStateEnum.getStateInfo();
    this.data = data;
    this.count=count;
  }

  public ResultVO(CodeStateEnum codeStateEnum){
    this.state=codeStateEnum.getState();
    this.msg=codeStateEnum.getStateInfo();
  }

  public ResultVO(){
  }

  public ResultVO(Integer state, String msg) {
    this.state=state;
    this.msg=msg;
  }

  public ResultVO(Integer state, String msg, T data) {
    this.state=state;
    this.msg=msg;
    this.data=data;
  }

  public ResultVO _erro(){
    this.state=CodeStateEnum.ERRO.getState();
    this.msg=CodeStateEnum.ERRO.getStateInfo();
    return this;
  }
  public ResultVO _erro(String msg){
    this.state=CodeStateEnum.ERRO.getState();
    this.msg=msg;
    return this;
  }

  public ResultVO _ok(){
    this.state=CodeStateEnum.SUCCESS.getState();
    this.msg=CodeStateEnum.SUCCESS.getStateInfo();
    return this;
  }

  public ResultVO _ok(T data){
    this.state=CodeStateEnum.SUCCESS.getState();
    this.msg=CodeStateEnum.SUCCESS.getStateInfo();
    this.data = data;
    return this;
  }

  public ResultVO _ok(T data, Long count){
    this.state=CodeStateEnum.SUCCESS.getState();
    this.msg=CodeStateEnum.SUCCESS.getStateInfo();
    this.data = data;
    this.count=count;
    return this;
  }


  public static ResultVO ok(){
    return new ResultVO()._ok();
  }

  public static ResultVO erro(){
    return new ResultVO()._erro();
  }

  public static ResultVO erro(String msg){
    return new ResultVO()._erro(msg);
  }

  public static ResultVO ok(Object data){
    return new ResultVO()._ok(data);
  }

  public static ResultVO ok(Object data, int count){
    return new ResultVO()._ok(data, (long) count);
  }

  public static ResultVO erro(CodeStateEnum codeStateEnum){
    return new ResultVO(codeStateEnum);
  }

  public static ResultVO custom(Integer state, String msg){
    return new ResultVO(state,msg);
  }

  public static ResultVO custom(Integer state, String msg, Object data){
    return new ResultVO(state,msg,data);
  }


  public static ResultVO empty(){
    return new ResultVO(CodeStateEnum.NULL);
  }

  public static ResultVO bad(){
    return new ResultVO(CodeStateEnum.BAD);
  }

  public static ResultVO over(){
    return new ResultVO(CodeStateEnum.OVER);
  }

  public static ResultVO unavailable(){
    return new ResultVO(CodeStateEnum.Unavailable);
  }

  public static ResultVO notGo(){
    return new ResultVO(CodeStateEnum.NotGo);
  }

  public static ResultVO notGo(String msg){ return new ResultVO(CodeStateEnum.NotGo,msg); }

}
