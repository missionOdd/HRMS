package com.mission.hrms.repository;

import com.mission.hrms.entity.PositionJob;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * (PositionJob)表数据库JPA储存库
 *
 * @author makejava
 * @since 2019-01-11 14:03:50
 */
@RepositoryRestResource(path="positionJob")
@Repository
public interface PositionJobRepository extends JpaSpecificationExecutor<PositionJob>,JpaRepository<PositionJob,Long>{
}