//
//  LJZButtonGroup.m
//  PullTopDemo
//
//  Created by 李金柱 on 15/12/28.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import "LJZButtonGroup.h"
static const CGFloat kMargin = 20;
static const CGFloat kButtonW = 44;
@implementation LJZButtonGroup
- (instancetype)initWithButtons:(NSArray *)buttons {
    self = [super init];
    if (self) {
        _buttons = buttons;
        [self setUpButtons];
        
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

- (void)setUpButtons {
    
    for (NSInteger i=0; i<_buttons.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(200 + (kButtonW+kMargin)*i, 0, kButtonW, kButtonW);
        [button setImage:[UIImage imageNamed:_buttons[i]] forState:UIControlStateNormal];
        [self addSubview:button];
    }
    
}

@end
