package com.ssm.pojo;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
public class Msg {
    /**
     * 状态码
     */
    private String code;
    /**
     * 状态信息
     */
    private String msg;

    /**
     * 返回的结果集
     */
    private Map<String, Object> resultMap = new HashMap<>();

    public static Msg sucess(){
        Msg msg = new Msg();
        msg.setCode("200");
        msg.setMsg("操作成功");
        return  msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode("500");
        msg.setMsg("操作失败");
        return  msg;
    }

    public Msg add(String objectName, Object obj){
        this.getResultMap().put(objectName, obj);
        return this;
    }

}
