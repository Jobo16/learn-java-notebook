你想知道「非 `null` 的对象调用 `.equals(null)` 是否可行」，答案是：**可以的，不会抛出异常，而且返回结果固定为 `false`**。

### 具体分析

1. **为什么不会报错**
    
    报错的根源是「`null` 调用方法」（比如 `null.equals(xxx)`），而这里的调用方是「非 `null` 的有效对象」，`.equals()` 方法本身是被正常调用的，只是传入的参数是 `null`，这完全符合方法的参数要求（`.equals()` 的参数类型是 `Object`，`null` 可以作为 `Object` 类型的参数传入）。
    
2. **为什么返回 `false`**
    
    Java 中所有重写 `.equals()` 方法的内置类（`String`、`Integer`、`ArrayList` 等），都遵循一个通用规范：**如果传入的参数是 `null`，直接返回 `false`**。
    
    甚至 `Object` 类的默认 `.equals()` 方法，逻辑也是「先判断参数是否为 `null`，再判断地址是否相同」，传入 `null` 必然返回 `false`。
    

### 代码示例验证

java

运行

```
// 1. String 类型（非 null 调用 .equals(null)）
String s = "hello";
System.out.println(s.equals(null)); // 输出：false（无异常）

// 2. 包装类（非 null 调用 .equals(null)）
Integer a = 100;
System.out.println(a.equals(null)); // 输出：false（无异常）

// 3. 自定义类（即使重写 equals，也应遵循规范返回 false）
class Person {
    String name;

    @Override
    public boolean equals(Object o) {
        if (o == null) return false; // 显式判断参数为 null，返回 false
        if (this == o) return true;
        if (getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return Objects.equals(name, person.name);
    }
}

Person p = new Person("张三");
System.out.println(p.equals(null)); // 输出：false（无异常）
```

### 补充说明

- 这种写法（`非null对象.equals(null)`）虽然语法合法、不会报错，但**实际开发中没有任何业务意义**，因为它的结果永远是 `false`，不会带来任何有效信息。
- 与之对应的 `null.equals(非null对象)` 是**绝对禁止**的，会直接抛出 `NullPointerException`，这是我们需要重点规避的。

### 总结

1. 非 `null` 对象调用 `.equals(null)` 可行，不会抛异常，返回结果固定为 `false`。
2. 核心区别：报错与否取决于「调用方法的对象是否为 `null`」，而非「传入的参数是否为 `null`」。
3. 该写法无实际业务价值，开发中无需主动编写此类判断。