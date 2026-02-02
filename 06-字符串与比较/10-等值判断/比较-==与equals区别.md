---
title: 比较-==与equals区别
category: 06-字符串与比较
topic: 10-等值判断
created: 2026-01-30
reviewed: 2026-02-02
tags: [java, 字符串与比较]
status: active
---

在Java中，`==`和`equals()`都是用于比较操作，但它们的**比较对象**和**比较规则**有本质区别。以下是详细说明：

---

### 1. `==`运算符

- **比较对象**：基本数据类型（如`int`、`char`）和引用类型（如对象、数组）。
    
- **比较规则**：
    
    - 对于**基本数据类型**：比较的是**值**是否相等。
        
        java
        
        java
        
        下载
        
        复制
        
        ```
        int a = 5;
        int b = 5;
        System.out.println(a == b); // true，值相等
        ```
        
    - 对于**引用类型**：比较的是**内存地址**（即是否指向同一个对象）。
        
        java
        
        java
        
        下载
        
        复制
        
        ```
        String s1 = new String("hello");
        String s2 = new String("hello");
        System.out.println(s1 == s2); // false，不同对象，地址不同
        ```
        
    

---

### 2. `equals()`方法

- **来源**：`Object`类的方法，所有类都继承该方法。
    
- **默认行为**：默认实现与`==`相同，比较内存地址。
    

    ```
    // Object类中的equals()默认实现
    public boolean equals(Object obj) {
        return (this == obj);
    }
    ```
    
- **重写目的**：为了让引用类型能够**比较内容**而非地址。许多Java内置类（如`String`、`Integer`）已重写`equals()`。
    
    java
    
    java
    
    下载
    
    复制
    
    ```
    String s1 = new String("hello");
    String s2 = new String("hello");
    System.out.println(s1.equals(s2)); // true，String重写了equals()，比较内容
    ```
    

---

### 3. 关键区别总结

|特性|`==`|`equals()`|
|---|---|---|
|**比较对象**​|基本类型（值）和引用类型（地址）|仅引用类型（默认比较地址，可重写）|
|**比较内容**​|不支持（除非重写`==`，但Java不允许）|支持（需重写方法）|
|**性能**​|高效（直接比较值或地址）|可能较慢（如重写后需遍历内容）|

---

### 4. 注意事项

- **字符串常量池**：字符串字面量（如`"hello"`）会放入常量池，相同字面量可能指向同一对象。
    

    
    ```
    String s1 = "hello"; // 常量池中的对象
    String s2 = "hello"; // 指向同一对象
    System.out.println(s1 == s2); // true，地址相同
    ```
    
- **重写`equals()`的规范**：
    
    - 必须重写`hashCode()`方法（若对象用于哈希表，如`HashMap`）。
        
    - 满足自反性、对称性、传递性等契约（详见`Object`类文档）。
        
    

---

### 示例代码对比

java

java

下载

复制

```
public class ComparisonExample {
    public static void main(String[] args) {
        // 基本类型：== 比较值
        int x = 10, y = 10;
        System.out.println("x == y: " + (x == y)); // true

        // 引用类型：== 比较地址
        String str1 = new String("Java");
        String str2 = new String("Java");
        System.out.println("str1 == str2: " + (str1 == str2)); // false
        System.out.println("str1.equals(str2): " + str1.equals(str2)); // true

        // 常量池字符串：== 可能为true
        String str3 = "Java";
        String str4 = "Java";
        System.out.println("str3 == str4: " + (str3 == str4)); // true
    }
}
```

---

### 总结

- 基本类型比较值用`==`。
    
- 引用类型比较地址用`==`，比较内容用`equals()`（需确保该类已重写该方法）。
    
- 字符串常量池等特殊情况需注意`==`的行为。

