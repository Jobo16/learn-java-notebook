

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