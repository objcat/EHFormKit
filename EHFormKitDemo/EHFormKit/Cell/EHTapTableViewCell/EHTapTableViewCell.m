//
//  EHTapTableViewCell.m
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/18.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHTapTableViewCell.h"

@implementation EHTapTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.nameLabel.text = model.name;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.arrowsButton.userInteractionEnabled = NO;
    [self.arrowsButton setImage:[[UIImage imageWithContentsOfFile:[EHBundleHelper pathForResource:@"arrow" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    self.arrowsButton.tintColor = RGBA(197, 197, 202, 1);
}

@end
