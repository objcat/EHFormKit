//
//  EHForml.h
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/11.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define FORM(x) [EHForm converEHForm:x]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

typedef NS_ENUM(NSUInteger, EHFormType) {
    /** 可点击类型 */
    EHFormTypeTap,
    /** 按钮类型 */
    EHFormTypeButton,
    /** 电话类型 */
    EHFormTypeTelephone,
    /** 文本展示类型 */
    EHFormTypeLabel,
    /** switch类型 */
    EHFormTypeSwitch,
    /** 分隔行类型 */
    EHFormTypeWhiteRow,
};

@interface EHFormModel : NSObject

/** 标题 */
@property (nonatomic, strong) NSString *name;
/** 值 */
@property (nonatomic, strong) NSString *value;
/** 重用池名字 */
@property (strong, nonatomic) NSString *reuseIdentifier;
/** 线高度 */
@property (assign, nonatomic) CGFloat separatorHeight;
/** 线颜色 */
@property (strong, nonatomic) UIColor *separatorColor;
/** 线偏移 */
@property (assign, nonatomic) CGFloat separatorOffset;
/** 行高 */
@property (assign, nonatomic) CGFloat rowHeight;
/** 背景颜色 空行类型可以用 */
@property (strong, nonatomic) UIColor *backgroundColor;
/** 表单类型 */
@property (nonatomic, assign) EHFormType type;
/** 是否可点击 */
@property (nonatomic, assign) BOOL canTap;
/** 是否可选中 */
@property (nonatomic, assign) BOOL canSelected;
/** arr容器 */
@property (nonatomic, strong) NSArray *arr;
/** dic容器 */
@property (nonatomic, strong) NSMutableDictionary *dic;
/** 点击回调 */
@property (copy, nonatomic) void (^touchUpInside) (EHFormModel *);
/** 开关是否打开 - 仅在EHFormTypeSwitch有效 */
@property (assign, nonatomic) BOOL on;

@end
