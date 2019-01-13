package com.mission.hrms.common.swagger;

import com.mg.swagger.framework.service.MgStorageService;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author mission
 * @date 2019/1/10 0010-19:30
 */
@Service
public class SwaggerStorageService implements MgStorageService {

  /**
   * 演示暂且使用Map来缓存，使用的时候尽量使用数据库来存储，才能持久化<br/>
   * 例：@Autowired StorageMapper storageMapper;
   */
  private static volatile Map<String, String> dataMap = new ConcurrentHashMap<>();

  /**
   * 使用数据库来存储，例：
   * storageMapper.select(key);
   */
  @Override
  public String get(String key) {
    return dataMap.get(key);
  }

  /**
   * 使用数据库来存储，例：
   * storageMapper.updateOrInsert(key, value);
   */
  @Override
  public void put(String key, String value) {
    dataMap.put(key, value);
  }
}
