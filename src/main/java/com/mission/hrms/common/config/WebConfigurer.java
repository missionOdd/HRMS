package com.mission.hrms.common.config;

import com.mission.hrms.common.utils.PathUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author mission
 * @date 2018/11/19 0019-22:22
 */
@Configuration
public class WebConfigurer extends WebMvcConfigurerAdapter {

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/upload/**").addResourceLocations("file:"+ PathUtil.getBasePath()+"/upload/");
  }

}