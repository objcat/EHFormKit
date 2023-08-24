//
//  EHFormTextField.m
//  findproperty
//
//  Created by objcat on 2021/6/18.
//  Copyright © 2021 Centaline. All rights reserved.
//

#import "EHFormTextField.h"

@interface EHFormTextField ()
@property (strong, nonatomic) CALayer *lineLayer;
@end

@implementation EHFormTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    self.returnKeyType = UIReturnKeyDone;
    self.delegate = self;
//    [self addLayer];
}

- (void)addLayer {
    self.lineLayer = [[CALayer alloc] init];
    self.lineLayer.backgroundColor = [UIColor colorWithRed:238 / 255.0 green:238 / 255.0 blue:238 / 255.0 alpha:1].CGColor;
    self.lineLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:self.lineLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineLayer.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 0.5);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (self.eh_delegate && [self.eh_delegate respondsToSelector:@selector(eh_textField:shouldChangeCharactersInRange:replacementString:result:)]) {
        // 允许删除
        if ([string isEqualToString:@""]) {
            return [self.eh_delegate eh_textField:textField shouldChangeCharactersInRange:range replacementString:string result:YES];
        }
        // 根据inputType不同显示输入
        switch (self.eh_inputType) {
            case EHFormTextFieldInputTypeNumberInteger:
                // 如果是数字就可以输入
                return [self.eh_delegate eh_textField:textField shouldChangeCharactersInRange:range replacementString:string result:[self zy_isNumber:string]];
                break;
            case EHFormTextFieldInputTypeNumberFloat:
                // 如果是数字就可以输入
                return [self.eh_delegate eh_textField:textField shouldChangeCharactersInRange:range replacementString:string result:[self zy_isNumberAndDot:string]];
                break;
            default:
                return [self.eh_delegate eh_textField:textField shouldChangeCharactersInRange:range replacementString:string result:YES];
                break;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (self.eh_delegate && [self.eh_delegate respondsToSelector:@selector(eh_textFieldShouldEndEditing:)]) {
        return [self.eh_delegate eh_textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (BOOL)zy_isNumber:(NSString *)str {
    if (str.length == 0) {
        return NO;
    }
    NSString *pattern = @"[0123456789]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if ([predicate evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}

- (BOOL)zy_isNumberAndDot:(NSString *)str {
    if (str.length == 0) {
        return NO;
    }
    NSString *pattern = @"[0123456789.]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if ([predicate evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self resignFirstResponder];
    return YES;
}

@end
