package com.thinkgem.jeesite.common.utils;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.Map;

/**
 * Created by lizhi on 2017/8/29.
 */
public class JavaBeanUtil {

    public static <T extends Object> void javaBean2Map(T t, Map<String, Object> map){

        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(t.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (PropertyDescriptor property : propertyDescriptors) {
                String key = property.getName();
                // 过滤class属性
                if (!key.equals("class")) {
                    // 得到property对应的getter方法
                    Method getter = property.getReadMethod();
                    Object value = getter.invoke(t);
                    map.put(key, value);
                }
            }
        } catch (Exception e) {
            System.out.println("javaBean2Map Error " + e);
        }

    }
    public static <T extends Object> void map2JavaBean(T t, Map<String, Object> map){

        BeanInfo beanInfo = null;
        try {
            beanInfo = Introspector.getBeanInfo(t.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (PropertyDescriptor property : propertyDescriptors) {
                String key = property.getName();
                // 过滤class属性
                if (!key.equals("class")) {
                    // 得到property对应的getter方法
                    Method setter = property.getWriteMethod();
                    try {
                        setter.invoke(t,map.get(key));
                    } catch (Exception e) {
                        //e.printStackTrace();
                    }
                }
            }
        } catch (IntrospectionException e) {
            //e.printStackTrace();
        }

    }
    public static <T extends Object> void javaBean2JavaBean(T t, T target){
        BeanInfo beanInfo = null;
        try {
            beanInfo = Introspector.getBeanInfo(t.getClass());
        } catch (IntrospectionException e) {
            e.printStackTrace();
        }
        BeanInfo targetBeanInfo = null;
        try {
            targetBeanInfo = Introspector.getBeanInfo(target.getClass());
        } catch (IntrospectionException e) {
            e.printStackTrace();
        }
        if(beanInfo!=null&&targetBeanInfo!=null){
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            PropertyDescriptor[] targetPropertyDescriptors = targetBeanInfo.getPropertyDescriptors();

            for (PropertyDescriptor property : propertyDescriptors) {
                String key = property.getName();
                // 过滤class属性
                if (!key.equals("class")) {
                    for(PropertyDescriptor targetProperty : targetPropertyDescriptors){
                        String targetKey = targetProperty.getName();
                        if(key.equals(targetKey)){
                            try {
                                Method setter = targetProperty.getWriteMethod();
                                setter.invoke(target,property.getReadMethod().invoke(t));
                            }catch (Exception e){

                            }
                            break;
                        }
                    }
                }
            }
        }

    }
}
