//
//  TabBarViewController.m
//  Mine
//
//  Created by 张德强 on 15/11/4.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor yellowColor];
    
    /*#import "HomeViewController.h"
     #import "BuyViewController.h"
     #import "MineViewController.h"*/
    
    NSArray *arr=@[@"HomeViewController",@"BuyViewController",@"MineViewController"];
    
    NSArray *titleArr=@[@"首页",@"购物",@"我的"];
    
    NSMutableArray *ncArr=[NSMutableArray array];
    
    for (NSInteger i=0; i<3; i++) {
        
        Class cl=NSClassFromString(arr[i]);
        
        UIViewController *vc=[[cl alloc]init];
        
        vc.navigationItem.title=titleArr[i];
        
        UINavigationController *nc=[[UINavigationController alloc]initWithRootViewController:vc];
        
        UITabBarItem *item=[[UITabBarItem alloc]initWithTitle:titleArr[i] image:nil selectedImage:nil];
        
        [item setTitlePositionAdjustment:UIOffsetMake(0, -4)];//字体上移
        
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
        
        nc.tabBarItem=item;
        
        [ncArr addObject:nc];
        
    }
    
    self.viewControllers=ncArr;
    
    self.selectedIndex=0;//响应顺序
    
//    self.tabBar.backgroundImage=[UIImage imageNamed:@""];//tabBar的
    
    
    
    
    
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
