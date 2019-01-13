package com.mission.hrms.common.config;

import org.hibernate.dialect.MySQL5InnoDBDialect;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MySQL5DialectUTF8 extends MySQL5InnoDBDialect {

  @Override
  public String getTableTypeString() {
    return " ENGINE=InnoDB DEFAULT CHARSET=utf8";
  }
}
