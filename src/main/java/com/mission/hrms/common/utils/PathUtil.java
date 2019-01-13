package com.mission.hrms.common.utils;

/**
 * @author mission
 * @date 2018/8/19 0019-15:13
 */

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.io.File;

/**
 * 注意路径的 / 拼接问题
 */
@Slf4j
@Configuration
@ConfigurationProperties(prefix = "web")
public class PathUtil {

  @Value("${web.upload-path}")
  private static String basePath;


  private static String seperator=System.getProperty("file.separator");

  /**
   * 获得基本路径
   * @return
   */
  public static String getBasePath(){
    //获得系统名字
    String os=System.getProperty("os.name");

    if (basePath==null) {
      if (os.toLowerCase().startsWith("win")) {
        basePath = "D:/projectdev/hrms";
      } else {
        basePath = "/home/wteam/staticpath/";
      }
    }
    basePath=basePath.replace("/",seperator);
    log.info("--->>>"+basePath);
    return  basePath;
  }

  /*
   *获得图片相对路径
   */
  public static String getImagepath(String sign){
    String imagePath="/upload/images/"+sign+"/";
    return imagePath.replace("/",seperator);
  }

  /*
   *获得文件路径
   */
  public static String getFilepath(String sign){
    String imagePath="/upload/files/"+sign+"/";
    return imagePath.replace("/",seperator);
  }


  /**
   * 获取输入文件流的扩展名
   * @param fileName
   * @return
   */
  public static String getFileExtension(String fileName) {
    String originalFileName=fileName;
    return originalFileName.substring(originalFileName.lastIndexOf("."));
  }


  /**
   * 如果需要
   * 创建目标路径,调用此方法
   * @param targetAddr
   */
  public static void makeDirPath(String targetAddr) {
    String realFileParentPath= getBasePath()+targetAddr;
    File dirPath=new File(realFileParentPath);
    if (!dirPath.exists()) {
      dirPath.mkdirs();
    }
  }
}
