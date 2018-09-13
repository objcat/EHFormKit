//
//  EHFormlModel.m
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/11.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHFormModel.h"

@implementation EHFormModel

- (NSString *)reuseIdentifier {
    switch (self.type) {
            
        case EHFormTypeTap: {
            return @"EHTapTableViewCell";
            break;
        }
            
        case EHFormTypeWhiteRow: {
            return @"EHWhiteRowTableViewCell";
            break;
        }
            
        case EHFormTypeTelephone: {
            return @"EHPhoneNumberTableViewCell";
            break;
        }
            
        case EHFormTypeSwitch: {
            return @"EHSwitchTableViewCell";
            break;
        }
            
        case EHFormTypeButton: {
            return @"EHButtonTableViewCell";
            break;
        }
            
        case EHFormTypeLabel: {
            return @"EHLabelTableViewCell";
            break;
        }
            
        default:
            return nil;
            break;
    }
}

+ (EHFormModel *)converEHFormModel:(id)object {
    return (EHFormModel *)object;
}

@end
