package com.mission.hrms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class HrmsApplication {
  private static final Logger log= LoggerFactory.getLogger(HrmsApplication.class);
  public static void main(String[] args) {
    SpringApplication.run(HrmsApplication.class, args);
    log.info("===========================启动完毕===========================");
  }

}

