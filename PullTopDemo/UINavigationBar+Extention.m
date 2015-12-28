//
//  UINavigationBar+Extention.m
//  PullTopDemo
//
//  Created by 李金柱 on 15/12/28.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import "UINavigationBar+Extention.h"
#import <objc/runtime.h>
const void *viewKey = @"viewKey";

@implementation UINavigationBar (Extention)
- (UIView *)overlay{
   
    return objc_getAssociatedObject(self,viewKey);
}
- (void)setOverlay:(UIView *)overlay{
    objc_setAssociatedObject(self, viewKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (void)ljz_setBackgroudColor:(UIColor *)backgroundColor{

    if (!self.overlay) {
        [self setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[[UIImage alloc]init]];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;

}
@end
