//
//  BaseViewController.m
//  Mine
//
//  Created by 张德强 on 15/11/4.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //navigationBar   取消透明效果
    self.navigationController.navigationBar.translucent=NO;
    
    //导航条设置背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"image_back_controller"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
