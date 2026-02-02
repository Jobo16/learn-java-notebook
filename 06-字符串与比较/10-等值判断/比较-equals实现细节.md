---
title: 比较-equals实现细节
category: 06-字符串与比较
topic: 10-等值判断
created: 2026-01-28
reviewed: 2026-02-02
tags: [java, 字符串与比较]
status: active
---

浣犳兂鐭ラ亾銆岄潪 `null` 鐨勫璞¤皟鐢?`.equals(null)` 鏄惁鍙銆嶏紝绛旀鏄細**鍙互鐨勶紝涓嶄細鎶涘嚭寮傚父锛岃€屼笖杩斿洖缁撴灉鍥哄畾涓?`false`**銆?
### 鍏蜂綋鍒嗘瀽

1. **涓轰粈涔堜笉浼氭姤閿?*
    
    鎶ラ敊鐨勬牴婧愭槸銆宍null` 璋冪敤鏂规硶銆嶏紙姣斿 `null.equals(xxx)`锛夛紝鑰岃繖閲岀殑璋冪敤鏂规槸銆岄潪 `null` 鐨勬湁鏁堝璞°€嶏紝`.equals()` 鏂规硶鏈韩鏄姝ｅ父璋冪敤鐨勶紝鍙槸浼犲叆鐨勫弬鏁版槸 `null`锛岃繖瀹屽叏绗﹀悎鏂规硶鐨勫弬鏁拌姹傦紙`.equals()` 鐨勫弬鏁扮被鍨嬫槸 `Object`锛宍null` 鍙互浣滀负 `Object` 绫诲瀷鐨勫弬鏁颁紶鍏ワ級銆?    
2. **涓轰粈涔堣繑鍥?`false`**
    
    Java 涓墍鏈夐噸鍐?`.equals()` 鏂规硶鐨勫唴缃被锛坄String`銆乣Integer`銆乣ArrayList` 绛夛級锛岄兘閬靛惊涓€涓€氱敤瑙勮寖锛?*濡傛灉浼犲叆鐨勫弬鏁版槸 `null`锛岀洿鎺ヨ繑鍥?`false`**銆?    
    鐢氳嚦 `Object` 绫荤殑榛樿 `.equals()` 鏂规硶锛岄€昏緫涔熸槸銆屽厛鍒ゆ柇鍙傛暟鏄惁涓?`null`锛屽啀鍒ゆ柇鍦板潃鏄惁鐩稿悓銆嶏紝浼犲叆 `null` 蹇呯劧杩斿洖 `false`銆?    

### 浠ｇ爜绀轰緥楠岃瘉

java

杩愯

```
// 1. String 绫诲瀷锛堥潪 null 璋冪敤 .equals(null)锛?String s = "hello";
System.out.println(s.equals(null)); // 杈撳嚭锛歠alse锛堟棤寮傚父锛?
// 2. 鍖呰绫伙紙闈?null 璋冪敤 .equals(null)锛?Integer a = 100;
System.out.println(a.equals(null)); // 杈撳嚭锛歠alse锛堟棤寮傚父锛?
// 3. 鑷畾涔夌被锛堝嵆浣块噸鍐?equals锛屼篃搴旈伒寰鑼冭繑鍥?false锛?class Person {
    String name;

    @Override
    public boolean equals(Object o) {
        if (o == null) return false; // 鏄惧紡鍒ゆ柇鍙傛暟涓?null锛岃繑鍥?false
        if (this == o) return true;
        if (getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return Objects.equals(name, person.name);
    }
}

Person p = new Person("寮犱笁");
System.out.println(p.equals(null)); // 杈撳嚭锛歠alse锛堟棤寮傚父锛?```

### 琛ュ厖璇存槑

- 杩欑鍐欐硶锛坄闈瀗ull瀵硅薄.equals(null)`锛夎櫧鐒惰娉曞悎娉曘€佷笉浼氭姤閿欙紝浣?*瀹為檯寮€鍙戜腑娌℃湁浠讳綍涓氬姟鎰忎箟**锛屽洜涓哄畠鐨勭粨鏋滄案杩滄槸 `false`锛屼笉浼氬甫鏉ヤ换浣曟湁鏁堜俊鎭€?- 涓庝箣瀵瑰簲鐨?`null.equals(闈瀗ull瀵硅薄)` 鏄?*缁濆绂佹**鐨勶紝浼氱洿鎺ユ姏鍑?`NullPointerException`锛岃繖鏄垜浠渶瑕侀噸鐐硅閬跨殑銆?
### 鎬荤粨

1. 闈?`null` 瀵硅薄璋冪敤 `.equals(null)` 鍙锛屼笉浼氭姏寮傚父锛岃繑鍥炵粨鏋滃浐瀹氫负 `false`銆?2. 鏍稿績鍖哄埆锛氭姤閿欎笌鍚﹀彇鍐充簬銆岃皟鐢ㄦ柟娉曠殑瀵硅薄鏄惁涓?`null`銆嶏紝鑰岄潪銆屼紶鍏ョ殑鍙傛暟鏄惁涓?`null`銆嶃€?3. 璇ュ啓娉曟棤瀹為檯涓氬姟浠峰€硷紝寮€鍙戜腑鏃犻渶涓诲姩缂栧啓姝ょ被鍒ゆ柇銆
