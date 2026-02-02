## 一，Java 设计模式概览

设计模式是一套可复用的结构化经验，用来解决反复出现的设计问题。价值主要在可读性，可扩展性，可测试性，团队协作沟通成本下降。

经典分类是 GoF 三大类：创建型，结构型，行为型。

### 1）创建型模式

关注对象怎么创建，怎么管理生命周期和依赖关系。

- **Singleton 单例**  
    典型场景：全局共享的无状态服务，配置中心，连接池管理器。  
    注意点：线程安全，反序列化破坏单例，测试隔离难。  
    Java推荐写法见后面的“懒初始化”小节。
    
- **Factory Method 工厂方法**  
    把“创建哪种具体对象”的决策下沉到子类或实现类。  
    典型场景：日志组件，解析器，策略对象的创建。
    
- **Abstract Factory 抽象工厂**  
    一次性创建一族相关对象，保证兼容性。  
    典型场景：跨平台 UI 组件，数据库方言相关对象族。
    
- **Builder 建造者**  
    构建过程可分步，参数很多且有可选项，避免构造函数爆炸。  
    典型场景：不可变对象，复杂 DTO。  
    Java 里 Lombok 的 `@Builder` 属于常见工程实践。
    
- **Prototype 原型**  
    通过复制已有对象创建新对象。  
    典型场景：对象创建成本高，且需要大量相似实例。注意深拷贝边界。
    

### 2）结构型模式

关注类与对象如何组合，接口如何适配，如何复用。

- **Adapter 适配器**  
    把一个接口转成客户端期望的接口。  
    典型场景：对接第三方 SDK，历史代码改造，`java.io` 里很多装饰和适配组合很常见。
    
- **Decorator 装饰器**  
    在不改动原类的前提下叠加能力，按需组合。  
    典型场景：IO 流 `BufferedInputStream`，鉴权与日志的层层包装。
    
- **Proxy 代理**  
    控制对目标对象的访问，可做延迟加载，缓存，鉴权，远程调用。  
    典型场景：Spring AOP，RPC stub，懒加载代理对象。
    
- **Facade 外观**  
    给复杂子系统提供一个更简单的入口。  
    典型场景：对外提供简化 API，封装多个子模块调用顺序。
    
- **Composite 组合**  
    把对象组合成树形结构，叶子和容器统一对待。  
    典型场景：菜单树，组织架构，文件系统模型。
    

### 3）行为型模式

关注对象间协作与职责分配，降低耦合，提升可扩展性。

- **Strategy 策略**  
    把算法族封装成可替换的策略。  
    典型场景：不同计费规则，不同排序，不同风控策略。
    
- **Template Method 模板方法**  
    固定流程骨架，允许子类覆盖局部步骤。  
    典型场景：批处理流程，导入导出流程。
    
- **Observer 观察者**  
    发布订阅，事件驱动。  
    典型场景：领域事件，GUI 事件，消息总线。
    
- **Command 命令**  
    请求封装为对象，可排队，撤销，日志化。  
    典型场景：任务队列，操作回放。
    
- **Chain of Responsibility 责任链**  
    多个处理器按顺序处理请求，谁能处理谁处理。  
    典型场景：Web 过滤器链，风控规则链。
    
- **State 状态**  
    用状态对象替换大量 if else。  
    典型场景：订单状态机，审批流。
    

如果你想快速上手，工程中最常见且收益最高的一组通常是：工厂，建造者，策略，装饰器，代理，责任链，观察者。

---

## 二，Java 里的“懒加载”是什么

“懒加载”在 Java 场景里通常指三类事情：

1. **懒初始化 Lazy Initialization**  
    用到时才创建对象，减少启动成本与内存占用。
    
2. **容器层懒加载**  
    Spring Bean 延迟初始化，减少启动时间。
    
3. **ORM 懒加载**  
    JPA Hibernate 对关联对象按需加载，减少一次查询的数据量。
    

下面逐个讲清楚实现方式与坑。

### 1）懒初始化的常用写法

#### 写法 A：静态内部类 Holder

线程安全，延迟加载，写法简洁，性能好。

`public final class IdGenerator {   private IdGenerator() {}    private static class Holder {     private static final IdGenerator INSTANCE = new IdGenerator();   }    public static IdGenerator getInstance() {     return Holder.INSTANCE;   } }`

#### 写法 B：双重检查锁 Double Checked Locking

需要 `volatile` 保证可见性与禁止指令重排。

`public final class CacheManager {   private static volatile CacheManager instance;    private CacheManager() {}    public static CacheManager getInstance() {     if (instance == null) {       synchronized (CacheManager.class) {         if (instance == null) {           instance = new CacheManager();         }       }     }     return instance;   } }`

#### 写法 C：带记忆的 Supplier

适合把“昂贵计算结果”做一次性缓存。

`import java.util.function.Supplier;  public final class Lazy<T> implements Supplier<T> {   private volatile T value;   private Supplier<T> supplier;    public Lazy(Supplier<T> supplier) {     this.supplier = supplier;   }    @Override   public T get() {     T v = value;     if (v != null) return v;     synchronized (this) {       if (value == null) {         value = supplier.get();         supplier = null;       }       return value;     }   } }`

适用场景：对象创建很重，且有概率根本用不到。  
风险点：懒初始化会把失败和耗时推迟到运行路径上，监控与超时要跟上。

### 2）Spring 里的懒加载

- `@Lazy` 可以让 Bean 延迟创建。
    
- 用在 `@Configuration` 或某个 `@Bean` 上，减少启动阶段实例化成本。
    

`@Lazy @Service public class HeavyService { }`

注意点：

- 首次访问该 Bean 时才会初始化，第一次请求可能变慢。
    
- 若初始化失败，会在业务路径上暴露异常，需要更好的熔断和降级策略。
    

### 3）JPA Hibernate 的懒加载

最典型写法：

`@OneToMany(fetch = FetchType.LAZY) private List<OrderItem> items;`

含义：查询 `Order` 时先不加载 `items`，当你访问 `order.getItems()` 时再触发查询，通常通过代理对象实现。

常见收益：

- 列表页只展示订单摘要，不必把关联明细都查出来。
    
- 减少一次 SQL 返回的数据量。
    

常见坑：

- **N+1 查询问题**：查了 N 个订单，每个订单访问 items 触发一次查询。
    
- **LazyInitializationException**：会话已关闭后才访问懒加载字段。
    

常见解决方式：

- `fetch join` 或 `EntityGraph` 让特定查询提前把关联拉齐
    
- DTO 投影只查需要的字段
    
- 批量抓取 batch fetching，减少 SQL 次数
    
- Open Session in View 能缓解异常，但会把持久化上下文扩到 Web 层，边界容易变模糊，需谨慎
    

---

## 什么时候用懒加载合适

适合：

- 初始化成本高
    
- 使用概率低或不确定
    
- 能接受首次访问的额外延迟
    

需要谨慎：

- 低延迟强约束接口
    
- ORM 场景里容易出现 N+1
    
- 资源必须及时释放的对象，懒加载可能让生命周期更难管理
    
