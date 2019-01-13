package com.mission.hrms.entity.dto;

import com.mission.hrms.entity.Employee;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

/**
 * @author mission
 * @date 2019/1/11 0011-15:43
 */
@Slf4j
@Data
@Accessors(chain = true)
public class ArchiveUpdateDTO {

  private Long emId;// id


  @NotNull(message = "姓名不能为空")
  private String emName;//姓名

  @NotNull(message = "年龄不能为空")
  private Integer emAge;//年龄

  @NotNull(message = "性别不能为空")
  private String emGender;//性别    (选择)

  @Email
  private String emEmail;//Email

  private Long emPhone;//电话

  private Long emQQ;//QQ

  @NotNull(message = "手机不能为空")
  private Long empTelphone;// 手机   长度=11

  @NotNull(message = "地址不能为空")
  private String emAddress;//地址

  @NotNull(message = "邮编不能为空")
  private Integer emPostCode;// 邮编 长度=6

  @NotNull(message = "国籍不能为空")
  private String emNationality;//国籍   (选择)

  @NotNull(message = "出生地不能为空")
  private String emBirthPlace;//出生地

  @NotNull(message = "生日不能为空")
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private LocalDate emBirthday;//生日

  @NotNull(message = "民族不能为空")
  private String emNation;//民族   (选择)

  private String  emFaith;//宗教信仰

  @NotNull(message = "学历不能为空")
  private String emEduBg;//学历      (选择)

  @NotNull(message = "政治面貌不能为空")
  private String emPoliticalStatus;//政治面貌

  @NotNull(message = "身份证号码不能为空")
  private Long emIdCard;//身份证号码

  private Long emSSN;//社会保障号码

  @NotNull(message = "教育年限不能为空")
  private String emYearsOfEdu;//教育年限

  @NotNull(message = "专业不能为空")
  private String emMajor;//专业

  @NotNull(message = "开户银行不能为空")
  private String emBank;//开户银行

  @NotNull(message = "银行账号不能为空")
  private Long emBankAccount;//银行账号

  @NotNull(message = "特长不能为空")
  private String emSkill;//特长

  @NotNull(message = "爱好不能为空")
  private String emHobby;// 爱好

  @NotNull(message = "个人履历不能为空")
  private String emResume;//个人履历  大段文本

  private String emFamilyRelation;// 家庭关系信息  大段文本

  private String emRemark;// 备注  大段文本

  @NotNull(message = "登记人不能为空")
  private String emRegistrant;//登记人



  private Integer emState;// 状态 (-1删除 ,0待复核 1已复核)

  private String emImgPath;// 头像路径




  public Employee convertEmployee(Employee employee){
    BeanUtils.copyProperties(this,employee);
    log.info("转{}",employee);
    return employee;
  }



  public ArchiveUpdateDTO convertFor(Employee employee){
    BeanUtils.copyProperties(employee,this);
    log.info("转{}",this);
    return this;
  }


}
