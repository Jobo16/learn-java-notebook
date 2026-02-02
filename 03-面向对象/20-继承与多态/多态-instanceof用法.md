---
title: 多态-instanceof用法
category: 03-面向对象
topic: 20-继承与多态
created: 2026-01-27
reviewed: 2026-02-02
tags: [java, 面向对象]
status: active
---

```java
//instanceof variabel:  
public class Main {  
    public static void main(String[] args) {  
        Object obj = "Hello";  
        if (obj instanceof String s) {  
            //可以直接使用变量s:  
            System.out.println(s.toUpperCase());  
        }  
    }  
}
```

