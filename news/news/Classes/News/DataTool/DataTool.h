//
//  DataTool.h
//  news
//
//  Created by Liu-Mac on 3/26/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LCNewsItem;

@interface DataTool : NSObject

+ (instancetype)sharedInstance;

- (void)getItemsWithType:(NSString *)type
            resultHandle:(void(^)(NSArray<LCNewsItem *> *models))resultHandle;

@end
