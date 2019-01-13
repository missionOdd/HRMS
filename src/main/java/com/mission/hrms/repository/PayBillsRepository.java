package com.mission.hrms.repository;

import com.mission.hrms.entity.PayBills;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

/**
 * (PayBills)表数据库JPA储存库
 *
 * @author makejava
 * @since 2019-01-11 14:03:50
 */
@RepositoryRestResource(path="payBills")
@Repository
public interface PayBillsRepository extends JpaSpecificationExecutor<PayBills>,JpaRepository<PayBills,Long>{

  @Transactional
  @Modifying
  @Query(value = "update pay_bills p set p.pb_registrant=?1 , p.pb_state = ?2,p.pb_real_total=?3 where p.pb_id =?4",nativeQuery = true)
  int updateSomeById(  String pbRegistrant,Integer state,Double pbRealTotal,Long pdId);
}