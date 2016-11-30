//
//  ParticularVC.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/19.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "ParticularVC.h"

@interface ParticularVC()
{
    UILabel *label2;
    NSString *title;
}
@property (nonatomic, strong) UIScrollView *mainScrollView;

@end

@implementation ParticularVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"加盟合作";
    self.view.backgroundColor = [UIColor goldColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"点我" style:UIBarButtonItemStylePlain target:self action:@selector(buttonCicked)];
    self.navigationItem.rightBarButtonItem = item;
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    _mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainScrollView];
    [_mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *subContentView = [[UIView alloc]initWithFrame:CGRectZero];
    subContentView.backgroundColor = [UIColor redColor];
    [_mainScrollView addSubview:subContentView];
    [subContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_mainScrollView);
        make.width.equalTo(_mainScrollView);
    }];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectZero];
    blueView.backgroundColor = [UIColor blueColor];
    [self initBlueViewSubViewWithSuperView:blueView];
    [subContentView addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.and.left.equalTo(subContentView);
//        make.height.equalTo(400);
    }];
    
    UIView *orangeView = [[UIView alloc] initWithFrame:CGRectZero];
    orangeView.backgroundColor = [UIColor orangeColor];
    [subContentView addSubview:orangeView];
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(subContentView);
        make.top.equalTo(blueView.mas_bottom);
        make.height.equalTo(300);
    }];
    
    UIView *purpleView = [[UIView alloc] initWithFrame:CGRectZero];
    purpleView.backgroundColor = [UIColor purpleColor];
    [subContentView addSubview:purpleView];
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(subContentView);
        make.top.equalTo(orangeView.mas_bottom);
        make.height.equalTo(400);
        make.bottom.equalTo(subContentView);
    }];
}

- (void)initBlueViewSubViewWithSuperView:(UIView *)superView {
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    label1.backgroundColor = [UIColor whiteColor];
    label1.text = @"label1";
    label1.font = [UIFont systemFontOfSize:25];
    [superView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.equalTo(superView);
    }];
    
    label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    label2.backgroundColor = [UIColor grayColor];
    label2.text = @"label2即将开始及佛教金佛结果就饿哦感觉机构借给了饥饿感给偶个记录是根据偶感觉国际格局";
    label2.numberOfLines = 0;
    label2.font = [UIFont systemFontOfSize:20];
    [superView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView);
        make.right.equalTo(superView).offset(-50);
        make.top.equalTo(label1.mas_bottom);
        make.bottom.equalTo(superView.bottom);
    }];
    
    MASAttachKeys(label1, label2);
}

- (void)buttonCicked {
    title = [label2.text stringByAppendingString:@"附件五路口附近"];
    
    label2.text = title;
}

@end
