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