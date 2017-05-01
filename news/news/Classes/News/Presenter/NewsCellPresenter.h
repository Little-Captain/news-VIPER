//
//  NewsCellPresenter.h
//  news
//
//  Created by Liu-Mac on 3/26/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCNewsItem.h"

@class LCNewsTableViewCell;

@interface NewsCellPresenter : NSObject

// 需要持有 模型
@property (nonatomic, strong) LCNewsItem *model;

- (void)bindWithCell:(LCNewsTableViewCell *)cell;

@end
