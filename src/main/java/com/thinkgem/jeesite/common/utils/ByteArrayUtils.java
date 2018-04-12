package com.thinkgem.jeesite.common.utils;

/**
 * Created by lizhi on 2017/4/1.
 */
public class ByteArrayUtils {
    /**
     * 通过byte数组取到short
     *
     * @param b
     * @return
     */
    public static int getShort(byte[] b) {
        Integer result;
        if(b[0]<0){
            //负数
            if(b[1]<0){//负数
                result= ((b[0]) << 8|0xFF) & b[ 1] ;
            }else {//正数
                result= ((b[0]) << 8)| b[ 1] ;
            }
        }else{
            // 正数
            result= (b[0]& 0xFF) << 8 | b[ 1] & 0xFF;
        }
        System.out.println(Integer.toBinaryString(b[0]));
        System.out.println(Integer.toBinaryString(b[1]));
        System.out.println(Integer.toBinaryString(result));
        System.out.println((result));
        return result;
    }
    //byte 数组与 int 的相互转换
    public static int byteArrayToInt(byte[] b) {
        return   b[3] & 0xFF |
                (b[2] & 0xFF) << 8 |
                (b[1] & 0xFF) << 16 |
                (b[0] & 0xFF) << 24;
    }
    //int转换为byte[]
    public static byte[] intToByteArray(int a) {
        return new byte[] {
                (byte) ((a >> 24) & 0xFF),
                (byte) ((a >> 16) & 0xFF),
                (byte) ((a >> 8) & 0xFF),
                (byte) (a & 0xFF)
        };
    }

    /**
     * 浮点转换为字节
     *
     * @param f
     * @return
     */
    public static byte[] floatToByteArray(float f) {

        // 把float转换为byte[]
        int fbit = Float.floatToIntBits(f);

        byte[] b = new byte[4];
        for (int i = 0; i < 4; i++) {
            b[i] = (byte) (fbit >> (24 - i * 8));
        }

        // 翻转数组
        int len = b.length;
        // 建立一个与源数组元素类型相同的数组
        byte[] dest = new byte[len];
        // 为了防止修改源数组，将源数组拷贝一份副本
        System.arraycopy(b, 0, dest, 0, len);
        byte temp;
        // 将顺位第i个与倒数第i个交换
        for (int i = 0; i < len / 2; ++i) {
            temp = dest[i];
            dest[i] = dest[len - i - 1];
            dest[len - i - 1] = temp;
        }

        return dest;

    }
    //byte 数组为2个字节与 int 的相互转换
    public static int byteArray2ToInt(byte[] b) {
        byte[] newarray=new byte[4];
        newarray[0]=0;
        newarray[1]=0;
        newarray[2]=b[0];
        newarray[3]=b[1];
        return   byteArrayToInt(newarray);
    }
    //int转换为byte[]为2个字节
    public static byte[] intToByteArray2(int a) {
        byte[] array=intToByteArray(a);
        byte[] newarray=new byte[2];
        newarray[0]=array[2];
        newarray[1]=array[3];
        return newarray;
    }
    //int转换为byte[]为2个字节
    public static byte[] floatToByteArray2(float a) {
        byte[] array=floatToByteArray(a);
        byte[] newarray=new byte[2];
        newarray[0]=array[2];
        newarray[1]=array[3];
        return newarray;
    }
    //转为有符号int
    public static int byteArray2ToSignedInt(byte[] b) {
        byte[] newarray=new byte[4];
        if(b[0]>64){
            newarray[0]=64;
        }else{
            newarray[0]=0;
        }
        newarray[1]=0;
        newarray[2]=b[0];
        newarray[3]=b[1];
        return   byteArrayToInt(newarray);
    }
    //二进制字符串转byte数组
    public static byte[] bitStrToByteArray(String str){
        if (str == null || str.equals("")) {
            return null;
        }
        char[] hexChars = str.toCharArray();
        if(hexChars.length%8!=0){
            return null;
        }
        byte[] d = new byte[hexChars.length/8];
        for (int i = 0; i < d.length; i++) {
            d[i] = (byte) ((byte) Integer.parseInt(String.valueOf(hexChars[i*8])) << 7 |
                    (byte) Integer.parseInt(String.valueOf(hexChars[i*8+1])) << 6|
                    (byte) Integer.parseInt(String.valueOf(hexChars[i*8+2])) << 5|
                    (byte) Integer.parseInt(String.valueOf(hexChars[i*8+3])) << 4|
                    (byte) Integer.parseInt(String.valueOf(hexChars[i*8+4])) << 3|
                    (byte) Integer.parseInt(String.valueOf(hexChars[i*8+5])) << 2|
                    (byte) Integer.parseInt(String.valueOf(hexChars[i*8+6])) << 1|
                    (byte) Integer.parseInt(String.valueOf(hexChars[i*8+7])) );
        }
        return d;
    }
    //byte数组转二进制字符串
    public static String byteArrayTobitStr(byte[] rawdata){
        String str="";
        for(byte item:rawdata){
            String itemStr = Integer.toBinaryString(item);
            if(itemStr.length()<8){
                itemStr="00000000"+itemStr;
                itemStr=itemStr.substring(itemStr.length()-8);
            }else{
                itemStr=itemStr.substring(itemStr.length()-8);
            }
            str=str+itemStr;
        }
        return str;
    }

    /**
     * 计算CRC16校验码
     * @param bytes 要校验的数据
     * @return int 校验码
     * */
    public static int getCRC16(byte[] bytes) {
        int crc = 0x0000ffff;
        int polynomial = 0x0000a001;
        int i, j;
        for (i = 0; i < bytes.length; i++) {
            crc ^= ((int) bytes[i] & 0x000000ff);
            for (j = 0; j < 8; j++) {
                if ((crc & 0x00000001) != 0) {
                    crc >>= 1;
                    crc ^= polynomial;
                } else {
                    crc >>= 1;
                }
            }
        }

        return crc;

    }
}
