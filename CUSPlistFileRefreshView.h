//
//  CUSPlistFileRefreshView.h
//  TestRefreshWithPlist
//
//  Created by wangjun on 14-11-12.
//  Copyright (c) 2014年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - CUSPlistFileRefreshView

@protocol CUSPlistFileRefreshViewDelegate;

@interface CUSPlistFileRefreshView : UIView

/**
 *  下拉高度，下拉多少后，执行刷新方法   default:80pt
 */
@property (nonatomic, assign) CGFloat dropHeight;

/**
 *  线条颜色    default:[UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 *  线条宽度    default:1.0pt
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 *  缩放比例    default:1.0
 */
@property (nonatomic, assign) CGFloat zoomScale;

/**
 *  水平随机离散数，用于动画    default:180
 */
@property (nonatomic, assign) int horizontalRandomness;

/**
 *  反向执行动画，用于动画开始结束时，动画执行顺序颠倒   default:YES
 */
@property (nonatomic, assign) BOOL reverseLoadingAnimation;

/**
 *  动画属性，用于控制动画效果   default:0.5
 */
@property (nonatomic, assign) CGFloat internalAnimationFactor;

/**
 *  委托方法
 */
@property (nonatomic, assign) id<CUSPlistFileRefreshViewDelegate> delegate;

/**
 *  初始化方法
 *
 *  @param plist 传入Plist文件名，不传，或者传入的plist文件不存在时，有默认的图形
 *
 *  @return 返回该类的实例
 */
- (instancetype)initWithPlist:(NSString *)plist;

/**
 *  公共方法, UIScrollView滚动完成时调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

/**
 *  公共方法, UIScrollView拖动完成时调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView;

/**
 *  公共方法, 刷新完成
 */
- (void)refreshFinished;

@end

#pragma mark - CUSPlistFileRefreshViewDelegate
@protocol CUSPlistFileRefreshViewDelegate <NSObject>

/**
 *  委托方法，开始刷新
 *
 *  @param view 当前View
 */
- (void)cusplistRefeshViewDidStarRefresh:(CUSPlistFileRefreshView *)view;

@end
