package com.mission.hrms.repository;

import com.mission.hrms.entity.Position;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (Position)表数据库JPA储存库
 *
 * @author makejava
 * @since 2019-01-11 14:03:50
 */
@RepositoryRestResource(path="position")
@Repository
public interface PositionRepository extends JpaSpecificationExecutor<Position>,JpaRepository<Position,Long>{

  List<Position> findByPWageStandardLike(String wageStandard);

  List<Position> findByPWageStandard(String wageStandard);
}