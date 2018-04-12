package com.thinkgem.jeesite.test;

import com.thinkgem.jeesite.common.exception.AppException;
import com.thinkgem.jeesite.modules.heatexchange.socket.SendCmdService;

import java.io.IOException;

public class Test {

	public static void main(String[] args) {
		/*SendCmdService sendCmdService=new SendCmdService();
		try {
			sendCmdService.sendInt(1,"",1);
			System.out.println("结束!");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (AppException e) {
			e.printStackTrace();
		}*/
		System.out.println("12.00".indexOf("."));
	}
}
