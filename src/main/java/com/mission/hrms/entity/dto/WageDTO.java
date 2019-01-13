package com.mission.hrms.entity.dto;

import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

import javax.validation.constraints.NotNull;

/**
 * @author mission
 * @date 2019/1/13 0013-12:19
 */
@Slf4j
@Data
@Accessors(chain = true)
public class WageDTO {
  @NotNull(message = "id不能为空")
  private Long wId;
  private Double wFine;
  private Double wReward;

}
