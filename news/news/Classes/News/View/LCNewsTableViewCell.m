//
//  LCNewsTableViewCell.m
//  news
//
//  Created by Liu-Mac on 24/11/2016.
//  Copyright © 2016 Liu-Mac. All rights reserved.
//

#import "LCNewsTableViewCell.h"

#import "LCNewsItem.h"

#import <UIImageView+WebCache.h>

@interface LCNewsTableViewCell ()

@end

@implementation LCNewsTableViewCell

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(5,5,80,60);
    float imgW =  self.imageView.image.size.width;
    // 如果有图像, 调整label的位置
    if(imgW > 0) {
        self.textLabel.frame = CGRectMake(95,
                                          self.textLabel.frame.origin.y,
                                          self.textLabel.frame.size.width,
                                          self.textLabel.frame.size.height);
        self.detailTextLabel.frame = CGRectMake(95,
                                                self.detailTextLabel.frame.origin.y,
                                                self.detailTextLabel.frame.size.width,
                                                self.detailTextLabel.frame.size.height);
    }
    
}

@end
