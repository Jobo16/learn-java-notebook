先从“引用变量”和“对象实际类型”这两个概念说起。  
在 Java 里，等号左边的类型决定了你“能用什么功能”，等号右边 new 出来的类型决定了“这个对象到底是谁”。

例如：

Person p = new Student();

这里有两件事同时成立。  
p 的编译期类型是 Person。  
这个对象的运行期真实类型是 Student。

编译期类型决定你能调用哪些方法。  
运行期类型决定方法真正执行的是哪一个版本。

一、为什么可以向上转型

Student 继承 Person，说明 Student 至少拥有 Person 的全部成员。  
凡是需要一个 Person 的地方，给它一个 Student 都是安全的。

可以把它理解为一个“范围更大”的引用。

Student 是具体的人，Person 是抽象的人。  
用“人”的视角看“学生”，不会出问题。

所以这句是合法的：

Person p = new Student();

这一步叫向上转型，本质是从具体到抽象。  
它是自动完成的，不需要强制转换。  
原因是安全性由语言保证。

向上转型后有一个直接后果。  
你只能通过 p 访问 Person 中定义的成员。  
即便对象真实是 Student，Student 独有的方法也暂时“看不见”。

二、向下转型为什么危险

向下转型表示你试图把一个“抽象的引用”还原成“更具体的类型”。

例如：

Person p = new Student();  
Student s = (Student) p;

这里能成功，是因为这个对象本来就是 Student。  
你只是恢复了它原本的身份。

再看这个例子：

Person p = new Person();  
Student s = (Student) p;

这里会在运行期抛出 ClassCastException。  
原因在于对象本身就是 Person，从来没有 Student 的那部分能力。  
运行期发现你在“假装它是学生”，就直接报错。

一句话总结。  
向下转型是否成功，取决于对象真实的运行期类型，和引用变量的声明类型没有关系。

三、instanceof 在做什么

instanceof 判断的不是变量类型。  
它判断的是变量当前指向的那个对象，是不是某个类型，或者该类型的子类。

例如：

Person p = new Student();

p instanceof Person 返回 true  
p instanceof Student 返回 true

因为对象真实类型是 Student。

再看：

Person p = new Person();

p instanceof Student 返回 false

因为这个对象确实不是 Student。

如果引用为 null，说明根本没有对象，自然所有 instanceof 都是 false。

四、为什么要先 instanceof 再向下转型

向下转型存在失败风险。  
instanceof 是一种运行期安全检查。

常见写法是：

if (p instanceof Student) {  
Student s = (Student) p;  
}

这样可以保证转型一定成功，不会抛异常。

五、Java 14 之后的新写法在做什么

以前的问题是。  
判断和强制转型要写两次类型，冗余又容易写错。

新语法把“判断成功”和“生成新变量”合在了一起：

if (obj instanceof String s) {  
System.out.println(s.toUpperCase());  
}

含义是。  
如果 obj 指向的对象是 String 或其子类，就把它当作 String，并绑定到变量 s。  
在 if 代码块中，s 已经是 String 类型，不需要再强转。

六、用一句话总理解

向上转型是安全的，因为子类一定包含父类的全部能力。  
向下转型是有风险的，因为父类对象未必具备子类能力。  
instanceof 的作用是在运行期确认对象真实身份，避免错误转型。