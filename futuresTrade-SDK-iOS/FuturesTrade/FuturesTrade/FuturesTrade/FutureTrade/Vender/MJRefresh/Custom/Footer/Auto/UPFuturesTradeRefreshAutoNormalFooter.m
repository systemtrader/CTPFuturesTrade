//
//  UPFuturesTradeRefreshAutoNormalFooter.m
//  UPFuturesTradeRefreshExample
//
//  Created by UPFuturesTrade Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "UPFuturesTradeRefreshAutoNormalFooter.h"

@interface UPFuturesTradeRefreshAutoNormalFooter()
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@end

@implementation UPFuturesTradeRefreshAutoNormalFooter
#pragma mark - 懒加载子控件
- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
    self.loadingView = nil;
    [self setNeedsLayout];
}
#pragma mark - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.loadingView.constraints.count) return;
    
    // 圈圈
    CGFloat loadingCenterX = self.UPFuturesTrade_w * 0.5;
    if (!self.isRefreshingTitleHidden) {
        loadingCenterX -= self.stateLabel.UPFuturesTrade_textWith * 0.5 + self.labelLeftInset;
    }
    CGFloat loadingCenterY = self.UPFuturesTrade_h * 0.5;
    self.loadingView.center = CGPointMake(loadingCenterX, loadingCenterY);
}

- (void)setState:(UPFuturesTradeRefreshState)state
{
    UPFuturesTradeRefreshCheckState
    
    // 根据状态做事情
    if (state == UPFuturesTradeRefreshStateNoMoreData || state == UPFuturesTradeRefreshStateIdle) {
        [self.loadingView stopAnimating];
    } else if (state == UPFuturesTradeRefreshStateRefreshing) {
        [self.loadingView startAnimating];
    }
}

@end
