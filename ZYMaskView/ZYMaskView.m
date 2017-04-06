//
//  ZYMaskView.m
//  ZYMaskView
//
//  Created by zhouyun on 2017/4/6.
//  Copyright © 2017年 zhouyun. All rights reserved.
//

#import "ZYMaskView.h"


static NSString *const kIsShowCoverGuideView = @"kIsShowCoverGuideView";

@interface ZYMaskView()
@property (nonatomic, assign) CGRect showClearFrame;      /**< 展示透明的位置 */
@end

@implementation ZYMaskView



#pragma mark - Public Methods

+ (void)zy_showWithClearFrame:(CGRect)clearRect
{
    // TODO:<MrZY> Add a constraint
    
    // show
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kIsShowCoverGuideView]) { // Did show?
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kIsShowCoverGuideView];
        ZYMaskView *maskView = [[ZYMaskView alloc] initWithFrame:[UIScreen mainScreen].bounds
                                                                               showClearFrame:clearRect];
        [maskView showMaskView];
    }
}

#pragma mark - Public Methods

- (void)showMaskView
{
    
    if (!self.superview) {
        [[UIApplication sharedApplication].delegate.window addSubview:self];
    }
}

- (void)hidenMaskView
{
    if (self.superview) {
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 0;
            self.backgroundColor = [UIColor clearColor];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame showClearFrame:(CGRect)rect
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.showClearFrame = rect;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenMaskView)];
    [self addGestureRecognizer:tap];
    
    // 展示视图
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.showClearFrame cornerRadius:10];
    [path appendPath:[UIBezierPath bezierPathWithRect:self.bounds]];
    maskLayer.path = path.CGPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    self.layer.mask = maskLayer;
    
    
//    [self addSubview:self.guidenImgView];
//    [self.layer addSublayer:self.guidenImgView.layer];
}


//- (UIImageView *)guidenImgView
//{
//    if (!_guidenImgView) {
//        
//        UIImage *image =  [UIImage imageNamed:@"12_find_popExplain"];
//        _guidenImgView = [[UIImageView alloc] init];
//        _guidenImgView.y = self.showClearFrame.origin.y + self.showClearFrame.size.height + kNJQAutoSize375(5);
//        _guidenImgView.width = image.size.width;
//        _guidenImgView.height = image.size.height;
//        _guidenImgView.x = ScreenWidth - image.size.width;
//        _guidenImgView.image = image;
//    }
//    return _guidenImgView;
//}


@end
