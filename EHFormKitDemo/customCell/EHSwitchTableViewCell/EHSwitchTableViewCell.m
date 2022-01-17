//
//  EHSwitchTableViewCell.m
//  DABAN
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHSwitchTableViewCell.h"

@interface EHSwitchTableViewCell ()

@end

@implementation EHSwitchTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.nameLabel.text = model.name;
    self.switchz.on = model.on;
}

- (IBAction)valueChanged:(id)sender {
    UISwitch *switchz = sender;
    self.model.on = switchz.on;
    !self.callBack ? : self.callBack(self.model, EHFormModelEventSwitch, @{});
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
