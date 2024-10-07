package cn.xiaohamigua.monitor.sdk.push;

import cn.xiaohamigua.monitor.sdk.model.LogMessage;

/**
 * @author 林圣涛
 * @description 发布
 * @create 2024-10-2 17:20
 */
public interface IPush {

    void open(String host , int port);

    void send(LogMessage logMessage);
}
