//
//  EHFormTableViewCell.h
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/18.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHFormModel.h"
#import "EHBundleHelper.h"

@interface EHFormTableViewCell : UITableViewCell
@property (copy, nonatomic) void (^touchUpInside) (EHFormModel *model);
@property (nonatomic, strong) CALayer *lineLayer;
@property (nonatomic, strong) EHFormModel *model;
@end
