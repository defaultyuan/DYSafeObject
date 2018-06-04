# DYSafeObject

### 仓库描述
#### 为了避免线上项目中的用到的数据而产生的Crash

### 使用方法
```objc
pod 'DYSafeObject', '~> 0.1.1'
```
#### 然后安装
```objc
pod update
```
### 以下是测试代码

### 数组 Test
#### 防止数组里面对象为nil的情况、数组越界产生的崩溃

```objc
NSString *s1 = nil;
NSArray *array = @[s1,@"a",@"v",@"c",@"d",@"f",@"s",@"v",@"g"];
NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:array];
NSLog(@"数组 Test--array:%@   mutableArray:%@",array[20],mutableArray[20]);
NSLog(@"数组 Test--array:%@   mutableArray:%@",[array objectAtIndex:20],mutableArray[20]);
NSLog(@"数组 Test--array%@",array);
```

### 字典 Test
#### 防止字典的key与value为nil产生的崩溃

```objc
NSString *key = nil;
NSString *str = nil;
NSDictionary *dict = @{key:str};
NSArray *dArray = @[str];
NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
mutableDict[@"key"] = str;

NSLog(@"字典 Test--dict:%@",dict);
NSLog(@"字典 Test--dArray:%@",dArray);
NSLog(@"字典 Test--mutableDict:%@ key:%@",mutableDict,mutableDict[@"key"]);
```
### 字符串 Test
#### 防止字符串长度越界

```objc
NSMutableString *string = [[NSMutableString alloc] initWithFormat:@"世界因我而精彩"];
NSLog(@"字符串 Test--%@",[string substringFromIndex:50]);
```

### 处理NSNull 异常
#### 消息转发 Test

```objc
NSDictionary *dic2 = @{@"key":[NSNull null]};
NSLog(@"dic2==%@",dic2);
[dic2[@"key"] UTF8String];
```
