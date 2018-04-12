package com.thinkgem.jeesite.common.exception;

/**
 * Created by lizhi on 2017/11/18.
 * 系统异常
 */
public class AppException extends Exception {
    public static int CODE_PARAMETER=1;
    private int code;
    public AppException(String message){
        this(AppException.CODE_PARAMETER,message);
    }
    public AppException(int code,String message){
        super(message);
        this.code=code;
    }
}
