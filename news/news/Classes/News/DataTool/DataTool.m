//
//  DataTool.m
//  news
//
//  Created by Liu-Mac on 3/26/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import "DataTool.h"
#import "LCNewsItem.h"

#import <MJExtension.h>

@interface DataTool ()

@end

@implementation DataTool

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static DataTool *_instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (instancetype)sharedInstance {
    
    return [self new];
}

- (void)getItemsWithType:(NSString *)type
            resultHandle:(void(^)(NSArray<LCNewsItem *> *models))resultHandle {
    
    // url
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://v.juhe.cn/toutiao/index?type=%@&key=cdd2f54db332f7a361815ee44b77d17b", type]];
    // 发送网络请求
    NSURLSession *session = [NSURLSession sharedSession];
    // 内部会创建一个子队列来执行completionHandler
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return;
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *result = dict[@"result"];
        NSArray *resultData = result[@"data"];
        NSArray *models = [LCNewsItem mj_objectArrayWithKeyValuesArray:resultData];
        resultHandle(models);
    }];
    [dataTask resume];
}

@end
