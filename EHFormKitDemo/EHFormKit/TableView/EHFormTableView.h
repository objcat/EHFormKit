//
//  EHFormTableView.h
//  DABAN
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EHFormModel.h"

@interface EHFormTableView : UITableView

@property (strong, nonatomic, readonly) NSMutableArray *arr;
/**
 插入表单
 
 @param name 标题
 @param value 值
 @param rowHeight 行高
 @param type 类型
 @param canTap 是否回调点击事件
 @param canSelected 是否有选中状态
 @param separatorHeight 下划线高度 设为0则隐藏下划线
 @param separatorColor 下划线颜色
 @param separatorOffset 下划线偏移量
 @param touchUpInside 点击回调
 */
- (EHFormModel *)addRowWithName:(NSString *)name
                 value:(NSString *)value
             rowHeight:(CGFloat)rowHeight
                  type:(EHFormType)type
                canTap:(BOOL)canTap
           canSelected:(BOOL)canSelected
       separatorHeight:(CGFloat)separatorHeight
        separatorColor:(UIColor *)separatorColor
       separatorOffset:(CGFloat)separatorOffset
         touchUpInside:(void (^) (EHFormModel *model))touchUpInside;

/**
 插入空白行

 @param backgroundColor 分隔行颜色
 @param rowHeight 行高
 @param separatorHeight 下划线高度
 @param separatorColor 下划线颜色
 @param separatorOffset 下划线偏移量
 */
- (void)addWhiteRowWithBackgroundColor:(UIColor *)backgroundColor
                             rowHeight:(CGFloat)rowHeight
                       separatorHeight:(CGFloat)separatorHeight
                        separatorColor:(UIColor *)separatorColor
                       separatorOffset:(CGFloat)separatorOffset;
@end
