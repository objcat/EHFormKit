//
//  EHBundleHelper.h
//  EHFormKitDemo
//
//  Created by 张祎 on 2018/9/13.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EHBundleHelper : NSObject
+ (NSString *)pathForResource:(NSString *)resource ofType:(NSString *)type;
@end
