//
//  ViewController.m
//  PullTopDemo
//
//  Created by 李金柱 on 15/12/28.
//  Copyright © 2015年 Mr.Li. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Extention.h"
#import "LJZButtonGroup.h"
#import "LJZFlexibleParallaxView.h"

@interface ViewController ()<LJZFlexibleParallaxViewDelegate>
@property (nonatomic,strong) LJZButtonGroup  *buttonGroup;
@property (nonatomic,strong) LJZFlexibleParallaxView  *flexibleView;
@property (nonatomic) CGRect  defaultRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar ljz_setBackgroudColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *topView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    topView.image = [UIImage imageNamed:@"1.jpg"];
    LJZButtonGroup *buttons = [[LJZButtonGroup alloc]initWithButtons:@[@"btn_save",@"btn_share",@"btn_support"]];
    buttons.frame = CGRectMake(0, CGRectGetMaxY(topView.frame) + 30, self.view.frame.size.width, 44);
    self.defaultRect = buttons.frame;
    self.buttonGroup = buttons;
    
    LJZFlexibleParallaxView *flexibleView = [[LJZFlexibleParallaxView alloc]initWithFrame:self.view.frame topView:topView];
    flexibleView.delegate = self;
    [self.view addSubview:flexibleView];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, 400, self.view.frame.size.width - 40, 400)];

    image.image = [UIImage imageNamed:@"2.jpg"];
    image.layer.cornerRadius = 10;
    image.layer.masksToBounds = YES;
    [flexibleView addSubView:buttons];
    [flexibleView addSubView:image];
    [flexibleView setContentSize:CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(image.frame) * 1.5)];
    self.flexibleView = flexibleView;
    
    
  
}

#pragma
#pragma  mark =============LJZFlexibleParallaxViewDelegate==============
- (void)flexibleParallaxViewDidScrollToTop:(LJZFlexibleParallaxView *)flexibleView{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.buttonGroup];
    
}
- (void)flexibleParallaxViewDidScroll:(LJZFlexibleParallaxView *)flexibleView{
    self.buttonGroup.frame = _defaultRect;
    [self.flexibleView addSubView:self.buttonGroup];
}
- (void)flexibleParallaxViewDidScrollFromTop:(LJZFlexibleParallaxView *)flexibleView{
    CGFloat offsetY = flexibleView.contentOffSet.y;
    if (offsetY > 0 ) {
        CGFloat alpha = (offsetY - 64 ) / 64;
        alpha = MIN(alpha, 0.9);
        [self.navigationController.navigationBar ljz_setBackgroudColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
    }else{
        [self.navigationController.navigationBar ljz_setBackgroudColor:[UIColor clearColor]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
