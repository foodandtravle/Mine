//
//  HomeViewController.m
//  Mine
//
//  Created by 张德强 on 15/11/4.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "HomeViewController.h"
#import "Masonry.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=[UIColor redColor];
    
    self.navigationItem.rightBarButtonItem=self.rightItem;
   
    self.navigationItem.titleView=self.search;
    
    [self.view addSubview:self.imgView];
    
    [self leftLable];
    
    [self makeBtn];
}

-(void)makeBtn{
    
    CGFloat w=(maiSrc.width-10)/5;
    
    NSArray *arr=@[@"店铺注册",@"创友营",@"创新汇",@"会员服务",@"创意工厂",@"订单管理",@"财务管理",@"健康友",@"健康搜",@"信息贴",@"逛店铺",@"约服务"];
    
    for (NSInteger i=0; i<4; i++) {
        
        UIButton *btn=[self buttonFrame:CGRectMake(w+10+w*i, 130, w, w) title:arr[i] tag:i+1 action:@selector(btnClick:) target:self nameImage:nil];
        
        [self.view addSubview:btn];
    }
    
    for (NSInteger i=0; i<3; i++) {
        
        UIButton *btn=[self buttonFrame:CGRectMake(w+10+w*i, 130+w, w, w) title:arr[i+4] tag:i+5 action:@selector(btnClick:) target:self nameImage:nil];
        
        [self.view addSubview:btn];
    }
    
    for (NSInteger i=0; i<3; i++) {
        
        UIButton *btn=[self buttonFrame:CGRectMake(w+10+w*i, 130+w+40+w, w, w) title:arr[i+7] tag:i+8 action:@selector(btnClick:) target:self nameImage:nil];
        
        [self.view addSubview:btn];
    }
    
    for (NSInteger i=0; i<2; i++) {
        
        UIButton *btn=[self buttonFrame:CGRectMake(w+10+w*i, 130+w+40+w+40+w, w, w) title:arr[i+10] tag:i+11 action:@selector(btnClick:) target:self nameImage:nil];
        
        [self.view addSubview:btn];
    }
    
}

-(void)leftLable{
    
    CGFloat w=(maiSrc.width-10)/5;
    
    UILabel *lable=[self setLableTitle:@"创客空间"];
    
    [self.view addSubview:lable];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).with.offset(5);
        
        make.top.equalTo(self.view.mas_top).with.offset(130);
        
        make.width.mas_equalTo(w);
        
        make.height.mas_equalTo(2*w);
        
    }];
    
    
    UILabel *lable2=[self setLableTitle:@"健康社区"];
    
    [self.view addSubview:lable2];
    
    [lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.width.mas_equalTo(lable);
        
        make.height.mas_equalTo(w);
        
        make.top.mas_equalTo(lable.mas_bottom).with.offset(40);
    }];
    
    
    UILabel *lable3=[self setLableTitle:@"服务通道"];

    [self.view addSubview:lable3];
    
    [lable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.width.height.mas_equalTo(lable2);
        
        make.top.equalTo(lable2.mas_bottom).with.offset(40);
        
    }];
    
}

-(UIImageView *)imgView{
    
    if (!_imgView) {
        
        _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, maiSrc.width, 100)];
        
        _imgView.backgroundColor=[UIColor yellowColor];
    }
    return _imgView;
}

-(UISearchBar *)search{
    
    if (!_search) {
        
        _search=[[UISearchBar alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
        
        _search.text=@"请输入搜索关键字";
        
        [_search setTintColor:[UIColor redColor]];
        
        [_search setBarStyle:UIBarStyleDefault];
    }
    
    return _search;
}

-(UIBarButtonItem *)rightItem{
    
    if (!_rightItem) {
        
        _rightItem=[self navigationItemTitle:@"消息" target:self action:@selector(rightItemClick)];
    }
    
    return _rightItem;
}




-(void)rightItemClick{
    
    NSLog(@"右边");
}

-(void)btnClick:(UIButton *)sender{
    
    NSArray *arr=@[@"dianpuzhuce",@"chuangyouying",@"chuangxinhui",@"huiyuanfuwu",@"chuangyigongchang",@"dingdanguanli",@"caiwuguanli",@"jiankangyou",@"jiankangsou",@"xinxitie",@"guangdianpu",@"yuefuwu"];
    
    Class cl=NSClassFromString(arr[sender.tag-1]);
    
    UIViewController *vc=[[cl alloc]init];
    
    vc.navigationItem.title=sender.titleLabel.text;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"====%ld",sender.tag);
}




-(UIButton *)buttonFrame:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag action:(SEL)action target:(id)target nameImage:(NSString *)image{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=frame;
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    btn.tag=tag;

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
//    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    btn.layer.masksToBounds=YES;
    
    CGFloat a=frame.size.width;

    btn.layer.cornerRadius=a/2;
    
    btn.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    
    btn.layer.borderWidth=1;
    
    [btn setBackgroundColor:[UIColor whiteColor]];
    
    return btn;
}

-(UILabel *)setLableTitle:(NSString *)title {
    
    UILabel *lable=[[UILabel alloc]init];
    
    lable.text=title;
    
    lable.backgroundColor=[UIColor whiteColor];
    
    lable.layer.masksToBounds=YES;
    
    lable.layer.cornerRadius=5;
    
    lable.layer.borderWidth=1;
    
    lable.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    lable.font=[UIFont systemFontOfSize:27];
    
    lable.numberOfLines=0;
    
    lable.textAlignment=NSTextAlignmentCenter;
    
    return lable;
}

-(UIBarButtonItem *)navigationItemTitle:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=CGRectMake(10, 10, 40, 40);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    return item;
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
