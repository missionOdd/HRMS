package com.mission.hrms.repository;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.Wage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * (Wage)表数据库JPA储存库
 *
 * @author makejava
 * @since 2019-01-11 14:03:50
 */
@RepositoryRestResource(path="wage")
@Repository
public interface WageRepository extends JpaSpecificationExecutor<Wage>,JpaRepository<Wage,Long>{

  List<Wage> findByEmployeeAndWState(Employee employee ,Integer state);

  @Transactional
  @Modifying
  @Query(value = "update wage w set w.w_reward =?1, w.w_fine=?2 where w.w_id = ?3",nativeQuery = true)
  int updateSomeById( Double wReward,  Double wFine,Long wId);

}