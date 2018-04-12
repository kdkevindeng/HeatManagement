package com.thinkgem.jeesite.modules.heatexchange.socket;

import com.thinkgem.jeesite.common.exception.AppException;
import com.thinkgem.jeesite.common.utils.ByteArrayUtils;
import com.thinkgem.jeesite.modules.heatexchange.admin.entity.addrdic.JobHeatDic;
import com.thinkgem.jeesite.modules.heatexchange.admin.service.addrdic.JobHeatDicService;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.filterchain.DefaultIoFilterChainBuilder;
import org.apache.mina.core.future.ConnectFuture;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.serialization.ObjectSerializationCodecFactory;
import org.apache.mina.transport.socket.nio.NioSocketConnector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Map;

/**
 * Created by lizhi on 2017/11/19.
 */
@Service("SendCmdService")
public class SendCmdService {
    @Autowired
    private JobHeatDicService jobHeatDicService;
    private NioSocketConnector connector;
    @Value("${heat.cmd.host}")
    private String ipaddress="192.168.0.102";
    @Value("${heat.cmd.port}")
    private int port=5001;

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public void connect(){
        if(this.connector!=null&&this.connector.isActive()){
            System.out.println("已经与服务器（"+ipaddress+":"+port+"）建立连接!不再重复连接！");
        }else {
//                this.connector=new Socket(ipaddress,port);
            // 创建Socket
            connector= new NioSocketConnector();
            //设置传输方式
            DefaultIoFilterChainBuilder chain = connector.getFilterChain();
            ProtocolCodecFilter filter = new ProtocolCodecFilter(new ObjectSerializationCodecFactory());
            chain.addLast("objectFilter", filter);
            //设置消息处理
            connector.setHandler(new MinaClientHanlder());
            //超时设置
            connector.setConnectTimeoutCheckInterval(30);
            //连接
            ConnectFuture cf = connector.connect(new InetSocketAddress(this.ipaddress, this.port));
//            cf.awaitUninterruptibly();
//            cf.getSession().getCloseFuture().awaitUninterruptibly();
//            connector.dispose();
            System.out.println("与服务器（"+ipaddress+":"+port+"）建立连接!");
        }
    }
    /**
     * 生产发送指令
     * @param stationCode 站点号（1 byte）
     * @param modbusAddr modbus地址
     * @param data 数据（2 byte）
     *  命令格式：站点号（1字节）+写命令（1字节，0X0A）+地址（2字节）+地址数（2字节，整数01浮点数02）+字节数（1字节，整数02，浮点数04）+数据（整数2字节，浮点数4字节）+校验（2字节）
     *  地址浮点数-1
     *  整数11字节
     * 浮点数13字节
     * */
    public byte[] gen(int stationCode,int modbusAddr,int data) throws AppException {
        if(modbusAddr>0){
            byte[] cmd=new byte[9];
            //stationCode 站点号（1 byte）
            cmd[0]= (byte) stationCode;
            //写命令（1字节，0x10)
            cmd[1]= (byte) 0x10;
            //地址（2字节）
            byte[] plcAddressArray = ByteArrayUtils.intToByteArray2(modbusAddr-400000>0?modbusAddr-400000:modbusAddr);
            cmd[2]= plcAddressArray[0];
            cmd[3]= plcAddressArray[1];
            //地址数（2字节，整数01浮点数02）
            cmd[4]= (byte) 0x00;
            cmd[5]= (byte) 0x01;
            //字节数（1字节，整数02，浮点数04）
            cmd[6]= (byte) 0x02;
            //数据（2 byte）
            byte[] dataArray = ByteArrayUtils.intToByteArray2(data);
            cmd[7]= dataArray[0];
            cmd[8]= dataArray[1];
            //CRC16（2 byte）
            int crc16 = ByteArrayUtils.getCRC16(cmd);
            byte[] crc16Array = ByteArrayUtils.intToByteArray2(crc16);
            byte[] crc16ArrayReverse=new byte[2];
            crc16ArrayReverse[0]=crc16Array[1];
            crc16ArrayReverse[1]=crc16Array[0];
            byte[] cmdcrc16 = ArrayUtils.addAll(cmd, crc16ArrayReverse);
            return cmdcrc16;
        }else {
            throw new AppException("modbus地址错误");
        }
    }
    /**
     * 生产发送指令
     * @param stationCode 站点号（1 byte）
     * @param modbusAddr modbus地址
     * @param data 数据（2 byte）
     *  命令格式：站点号（1字节）+写命令（1字节，0X0A）+地址（2字节）+地址数（2字节，整数01浮点数02）+字节数（1字节，整数02，浮点数04）+数据（整数2字节，浮点数4字节）+校验（2字节）
     *  地址浮点数-1
     *  整数11字节
     * 浮点数13字节
     * */
    public byte[] gen(int stationCode,int modbusAddr,float data) throws AppException {
        if(modbusAddr>0){
            byte[] cmd=new byte[11];
            //stationCode 站点号（1 byte）
            cmd[0]= (byte) stationCode;
            //写命令（1字节，10)
            cmd[1]= (byte) 0x10;
            //地址（2字节）
            byte[] plcAddressArray = ByteArrayUtils.intToByteArray2((modbusAddr-400000>0?modbusAddr-400000:modbusAddr)-1);
            cmd[2]= plcAddressArray[0];
            cmd[3]= plcAddressArray[1];
            //地址数（2字节，整数01浮点数02）
            cmd[4]= (byte) 0x00;
            cmd[5]= (byte) 0x02;
            //字节数（1字节，整数02，浮点数04）
            cmd[6]= (byte) 0x04;
            //数据（2 byte）
            byte[] dataArray = ByteArrayUtils.intToByteArray(Float.floatToIntBits(data));
            cmd[7]= dataArray[2];
            cmd[8]= dataArray[3];
            cmd[9]= dataArray[0];
            cmd[10]= dataArray[1];
            //CRC16（2 byte）
            int crc16 = ByteArrayUtils.getCRC16(cmd);
            byte[] crc16Array = ByteArrayUtils.intToByteArray2(crc16);
            byte[] crc16ArrayReverse=new byte[2];
            crc16ArrayReverse[0]=crc16Array[1];
            crc16ArrayReverse[1]=crc16Array[0];
            byte[] cmdcrc16 = ArrayUtils.addAll(cmd, crc16ArrayReverse);
            return cmdcrc16;
        }else {
            throw new AppException("modbus地址错误");
        }
    }

    /**
     * 发送指令
     * @param stationCode 站点号（1 byte）
     * @param plcAddr PLC地址（2 byte）
     * @param data 数据（2 byte）
     * */
    public void send(int stationCode,String plcAddr,String data) throws IOException, AppException {
        if(StringUtils.isNotEmpty(plcAddr)){
            JobHeatDic addrDic = this.jobHeatDicService.getByPlcAddr(plcAddr.toUpperCase());
            if(addrDic!=null&&addrDic.getModbusAddr()!=null&&addrDic.getModbusAddr()>0){
                byte[] cmd=null;
                if(addrDic.getDataType()==1){
                    //整形
                    cmd = this.gen(stationCode, addrDic.getModbusAddr(), Integer.parseInt(data));
                }else if(addrDic.getDataType()==2){
                    //浮点型
                    cmd = this.gen(stationCode,  addrDic.getModbusAddr(), Float.parseFloat(data));
                }
                if(cmd!=null&&cmd.length>0){
                    if(!(this.connector!=null&&this.connector.isActive())){//如果没连接或者断开
                        //重新连接
                        this.connect();
                    }
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
//            e.printStackTrace();
                    }
                    Map<Long, IoSession> sessions = this.connector.getManagedSessions();
                    if(sessions!=null&&sessions.size()>0){
                        for (Map.Entry<Long, IoSession> entry : sessions.entrySet()) {
                            IoSession session = entry.getValue();
                            IoBuffer buffer=IoBuffer.allocate(cmd.length);
                            buffer.put(cmd);
                            buffer.flip();
                            session.write(buffer);
                            System.out.println("发送成功");
                        }
                    }else {

                        throw new AppException("建立连接失败！");
                    }
                }else{

                    throw new AppException("指令错误！");
                }
            }else{

                throw new AppException("Modbus地址参数不存在！");
            }

        }else{

            throw new AppException("PLC地址参数错误！");
        }
    }
}
