package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Set;

/**
 * @author mission
 * @date 2019/1/10 0010-16:25
 */
@Entity
@Table(name = "role")
//Lombok
@Data
@Accessors(chain = true)
public class Role {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long rId;// id

  @NotNull(message = "角色名不能为空")
  @Column(nullable = false)
  private String rName;//角色名
  private String rDesc;// 详细

  @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH},fetch = FetchType.LAZY)
  @JoinTable(name = "tb_role_privileges",joinColumns = @JoinColumn(name = "r_id"),inverseJoinColumns = @JoinColumn(name = "pr_id"))
  private Set<Privilege> privileges;//权限

}
