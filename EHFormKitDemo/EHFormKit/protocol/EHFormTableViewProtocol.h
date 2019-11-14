//
//  EHFormTableViewProtocol.h
//  EGShellProject
//
//  Created by 张祎 on 2019/9/4.
//  Copyright © 2019 objcat. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EHFormTableViewProtocol <NSObject>
- (void)eh_scrollViewDidScroll:(UIScrollView *)scrollView;
@end

NS_ASSUME_NONNULL_END
