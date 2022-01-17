//
//  EHTextFieldTableViewCell.m
//  EHFormKitDemo
//
//  Created by 张祎 on 2020/6/5
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "EHTextFieldTableViewCell.h"

@interface EHTextFieldTableViewCell () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation EHTextFieldTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.nameLabel.text = model.name;
    self.textField.text = model.value;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textField.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    !self.callBack ? : self.callBack(self.model, EHFormModelEventTextFieldShouldChanged, @{@"value": text ? : @""});
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
