---
title: 关键字-static指南
category: 03-面向对象
topic: 40-语言特性
created: 2026-01-27
reviewed: 2026-02-02
tags: [java, 面向对象]
status: active
---

```java
class Person {  
    private static int count =0;  
  
    private String name;  
    private int age;  
  
    public Person(String name, int age){  
        this.name = name;  
        this.age = age;  
        Person.count ++;  
    }  
    public static int getCount(){  
        return Person.count;  
    }  
}  
  
public class Main{  
    public static  void main(String[] args ){  
        Person p1 = new Person("xiao hong", 12);  
        Person p2 = new Person("xiao ming", 13);  
        System.out.println("示例个数：" + Person.getCount());  
    }  
}
```

