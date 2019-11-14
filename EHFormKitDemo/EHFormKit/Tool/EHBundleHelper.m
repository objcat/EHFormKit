//
//  EHBundleHelper.m
//  EHFormKitDemo
//
//  Created by 张祎 on 2018/9/13.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHBundleHelper.h"

@implementation EHBundleHelper
+ (NSString *)pathForResource:(NSString *)resource ofType:(NSString *)type {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"EHFormResources" ofType:@"bundle"];
    return [[NSBundle bundleWithPath:path] pathForResource:resource ofType:type];
}
@end
