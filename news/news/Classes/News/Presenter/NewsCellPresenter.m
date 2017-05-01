//
//  NewsCellPresenter.m
//  news
//
//  Created by Liu-Mac on 3/26/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import "NewsCellPresenter.h"
#import "LCNewsTableViewCell.h"

#import <UIImageView+WebCache.h>

@interface NewsCellPresenter ()

// 弱引用指向 视图
@property (nonatomic, weak) LCNewsTableViewCell *cell;

@end

@implementation NewsCellPresenter

- (void)bindWithCell:(LCNewsTableViewCell *)cell {
    
    self.cell = cell;
    
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:_model.thumbnail_pic_s] placeholderImage:[self createIconImage:CGSizeMake(80, 60)]];
    cell.titleL.text = _model.title;
    cell.authorL.text = _model.author_name;
}

- (UIImage *)createIconImage:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
