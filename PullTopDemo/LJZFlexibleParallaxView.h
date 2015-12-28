//
//  LJZFlexibleParallaxView.h
//  PullTopDemo
//
//  Created by 李金柱 on 15/12/28.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJZFlexibleParallaxView;
@protocol  LJZFlexibleParallaxViewDelegate<NSObject>

- (void)flexibleParallaxViewDidScrollToTop:(LJZFlexibleParallaxView *)flexibleView;
- (void)flexibleParallaxViewDidScrollFromTop:(LJZFlexibleParallaxView *)flexibleView;
- (void)flexibleParallaxViewDidScroll:(LJZFlexibleParallaxView *)flexibleView;
@end

@interface LJZFlexibleParallaxView : UIView
- (instancetype)initWithFrame:(CGRect)frame topView:(UIView *)topView;
- (void)setContentSize:(CGSize)size;
- (void)addSubView:(UIView *)view;
@property (nonatomic,weak)        id<LJZFlexibleParallaxViewDelegate> delegate;
@property (nonatomic)        CGPoint contentOffSet;
@end
