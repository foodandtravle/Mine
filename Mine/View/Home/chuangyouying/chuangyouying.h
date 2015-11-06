//
//  chuangyouying.h
//  Mine
//
//  Created by 张德强 on 15/11/5.
//  Copyright © 2015年 张德强. All rights reserved.
//

#import "BaseViewController.h"

@interface chuangyouying : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataArr;


@end
