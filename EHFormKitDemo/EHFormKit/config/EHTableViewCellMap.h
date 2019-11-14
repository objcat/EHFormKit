//
//  EHTableViewCellMap.h
//  EGShellProject
//
//  Created by 张祎 on 2019/10/10.
//  Copyright © 2019 objcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EHFormModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EHTableViewCellMap : NSObject

/// 无标题Label类型
@property (class, readonly) NSString *label;
/// 标题+Label
@property (class, readonly) NSString *title_label;
/// 标题+右箭头选择
@property (class, readonly) NSString *title_tap;
/// 是和否
@property (class, readonly) NSString *title_yesOrNot;
/// 标题+TextField
@property (class, readonly) NSString *title_textField;
/// 标题+Slider
@property (class, readonly) NSString *slider;
/// 标题+TextView
@property (class, readonly) NSString *textView;

@end

NS_ASSUME_NONNULL_END
