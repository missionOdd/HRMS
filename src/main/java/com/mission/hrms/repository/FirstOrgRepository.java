package com.mission.hrms.repository;

import com.mission.hrms.entity.FirstOrg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

/**
 * (FirstOrg)表数据库JPA储存库
 *
 * @author makejava
 * @since 2019-01-11 14:03:50
 */
@RepositoryRestResource(path="firstOrg")
@Repository
public interface FirstOrgRepository extends JpaRepository<FirstOrg,Long>{
}