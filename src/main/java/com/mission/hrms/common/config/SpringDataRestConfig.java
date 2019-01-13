package com.mission.hrms.common.config;

import com.mission.hrms.entity.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;

/**
 * @author mission
 * @date 2019/1/12 0012-13:43
 */
@Configuration
public class SpringDataRestConfig {

  /**
   * 为了解决Spring Data Rest不暴露ID字段的问题。
   * 参考：http://tommyziegler.com/how-to-expose-the-resourceid-with-spring-data-rest/
   * Created by Dante on 2016/8/18.
   */
  @Bean
  public RepositoryRestConfigurer repositoryRestConfigurer() {

    return new RepositoryRestConfigurerAdapter() {
      @Override
      public void configureRepositoryRestConfiguration(
          RepositoryRestConfiguration config) {
        config.exposeIdsFor(Employee.class, Organization.class, PayBills.class, Position.class, PositionJob.class,
            PositionType.class,WageStandard.class,Wage.class);
      }
    };
  }

}
