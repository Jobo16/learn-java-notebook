---
title: BigDecimal-核心API
category: 05-数值处理
topic: 10-BigDecimal
created: 2026-01-26
reviewed: 2026-02-02
tags: [java, 数值处理]
status: active
---

`BigDecimal`是 Java 中用于**高精度计算**的类，专门解决浮点数精度丢失问题（如 `double`运算不准确）。以下是详细使用教程：

---

## 1. 为什么需要 BigDecimal？

### 浮点数精度问题示例

```
// 使用 double 计算
System.out.println(0.1 + 0.2); // 输出：0.30000000000000004
System.out.println(1.0 - 0.8); // 输出：0.19999999999999996
```

### BigDecimal 的优势

- 精确表示小数
    
- 可控的舍入模式
    
- 适合金融、科学计算等场景
    

---

## 2. 创建 BigDecimal 对象

### 方式1：使用字符串构造（推荐）

```
BigDecimal bd1 = new BigDecimal("0.1");
BigDecimal bd2 = new BigDecimal("0.2");
```

### 方式2：使用 valueOf 方法（推荐）

```
BigDecimal bd3 = BigDecimal.valueOf(0.1); // 内部转字符串，避免精度问题
BigDecimal bd4 = BigDecimal.valueOf(10L); // 从 long 创建
```

### 方式3：使用 double 构造（不推荐）

```
// 可能仍有精度问题
BigDecimal bd5 = new BigDecimal(0.1); // 实际值：0.100000000000000005551115...
```

---

## 3. 基本运算

### 加法

```
BigDecimal a = new BigDecimal("0.1");
BigDecimal b = new BigDecimal("0.2");
BigDecimal sum = a.add(b);
System.out.println(sum); // 0.3
```

### 减法

```
BigDecimal result = a.subtract(b);
```

### 乘法

```
BigDecimal product = a.multiply(b);
```

### 除法（需要指定精度和舍入模式）

```
BigDecimal dividend = new BigDecimal("10");
BigDecimal divisor = new BigDecimal("3");

// 方式1：指定小数位数和舍入模式
BigDecimal quotient = dividend.divide(divisor, 2, RoundingMode.HALF_UP);
System.out.println(quotient); // 3.33

// 方式2：不指定精度（可能抛出 ArithmeticException）
// BigDecimal result = dividend.divide(divisor); // 无限小数会报错
```

---

## 4. 舍入模式（RoundingMode）

常用舍入模式：

|模式|描述|示例（保留0位小数）|
|---|---|---|
|`HALF_UP`|**四舍五入**（最常用）|2.5 → 3, 2.4 → 2|
|`HALF_DOWN`|五舍六入|2.5 → 2, 2.6 → 3|
|`HALF_EVEN`|银行家舍入（统计常用）|2.5 → 2, 3.5 → 4|
|`UP`|向远离0方向舍入|2.1 → 3, -2.1 → -3|
|`DOWN`|向0方向舍入（截断）|2.9 → 2, -2.9 → -2|
|`CEILING`|向正无穷舍入|2.1 → 3, -2.1 → -2|
|`FLOOR`|向负无穷舍入|2.9 → 2, -2.9 → -3|

### 使用示例

```
BigDecimal num = new BigDecimal("2.55");

// 四舍五入保留1位小数
BigDecimal rounded = num.setScale(1, RoundingMode.HALF_UP);
System.out.println(rounded); // 2.6

// 除法时指定舍入
BigDecimal result = num.divide(new BigDecimal("2"), 2, RoundingMode.HALF_UP);
```

---

## 5. 比较操作

### 使用 compareTo 方法（推荐）

```
BigDecimal a = new BigDecimal("1.0");
BigDecimal b = new BigDecimal("1.00");

System.out.println(a.equals(b)); // false（精度不同）
System.out.println(a.compareTo(b) == 0); // true（数值相等）
```

### 比较结果说明

- `a.compareTo(b) < 0`：a < b
    
- `a.compareTo(b) == 0`：a = b
    
- `a.compareTo(b) > 0`：a > b
    

---

## 6. 常用工具方法

### 设置精度

```
BigDecimal num = new BigDecimal("3.1415926");
num = num.setScale(4, RoundingMode.HALF_UP); // 3.1416
```

### 取绝对值

```
BigDecimal negative = new BigDecimal("-10.5");
BigDecimal abs = negative.abs(); // 10.5
```

### 取最大值/最小值

```
BigDecimal max = a.max(b);
BigDecimal min = a.min(b);
```

### 幂运算

```
BigDecimal base = new BigDecimal("2");
BigDecimal power = base.pow(10); // 2^10 = 1024
```

---

## 7. 数值转换

### 转换为基本类型

```
BigDecimal bd = new BigDecimal("123.45");

int intValue = bd.intValue();           // 123
long longValue = bd.longValue();        // 123
float floatValue = bd.floatValue();     // 123.45（可能损失精度）
double doubleValue = bd.doubleValue();  // 123.45（可能损失精度）

// 精确转换（可能抛出 ArithmeticException）
int exactInt = bd.intValueExact();      // 如果不是整数会报错
```

---

## 8. 格式化输出

### 使用 NumberFormat

```
BigDecimal amount = new BigDecimal("1234567.89");

NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.CHINA);
System.out.println(currencyFormat.format(amount)); // ￥1,234,567.89

NumberFormat numberFormat = NumberFormat.getNumberInstance();
numberFormat.setMaximumFractionDigits(2);
System.out.println(numberFormat.format(amount)); // 1,234,567.89
```

---

## 9. 最佳实践

### 1. 始终使用字符串或 valueOf 创建

```
// 正确
BigDecimal a = new BigDecimal("0.1");
BigDecimal b = BigDecimal.valueOf(0.1);

// 避免
BigDecimal c = new BigDecimal(0.1);
```

### 2. 除法必须指定舍入模式

```
// 正确
BigDecimal result = a.divide(b, 2, RoundingMode.HALF_UP);

// 错误（可能抛出异常）
// BigDecimal result = a.divide(b);
```

### 3. 比较数值使用 compareTo

```
if (a.compareTo(b) > 0) {
    // a > b
}
```

### 4. 注意不可变性

```
BigDecimal a = new BigDecimal("10");
a.add(new BigDecimal("5")); // 返回新对象，a 仍然是 10

// 正确用法
a = a.add(new BigDecimal("5")); // a 变为 15
```

---

## 10. 完整示例：金额计算

```
import java.math.BigDecimal;
import java.math.RoundingMode;

public class MoneyCalculation {
    public static void main(String[] args) {
        // 商品价格
        BigDecimal price = new BigDecimal("19.99");
        BigDecimal quantity = new BigDecimal("3");
        
        // 计算小计
        BigDecimal subtotal = price.multiply(quantity);
        
        // 计算税费（7%）
        BigDecimal taxRate = new BigDecimal("0.07");
        BigDecimal tax = subtotal.multiply(taxRate)
                               .setScale(2, RoundingMode.HALF_UP);
        
        // 计算总计
        BigDecimal total = subtotal.add(tax);
        
        System.out.println("单价: ￥" + price);
        System.out.println("数量: " + quantity);
        System.out.println("小计: ￥" + subtotal);
        System.out.println("税费: ￥" + tax);
        System.out.println("总计: ￥" + total);
    }
}
```

输出：

```
单价: ￥19.99
数量: 3
小计: ￥59.97
税费: ￥4.20
总计: ￥64.17
```

---

## 总结

- **创建**：优先使用字符串构造或 `valueOf()`
    
- **运算**：除法必须指定精度和舍入模式
    
- **比较**：使用 `compareTo()`而非 `equals()`
    
- **舍入**：根据业务需求选择合适的 `RoundingMode`
    
- **性能**：`BigDecimal`比浮点数慢，只在需要精确计算时使用

