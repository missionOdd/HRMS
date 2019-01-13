package com.mission.hrms.repository;

import com.mission.hrms.entity.WageStandard;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * (WageStandard)表数据库JPA储存库
 *
 * @author makejava
 * @since 2019-01-11 14:03:50
 */
@RepositoryRestResource(path="wageStandard")
@Repository
public interface WageStandardRepository extends JpaSpecificationExecutor<WageStandard>,JpaRepository<WageStandard,Long>{
}