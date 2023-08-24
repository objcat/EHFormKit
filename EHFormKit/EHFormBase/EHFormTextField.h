//
//  EHFormTextField.h
//  findproperty
//
//  Created by objcat on 2021/6/18.
//  Copyright © 2021 Centaline. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EHFormTextFieldDelegate <NSObject>
- (BOOL)eh_textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string result:(BOOL)result;
- (BOOL)eh_textFieldShouldEndEditing:(UITextField *)textField;
@end

typedef NS_ENUM(NSUInteger, EHFormTextFieldInputType) {
    // 没有限制
    EHFormTextFieldInputTypeDefault,
    // 0-9
    EHFormTextFieldInputTypeNumberInteger,
    // 0-9和小数点
    EHFormTextFieldInputTypeNumberFloat,
};

@interface EHFormTextField : UITextField <UITextFieldDelegate>
@property (weak, nonatomic) id <EHFormTextFieldDelegate> eh_delegate;
@property (assign, nonatomic) EHFormTextFieldInputType eh_inputType;
@end


