# OpenSourcePlayGround

[toc]

### 背景
本项目旨在学习iOS各开源库的使用，期间也会阅读一些优秀开源库的源码，提升自己解决问题的能力，同时也是久违的从零搭起一个APP的有趣实践。
### API
数据由[TMDB](https://developers.themoviedb.org/3/getting-started/introduction)提供

ICON基本上取自[iconfont](https://www.iconfont.cn/?spm=a313x.7781069.1998910419.d4d0a486a)

后面可能会看情况接入更多的API

### 网络请求相关

用到的工具：

- [Convert HTTP Query String to JSON](https://www.convertonline.io/convert/query-string-to-json)：将API的try it out中的每个字段都添上会在下面生成一个请求的URL，该工具可以将这个URL专程JSON
- [quicktype](https://app.quicktype.io/#l=cs&r=json2csharp)：API的definition可以看到请求回包的Example，是JSON格式的，还有上面获得的请求的JSON，都可以通过该工具转成OC格式的Model，只需要粘贴后选择转换语言为Objective-C即可，默认情况下会生成一个properties字典，用于将Model的属性字段名和其在JSON中的名字对应，即@{@"JSONName":@"ModelName"}

模型和字典的互相转换主要用到了**YYModel**

在这里需要利用quicktype生成的poperties字典特殊处理下请求和回包数据才能正常完成转换

对于请求：

```objective-c
// 基类：OSPGBaseRequest
// 子类必须重载该方法，实现model属性和json名的对应关系
+ (NSDictionary<NSString *, NSString *> *)properties;

- (NSDictionary *)jsonDictionary
{
    // 首先用原来的属性名转换成字典，即生成字典@{@"ModelName":value}
    id dict = [[self dictionaryWithValuesForKeys:[self class].properties.allValues] mutableCopy];

    for (id jsonName in [self class].properties) {
        id propertyName = [self class].properties[jsonName];
        // 移除空值的键值对
        if (!dict[propertyName] || [dict[propertyName] isEqual:[NSNull null]]) {
            [dict removeObjectForKey:propertyName];
            continue;
        }
        // 将字典中ModleName和原JSONName不一致的都换成JSONName，即生成字典@{@"JSONName":value}
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    return dict;
}
   
```

对于回包

```objective-c
// 基类
// OSPGBaseModel
// 子类必须重载该方法，实现model属性和json名的对应关系
+ (NSDictionary<NSString *, NSString *> *)properties;
// YYModel的代理，用于另外指定转换成model属性的json名，
// 比如让@{@"id":100}赋值给属性
// @property(nonatomic, assign) NSInteger identifier;
// 可以返回@{@"identifier":@"id"}
// 这里主要是用于将@{@"JSONName":@"ModelName"}转变成@{@"ModelName":@"JSONName"}
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [[self properties] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [dict setObject:key forKey:obj];
    }];
    return dict;
}
// 对于一些包含特殊容器字段的回包，比如数组，字典等。子类需要实现下面方法指定容器内的数据类型，该示例表示results是包含多个OSPGDiscoverResult的数组
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"results" : [OSPGDiscoverResult class]};
}
```





### 目前用到的开源库:
- AFNetworking
- CYLTabBarController
- LookinServer
- MBProgressHUD
- MJRefresh
- Masonry
- SDWebImage
- YPNavigationBarTransition
- YTKNetwork
- YYKit

