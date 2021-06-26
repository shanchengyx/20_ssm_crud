package com.gyx.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * 服务器返回的通用的类
 */
public class Message {
    private int code;//状态码 1-成功 2-失败
    private String msg;//提示信息
    private Map<String, Object> extend = new HashMap<>();//返回的数据

    public Message() {
    }

    public Message(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    @Override
    public String toString() {
        return "Message{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", extend=" + extend +
                '}';
    }

    /**
     * 生成成功的message的方法
     *
     * @return 获得的message
     */
    public static Message success() {
        return new Message(1, "成功");
    }

    /**
     * 生成失败的message的方法
     *
     * @return 获得的message
     */
    public static Message fail() {
        return new Message(2, "失败");
    }

    /**
     * @param key 添加的key
     * @param obj 添加的对象
     */
    public Message add(String key, Object obj) {
        extend.put(key, obj);
        return this;
    }
}
