//
//  LCNewsTableViewCell.h
//  news
//
//  Created by Liu-Mac on 24/11/2016.
//  Copyright © 2016 Liu-Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCNewsItem;

@interface LCNewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UILabel *authorL;

@end
