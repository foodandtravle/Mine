//
//  dianpuzhuce.h
//  Mine
//
//  Created by 张德强 on 15/11/5.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "BaseViewController.h"

@interface dianpuzhuce : BaseViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property(nonatomic,strong)UIButton *shenBtn;//开店申请

@property(nonatomic,strong)UIButton *jiaoBtn;//会员缴费

@property(nonatomic,strong)UIScrollView *scrollView;//主页面的滚动视图

@property(nonatomic,strong)UIButton *commitBtn;//提交按钮


@property(nonatomic,strong)UIPickerView *pickView;

@property(nonatomic,strong)NSMutableArray *pickArr;//pickView数据源

@property(nonatomic,strong)UIToolbar *toolBar;



@end
