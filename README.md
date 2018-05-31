# DYSafeObject
字典、数组、转发NSNull对象消息，防Crash

// 数组 Test
// 数组越界
NSString *s1 = nil;
NSArray *array = @[s1,@"a",@"v",@"c",@"d",@"f",@"s",@"v",@"g"];
NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:array];
NSLog(@"数组 Test--array:%@   mutableArray:%@",array[20],mutableArray[20]);
NSLog(@"数组 Test--array:%@   mutableArray:%@",[array objectAtIndex:20],mutableArray[20]);
NSLog(@"数组 Test--array%@",array);

// 字典 Test
NSString *key = nil;
NSString *str = nil;
NSDictionary *dict = @{key:str};
NSArray *dArray = @[str];
NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
mutableDict[@"key"] = str;

NSLog(@"字典 Test--dict:%@",dict);
NSLog(@"字典 Test--dArray:%@",dArray);
NSLog(@"字典 Test--mutableDict:%@ key:%@",mutableDict,mutableDict[@"key"]);

// 字符串 Test
NSMutableString *string = [[NSMutableString alloc] initWithFormat:@"世界因我而精彩"];
NSLog(@"字符串 Test--%@",[string substringFromIndex:100]);

// 处理NSNull 异常
// 消息转发 Test
NSDictionary *dic2 = @{@"key":[NSNull null]};
NSLog(@"dic2==%@",dic2);
[dic2[@"key"] UTF8String];
