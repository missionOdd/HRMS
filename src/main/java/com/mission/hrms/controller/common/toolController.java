package com.mission.hrms.controller.common;

import com.mission.hrms.common.bo.ImageHolder;
import com.mission.hrms.common.utils.ImgUtil;
import com.mission.hrms.common.vo.ResultVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author mission
 * @date 2019/1/12 0012-15:54
 */
@Api(value="工具Controller",tags={"工具的接口"})
@RestController
public class toolController {

  @ApiOperation("图片上传")
  @PostMapping("api/uploadpic")
  public ResultVO upload(@RequestParam MultipartFile file){

    ImageHolder imageHolder = null;
    try {
      imageHolder =new ImageHolder(file.getOriginalFilename(),file.getInputStream());
    } catch (IOException e) {
      e.printStackTrace();
    }

    String url = ImgUtil.generateThumbnail(imageHolder,"test");
    // MyFileUtil.saveFile();

    return ResultVO.ok(url);
  }

}
