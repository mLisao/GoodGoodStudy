package com.lisao.aspectjlib;

import android.util.Log;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.aspectj.lang.reflect.SourceLocation;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lisao on 2016/9/8.
 */
@Aspect
public class BehaviorAspect {
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final String TAG = "BehaviorAspect";

    @Pointcut("execution(@com.lisao.aspectjlib.BehaviorTrace * *(..))")
    public void behaviorPointCut() {
    }

    @Around("behaviorPointCut()")
    public Object behaviorAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        //方法执行前
        MethodSignature methodSignature = (MethodSignature) proceedingJoinPoint.getSignature();
        Method method = methodSignature.getMethod();
        BehaviorTrace behaviorTrace = method.getAnnotation(BehaviorTrace.class);
        String behaviorValue = behaviorTrace.value();
        Log.d(TAG, behaviorValue + "开始执行,当期时间" + dateFormat.format(new Date()));
        long begin = System.currentTimeMillis();
        //方法执行
        Object result = proceedingJoinPoint.proceed();
        //方法结束
        long end = System.currentTimeMillis();
        Log.d(TAG, methodSignature.getMethod().getName() + "总共用时" + (end - begin));
        return result;

    }

    @Pointcut("execution(@com.lisao.aspectjlib.BehaviorPagerScope * *(..))")
    public void behaviorScope() {
    }

//    @Around("behaviorScope()")
//    public Object pagerScope(ProceedingJoinPoint joinPoint) throws Throwable {
//        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
//        SourceLocation sourceLocation = joinPoint.getSourceLocation();
//        Class clz = sourceLocation.getWithinType();
//        Method method = methodSignature.getMethod();
//        BehaviorPagerScope annotation = method.getAnnotation(BehaviorPagerScope.class);
//        Field field = clz.getDeclaredField(annotation.fieldName());
//        field.setAccessible(true);
//        String value = (String) field.get(joinPoint.getTarget());
//        PagerScope scope = annotation.value();
//        Log.d(TAG, clz.getSimpleName() + "生命周期" + scope.toString() + "开始执行" + "name is " + value);
//        Object result = joinPoint.proceed();
//        return result;
//    }
}