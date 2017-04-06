//
//  ZYMaskView.h
//  ZYMaskView
//
//  Created by zhouyun on 2017/4/6.
//  Copyright © 2017年 zhouyun. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Add masked view to topView
 Reference: https://github.com/jgurnani/tourTip (AnyBlanck)
 */
@interface ZYMaskView : UIView

/// invoke in method viewDidAppear:
+ (void)zy_showWithClearFrame:(CGRect)clearRect;

@end
