package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Set;

/**
 * @author mission
 * @date 2019/1/10 0010-16:50
 */
@Entity
@Table(name = "position_type")
//Lombok
@Data
@Accessors(chain = true)
public class PositionType {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long ptId;
  @Column(nullable = false)
  private String ptName;

  @OneToMany(cascade = CascadeType.ALL)
  @JoinColumn(name = "pj_parent")
  private Set<PositionJob> positionJobs;
}
