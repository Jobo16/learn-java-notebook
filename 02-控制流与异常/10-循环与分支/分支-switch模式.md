---
title: 分支-switch模式
category: 02-控制流与异常
topic: 10-循环与分支
created: 2026-01-26
reviewed: 2026-02-02
tags: [java, 控制流与异常]
status: active
---

```java
public class Second {  
    public static void main(String[] args){  
        int option = 1;  
        switch (option){  
            case 1:  
                System.out.println("selected 1");  
                break;  
            case 2:  
                System.out.println("selected 2");  
                break;  
            default:  
                System.out.println("selected others");  
                break;  
        }  
  
    }  
}

```
