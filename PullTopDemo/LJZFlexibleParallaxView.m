

//
//  LJZFlexibleParallaxView.m
//  PullTopDemo
//
//  Created by 李金柱 on 15/12/28.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import "LJZFlexibleParallaxView.h"
#import "UIView+Extention.h"
static const CGFloat kFlexibleWidht = 0.7;
@interface LJZFlexibleParallaxView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIScrollView  *scrollView;
@property (nonatomic,assign) CGRect  defaultTopViewRect;

@end

@implementation LJZFlexibleParallaxView

- (instancetype)initWithFrame:(CGRect)frame topView:(UIView *)topView{
    if (self = [super initWithFrame:frame]) {
        _topView = topView;
        [self addSubView:_topView];
        
        
        _scrollView = [[UIScrollView alloc]initWithFrame:frame];
        _scrollView.delegate = self;
        [self addSubView:_scrollView];
        self.defaultTopViewRect = _topView.frame;
    }
    return self;
}

- (void)setContentSize:(CGSize)size{
    [self.scrollView setContentSize:size];
}

- (void)addSubView:(UIView *)view {
    if (self.topView == view || self.scrollView == view) {
        [self addSubview:view];
    } else {
        [self.scrollView addSubview:view];
    }
}

#pragma
#pragma  mark =================scrollViewDelegate=================
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.contentOffSet = scrollView.contentOffset;
    if ([_delegate respondsToSelector:@selector(flexibleParallaxViewDidScroll:)]) {
        [self.delegate flexibleParallaxViewDidScroll:self];
    }
    if (scrollView.contentOffset.y < 0) {
        CGFloat offsetY = -scrollView.contentOffset.y;
        CGFloat oldH = self.defaultTopViewRect.size.height;
        CGFloat oldW = self.defaultTopViewRect.size.width;
        CGFloat newH = oldH + offsetY;
        CGFloat newW = oldW * (newH/oldH);
        self.topView.frame = CGRectMake(0, 0, newW, newH);
        self.topView.center = CGPointMake(self.center.x, self.topView.center.y);
        
    }else{
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY > _topView.frame.size.height) {
            if ([_delegate respondsToSelector:@selector(flexibleParallaxViewDidScrollToTop:)]) {
                [self.delegate flexibleParallaxViewDidScrollToTop:self];
            }
            
        }
        if (offsetY < _topView.frame.size.height) {
            if ([_delegate respondsToSelector:@selector(flexibleParallaxViewDidScrollFromTop:)]) {
                [self.delegate flexibleParallaxViewDidScrollFromTop:self];
            }
        }
        CGRect frame = self.topView.frame;
        frame.origin.y = -offsetY*kFlexibleWidht;
        self.topView.frame = frame;
    }
}

@end
