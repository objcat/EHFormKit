//
//  EHLabelTableViewCell.h
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/24.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import <EHFormKit/EHFormKit.h>

@interface EHLabelTableViewCell : EHFormTableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@end
