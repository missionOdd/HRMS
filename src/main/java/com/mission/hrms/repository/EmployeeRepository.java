package com.mission.hrms.repository;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.Position;
import com.mission.hrms.entity.projection.WageStandArch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.rest.core.annotation.Description;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (Employee)表数据库JPA储存库
 *
 * @author makejava
 * @since 2019-01-11 14:03:49
 */
@RepositoryRestResource(path="employee",
    exported = true,
    collectionResourceDescription =@Description("employee基本信息资源"))
@Repository
public interface EmployeeRepository extends JpaSpecificationExecutor<Employee>,JpaRepository<Employee,Long>{

  List<WageStandArch> findByPosition(Position position);

  List<WageStandArch> findByPositionIn(List<Position> position);

  List<Employee> findByPositionIsIn(List<Position> position);
}