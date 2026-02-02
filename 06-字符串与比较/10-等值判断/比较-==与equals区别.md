---
title: 比较-==与equals区别
category: 06-字符串与比较
topic: 10-等值判断
created: 2026-01-30
reviewed: 2026-02-02
tags: [java, 字符串与比较]
status: active
---

鍦↗ava涓紝`==`鍜宍equals()`閮芥槸鐢ㄤ簬姣旇緝鎿嶄綔锛屼絾瀹冧滑鐨?*姣旇緝瀵硅薄**鍜?*姣旇緝瑙勫垯**鏈夋湰璐ㄥ尯鍒€備互涓嬫槸璇︾粏璇存槑锛?
---

### 1. `==`杩愮畻绗?
- **姣旇緝瀵硅薄**锛氬熀鏈暟鎹被鍨嬶紙濡俙int`銆乣char`锛夊拰寮曠敤绫诲瀷锛堝瀵硅薄銆佹暟缁勶級銆?    
- **姣旇緝瑙勫垯**锛?    
    - 瀵逛簬**鍩烘湰鏁版嵁绫诲瀷**锛氭瘮杈冪殑鏄?*鍊?*鏄惁鐩哥瓑銆?        
        java
        
        java
        
        涓嬭浇
        
        澶嶅埗
        
        ```
        int a = 5;
        int b = 5;
        System.out.println(a == b); // true锛屽€肩浉绛?        ```
        
    - 瀵逛簬**寮曠敤绫诲瀷**锛氭瘮杈冪殑鏄?*鍐呭瓨鍦板潃**锛堝嵆鏄惁鎸囧悜鍚屼竴涓璞★級銆?        
        java
        
        java
        
        涓嬭浇
        
        澶嶅埗
        
        ```
        String s1 = new String("hello");
        String s2 = new String("hello");
        System.out.println(s1 == s2); // false锛屼笉鍚屽璞★紝鍦板潃涓嶅悓
        ```
        
    

---

### 2. `equals()`鏂规硶

- **鏉ユ簮**锛歚Object`绫荤殑鏂规硶锛屾墍鏈夌被閮界户鎵胯鏂规硶銆?    
- **榛樿琛屼负**锛氶粯璁ゅ疄鐜颁笌`==`鐩稿悓锛屾瘮杈冨唴瀛樺湴鍧€銆?    
    java
    
    java
    
    涓嬭浇
    
    澶嶅埗
    
    ```
    // Object绫讳腑鐨別quals()榛樿瀹炵幇
    public boolean equals(Object obj) {
        return (this == obj);
    }
    ```
    
- **閲嶅啓鐩殑**锛氫负浜嗚寮曠敤绫诲瀷鑳藉**姣旇緝鍐呭**鑰岄潪鍦板潃銆傝澶欽ava鍐呯疆绫伙紙濡俙String`銆乣Integer`锛夊凡閲嶅啓`equals()`銆?    
    java
    
    java
    
    涓嬭浇
    
    澶嶅埗
    
    ```
    String s1 = new String("hello");
    String s2 = new String("hello");
    System.out.println(s1.equals(s2)); // true锛孲tring閲嶅啓浜唀quals()锛屾瘮杈冨唴瀹?    ```
    

---

### 3. 鍏抽敭鍖哄埆鎬荤粨

|鐗规€`==`|`equals()`|
|---|---|---|
|**姣旇緝瀵硅薄**鈥媩鍩烘湰绫诲瀷锛堝€硷級鍜屽紩鐢ㄧ被鍨嬶紙鍦板潃锛墊浠呭紩鐢ㄧ被鍨嬶紙榛樿姣旇緝鍦板潃锛屽彲閲嶅啓锛墊
|**姣旇緝鍐呭**鈥媩涓嶆敮鎸侊紙闄ら潪閲嶅啓`==`锛屼絾Java涓嶅厑璁革級|鏀寔锛堥渶閲嶅啓鏂规硶锛墊
|**鎬ц兘**鈥媩楂樻晥锛堢洿鎺ユ瘮杈冨€兼垨鍦板潃锛墊鍙兘杈冩參锛堝閲嶅啓鍚庨渶閬嶅巻鍐呭锛墊

---

### 4. 娉ㄦ剰浜嬮」

- **瀛楃涓插父閲忔睜**锛氬瓧绗︿覆瀛楅潰閲忥紙濡俙"hello"`锛変細鏀惧叆甯搁噺姹狅紝鐩稿悓瀛楅潰閲忓彲鑳芥寚鍚戝悓涓€瀵硅薄銆?    
    java
    
    java
    
    涓嬭浇
    
    澶嶅埗
    
    ```
    String s1 = "hello"; // 甯搁噺姹犱腑鐨勫璞?    String s2 = "hello"; // 鎸囧悜鍚屼竴瀵硅薄
    System.out.println(s1 == s2); // true锛屽湴鍧€鐩稿悓
    ```
    
- **閲嶅啓`equals()`鐨勮鑼?*锛?    
    - 蹇呴』閲嶅啓`hashCode()`鏂规硶锛堣嫢瀵硅薄鐢ㄤ簬鍝堝笇琛紝濡俙HashMap`锛夈€?        
    - 婊¤冻鑷弽鎬с€佸绉版€с€佷紶閫掓€х瓑濂戠害锛堣瑙乣Object`绫绘枃妗ｏ級銆?        
    

---

### 绀轰緥浠ｇ爜瀵规瘮

java

java

涓嬭浇

澶嶅埗

```
public class ComparisonExample {
    public static void main(String[] args) {
        // 鍩烘湰绫诲瀷锛?= 姣旇緝鍊?        int x = 10, y = 10;
        System.out.println("x == y: " + (x == y)); // true

        // 寮曠敤绫诲瀷锛?= 姣旇緝鍦板潃
        String str1 = new String("Java");
        String str2 = new String("Java");
        System.out.println("str1 == str2: " + (str1 == str2)); // false
        System.out.println("str1.equals(str2): " + str1.equals(str2)); // true

        // 甯搁噺姹犲瓧绗︿覆锛?= 鍙兘涓簍rue
        String str3 = "Java";
        String str4 = "Java";
        System.out.println("str3 == str4: " + (str3 == str4)); // true
    }
}
```

---

### 鎬荤粨

- 鍩烘湰绫诲瀷姣旇緝鍊肩敤`==`銆?    
- 寮曠敤绫诲瀷姣旇緝鍦板潃鐢╜==`锛屾瘮杈冨唴瀹圭敤`equals()`锛堥渶纭繚璇ョ被宸查噸鍐欒鏂规硶锛夈€?    
- 瀛楃涓插父閲忔睜绛夌壒娈婃儏鍐甸渶娉ㄦ剰`==`鐨勮涓恒€
