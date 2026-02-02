---
title: BigDecimal-核心API
category: 05-数值处理
topic: 10-BigDecimal
created: 2026-01-26
reviewed: 2026-02-02
tags: [java, 数值处理]
status: active
---

`BigDecimal`鏄?Java 涓敤浜?*楂樼簿搴﹁绠?*鐨勭被锛屼笓闂ㄨВ鍐虫诞鐐规暟绮惧害涓㈠け闂锛堝 `double`杩愮畻涓嶅噯纭級銆備互涓嬫槸璇︾粏浣跨敤鏁欑▼锛?
---

## 1. 涓轰粈涔堥渶瑕?BigDecimal锛?
### 娴偣鏁扮簿搴﹂棶棰樼ず渚?
```
// 浣跨敤 double 璁＄畻
System.out.println(0.1 + 0.2); // 杈撳嚭锛?.30000000000000004
System.out.println(1.0 - 0.8); // 杈撳嚭锛?.19999999999999996
```

### BigDecimal 鐨勪紭鍔?
- 绮剧‘琛ㄧず灏忔暟
    
- 鍙帶鐨勮垗鍏ユā寮?    
- 閫傚悎閲戣瀺銆佺瀛﹁绠楃瓑鍦烘櫙
    

---

## 2. 鍒涘缓 BigDecimal 瀵硅薄

### 鏂瑰紡1锛氫娇鐢ㄥ瓧绗︿覆鏋勯€狅紙鎺ㄨ崘锛?
```
BigDecimal bd1 = new BigDecimal("0.1");
BigDecimal bd2 = new BigDecimal("0.2");
```

### 鏂瑰紡2锛氫娇鐢?valueOf 鏂规硶锛堟帹鑽愶級

```
BigDecimal bd3 = BigDecimal.valueOf(0.1); // 鍐呴儴杞瓧绗︿覆锛岄伩鍏嶇簿搴﹂棶棰?BigDecimal bd4 = BigDecimal.valueOf(10L); // 浠?long 鍒涘缓
```

### 鏂瑰紡3锛氫娇鐢?double 鏋勯€狅紙涓嶆帹鑽愶級

```
// 鍙兘浠嶆湁绮惧害闂
BigDecimal bd5 = new BigDecimal(0.1); // 瀹為檯鍊硷細0.100000000000000005551115...
```

---

## 3. 鍩烘湰杩愮畻

### 鍔犳硶

```
BigDecimal a = new BigDecimal("0.1");
BigDecimal b = new BigDecimal("0.2");
BigDecimal sum = a.add(b);
System.out.println(sum); // 0.3
```

### 鍑忔硶

```
BigDecimal result = a.subtract(b);
```

### 涔樻硶

```
BigDecimal product = a.multiply(b);
```

### 闄ゆ硶锛堥渶瑕佹寚瀹氱簿搴﹀拰鑸嶅叆妯″紡锛?
```
BigDecimal dividend = new BigDecimal("10");
BigDecimal divisor = new BigDecimal("3");

// 鏂瑰紡1锛氭寚瀹氬皬鏁颁綅鏁板拰鑸嶅叆妯″紡
BigDecimal quotient = dividend.divide(divisor, 2, RoundingMode.HALF_UP);
System.out.println(quotient); // 3.33

// 鏂瑰紡2锛氫笉鎸囧畾绮惧害锛堝彲鑳芥姏鍑?ArithmeticException锛?// BigDecimal result = dividend.divide(divisor); // 鏃犻檺灏忔暟浼氭姤閿?```

---

## 4. 鑸嶅叆妯″紡锛圧oundingMode锛?
甯哥敤鑸嶅叆妯″紡锛?
|妯″紡|鎻忚堪|绀轰緥锛堜繚鐣?浣嶅皬鏁帮級|
|---|---|---|
|`HALF_UP`|**鍥涜垗浜斿叆**锛堟渶甯哥敤锛墊2.5 鈫?3, 2.4 鈫?2|
|`HALF_DOWN`|浜旇垗鍏叆|2.5 鈫?2, 2.6 鈫?3|
|`HALF_EVEN`|閾惰瀹惰垗鍏ワ紙缁熻甯哥敤锛墊2.5 鈫?2, 3.5 鈫?4|
|`UP`|鍚戣繙绂?鏂瑰悜鑸嶅叆|2.1 鈫?3, -2.1 鈫?-3|
|`DOWN`|鍚?鏂瑰悜鑸嶅叆锛堟埅鏂級|2.9 鈫?2, -2.9 鈫?-2|
|`CEILING`|鍚戞鏃犵┓鑸嶅叆|2.1 鈫?3, -2.1 鈫?-2|
|`FLOOR`|鍚戣礋鏃犵┓鑸嶅叆|2.9 鈫?2, -2.9 鈫?-3|

### 浣跨敤绀轰緥

```
BigDecimal num = new BigDecimal("2.55");

// 鍥涜垗浜斿叆淇濈暀1浣嶅皬鏁?BigDecimal rounded = num.setScale(1, RoundingMode.HALF_UP);
System.out.println(rounded); // 2.6

// 闄ゆ硶鏃舵寚瀹氳垗鍏?BigDecimal result = num.divide(new BigDecimal("2"), 2, RoundingMode.HALF_UP);
```

---

## 5. 姣旇緝鎿嶄綔

### 浣跨敤 compareTo 鏂规硶锛堟帹鑽愶級

```
BigDecimal a = new BigDecimal("1.0");
BigDecimal b = new BigDecimal("1.00");

System.out.println(a.equals(b)); // false锛堢簿搴︿笉鍚岋級
System.out.println(a.compareTo(b) == 0); // true锛堟暟鍊肩浉绛夛級
```

### 姣旇緝缁撴灉璇存槑

- `a.compareTo(b) < 0`锛歛 < b
    
- `a.compareTo(b) == 0`锛歛 = b
    
- `a.compareTo(b) > 0`锛歛 > b
    

---

## 6. 甯哥敤宸ュ叿鏂规硶

### 璁剧疆绮惧害

```
BigDecimal num = new BigDecimal("3.1415926");
num = num.setScale(4, RoundingMode.HALF_UP); // 3.1416
```

### 鍙栫粷瀵瑰€?
```
BigDecimal negative = new BigDecimal("-10.5");
BigDecimal abs = negative.abs(); // 10.5
```

### 鍙栨渶澶у€?鏈€灏忓€?
```
BigDecimal max = a.max(b);
BigDecimal min = a.min(b);
```

### 骞傝繍绠?
```
BigDecimal base = new BigDecimal("2");
BigDecimal power = base.pow(10); // 2^10 = 1024
```

---

## 7. 鏁板€艰浆鎹?
### 杞崲涓哄熀鏈被鍨?
```
BigDecimal bd = new BigDecimal("123.45");

int intValue = bd.intValue();           // 123
long longValue = bd.longValue();        // 123
float floatValue = bd.floatValue();     // 123.45锛堝彲鑳芥崯澶辩簿搴︼級
double doubleValue = bd.doubleValue();  // 123.45锛堝彲鑳芥崯澶辩簿搴︼級

// 绮剧‘杞崲锛堝彲鑳芥姏鍑?ArithmeticException锛?int exactInt = bd.intValueExact();      // 濡傛灉涓嶆槸鏁存暟浼氭姤閿?```

---

## 8. 鏍煎紡鍖栬緭鍑?
### 浣跨敤 NumberFormat

```
BigDecimal amount = new BigDecimal("1234567.89");

NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.CHINA);
System.out.println(currencyFormat.format(amount)); // 锟?,234,567.89

NumberFormat numberFormat = NumberFormat.getNumberInstance();
numberFormat.setMaximumFractionDigits(2);
System.out.println(numberFormat.format(amount)); // 1,234,567.89
```

---

## 9. 鏈€浣冲疄璺?
### 1. 濮嬬粓浣跨敤瀛楃涓叉垨 valueOf 鍒涘缓

```
// 姝ｇ‘
BigDecimal a = new BigDecimal("0.1");
BigDecimal b = BigDecimal.valueOf(0.1);

// 閬垮厤
BigDecimal c = new BigDecimal(0.1);
```

### 2. 闄ゆ硶蹇呴』鎸囧畾鑸嶅叆妯″紡

```
// 姝ｇ‘
BigDecimal result = a.divide(b, 2, RoundingMode.HALF_UP);

// 閿欒锛堝彲鑳芥姏鍑哄紓甯革級
// BigDecimal result = a.divide(b);
```

### 3. 姣旇緝鏁板€间娇鐢?compareTo

```
if (a.compareTo(b) > 0) {
    // a > b
}
```

### 4. 娉ㄦ剰涓嶅彲鍙樻€?
```
BigDecimal a = new BigDecimal("10");
a.add(new BigDecimal("5")); // 杩斿洖鏂板璞★紝a 浠嶇劧鏄?10

// 姝ｇ‘鐢ㄦ硶
a = a.add(new BigDecimal("5")); // a 鍙樹负 15
```

---

## 10. 瀹屾暣绀轰緥锛氶噾棰濊绠?
```
import java.math.BigDecimal;
import java.math.RoundingMode;

public class MoneyCalculation {
    public static void main(String[] args) {
        // 鍟嗗搧浠锋牸
        BigDecimal price = new BigDecimal("19.99");
        BigDecimal quantity = new BigDecimal("3");
        
        // 璁＄畻灏忚
        BigDecimal subtotal = price.multiply(quantity);
        
        // 璁＄畻绋庤垂锛?%锛?        BigDecimal taxRate = new BigDecimal("0.07");
        BigDecimal tax = subtotal.multiply(taxRate)
                               .setScale(2, RoundingMode.HALF_UP);
        
        // 璁＄畻鎬昏
        BigDecimal total = subtotal.add(tax);
        
        System.out.println("鍗曚环: 锟? + price);
        System.out.println("鏁伴噺: " + quantity);
        System.out.println("灏忚: 锟? + subtotal);
        System.out.println("绋庤垂: 锟? + tax);
        System.out.println("鎬昏: 锟? + total);
    }
}
```

杈撳嚭锛?
```
鍗曚环: 锟?9.99
鏁伴噺: 3
灏忚: 锟?9.97
绋庤垂: 锟?.20
鎬昏: 锟?4.17
```

---

## 鎬荤粨

- **鍒涘缓**锛氫紭鍏堜娇鐢ㄥ瓧绗︿覆鏋勯€犳垨 `valueOf()`
    
- **杩愮畻**锛氶櫎娉曞繀椤绘寚瀹氱簿搴﹀拰鑸嶅叆妯″紡
    
- **姣旇緝**锛氫娇鐢?`compareTo()`鑰岄潪 `equals()`
    
- **鑸嶅叆**锛氭牴鎹笟鍔￠渶姹傞€夋嫨鍚堥€傜殑 `RoundingMode`
    
- **鎬ц兘**锛歚BigDecimal`姣旀诞鐐规暟鎱紝鍙湪闇€瑕佺簿纭绠楁椂浣跨敤
