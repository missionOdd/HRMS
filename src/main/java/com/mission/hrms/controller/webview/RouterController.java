package com.mission.hrms.controller.webview;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author mission
 * @date 2019/1/11 0011-19:25
 */
@Controller
@RequestMapping("page")
public class RouterController {

  @GetMapping("arch")
  public String Archive(){
    return "ftl/archive";
  }

  @GetMapping("login")
  public String login(){
    return "ftl/login";
  }

  @GetMapping("archcheck")
  public String archcheck(){
    return "ftl/archcheck";
  }

  @GetMapping("archlist")
  public String archlist(){
    return "ftl/listArch";
  }

  @GetMapping("wagestandard")
  public String wagestandard(){
    return "ftl/wageStand";
  }

  @GetMapping("listwagestandard")
  public String listwagestandard(){
    return "ftl/listWageStand";
  }

  @GetMapping("listpbs")
  public String listPayBills(){
    return "ftl/listPayBills";
  }


  @GetMapping("pay")
  public String pay(){
    return "ftl/pay";
  }

}
