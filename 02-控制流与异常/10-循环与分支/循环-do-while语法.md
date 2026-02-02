---
title: 循环-do-while语法
category: 02-控制流与异常
topic: 10-循环与分支
created: 2026-01-26
reviewed: 2026-02-02
tags: [java, 控制流与异常]
status: active
---



```
public class Second {  
    public static void main(String[] args){  
        int sum = 0;  
        int m = 20;  
        int n = 100;  
        //使用do while 计算  
        do {  
            sum = sum + m++;  
        } while (m < n);  
        System.out.println(sum);  
  
  
    }  
}
```

