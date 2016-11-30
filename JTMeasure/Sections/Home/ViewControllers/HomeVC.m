//
//  HomeVC.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/19.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "HomeVC.h"
#import "CircleView.h"
#import "HomeNextVC.h"
#import <objc/runtime.h>
#import "RKNotificationHub.h"
#import "SaveDataManager.h"
#import "PersonInfoModel.h"
#import "ReformerProtocol.h"

#import "UIView+Bagde.h"

#import "JTClient.h"

#import "HitTestView.h"

#import <objc/runtime.h>

#import "WebCommunicationViewCtr.h"

#import "TestViewCtr.h"

@interface HomeVC()<UIAlertViewDelegate>

@property (nonatomic, strong) UIView *infoView;
@property (nonatomic, strong) UIView *menuView;
@property (nonatomic, strong) UIScrollView *scorllView;
@property (nonatomic, strong) UIView       *containerView;

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation HomeVC

#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *rightB = [[UIBarButtonItem alloc] initWithTitle:@"下一页"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(rightBarItemClicked)];
    self.navigationItem.rightBarButtonItem = rightB;
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = self.view.center;
    self.indicatorView = indicator;
    [indicator startAnimating];
    [self.view addSubview:indicator];
    
    [self performSelector:@selector(addMainView) withObject:nil afterDelay:5.0];
    
    self.view.viewTagName = @"首页";
    NSLog(@"viewTagName:%@",self.view.viewTagName);
    
    self.view.viewTagName = @"此页";
    NSLog(@"viewTagName:%@",self.view.viewTagName);
    
    self.view.cusFrame = CGRectMake(0, 0, 100, 100);
    NSLog(@"cusFrame:%@",NSStringFromCGRect(self.view.cusFrame));
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"alert...");
}

- (void)viewWillLayoutSubviews {
    NSLog(@"willLayout..");
}

- (void)viewDidLayoutSubviews {
    NSLog(@"didLayout..");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"willAppear..");
}

- (void)addConstraint {
    
}

- (void)addMainView {
    [self.indicatorView stopAnimating];
    [self.view addSubview:self.scorllView];
    [self.scorllView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 49, 0));
    }];
}

#pragma mark -- Delegate

#pragma mark -- EventResponse
- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"按钮点击...");
    UILabel *lableOne = [self.infoView viewWithTag:1000];
    lableOne.text = @"姓名";
    
    UILabel *labelTwo = [self.infoView viewWithTag:1001];
    labelTwo.text = @"联系电话";
}

- (void)rightBarItemClicked {
//    HomeNextVC *nextVC = [[HomeNextVC alloc] init];
//    [self.navigationController pushViewController:nextVC animated:YES];
    
//    WebCommunicationViewCtr *webViewCtr = [[WebCommunicationViewCtr alloc] init];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"TestHtml.html" ofType:nil];
//    webViewCtr.urlString = path;
//    //事件
//    webViewCtr.urls = @[path];
//    __weak typeof(self)weakSelf = self;
//    void(^pushBlock)(NSString *) = ^(NSString *name){
//        NSLog(@"name:%@",name);
//        HomeNextVC *homeViewCtr = [[HomeNextVC alloc] init];
//        [weakSelf.navigationController pushViewController:homeViewCtr animated:YES];
//    };
//    void(^helloBlock)() = ^(){
//        NSLog(@"hello...");
//    };
//    webViewCtr.blocks = @[@{@"helloWithName": pushBlock, @"hello": helloBlock}];
//    [self.navigationController pushViewController:webViewCtr animated:YES];
    
    TestViewCtr *testVC = [[TestViewCtr alloc] init];
    testVC.type = CFCacheTypeThree;
    [self.navigationController pushViewController:testVC animated:YES];
    
}

- (void)menuButtonClicked:(UIButton *)sender {
    NSLog(@"senderTag:%ld",sender.tag);
    
    UIView *view = [self.menuView viewWithTag:1000];
    NSLog(@"class:%@",NSStringFromClass(view.class));
}

#pragma mark -- PrivateMethod

#pragma mark -- Getter/Setter
- (UIScrollView *)scorllView {
    if (!_scorllView) {
        _scorllView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        [_scorllView addSubview:self.containerView];
        [_scorllView setContentSize:CGSizeMake(0, self.containerView.bounds.size.height)];
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scorllView).insets(UIEdgeInsetsZero);
            make.width.equalTo([UIScreen mainScreen].bounds.size.width);
        }];
    }
    return _scorllView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
        _containerView.backgroundColor = [UIColor greenColor];
        
        [_containerView addSubview:self.infoView];
        [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(_containerView);
            make.top.equalTo(_containerView);
        }];
        
        [_containerView addSubview:self.menuView];
        [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoView.mas_bottom);
            make.left.and.right.equalTo(_containerView);
            make.bottom.equalTo(_containerView).offset(-10);
        }];
    }
    return _containerView;
}

- (UIView *)infoView {
    if (!_infoView) {
        _infoView = [[UIView alloc] initWithFrame:CGRectZero];
        _infoView.backgroundColor = [UIColor redColor];
        
        UILabel *labelOne = [[UILabel alloc] initWithFrame:CGRectZero];
        labelOne.text = @"姓名:";
        labelOne.tag = 1000;
        [_infoView addSubview:labelOne];
        [labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(10);
        }];
        
        UILabel *labelTwo = [[UILabel alloc] initWithFrame:CGRectZero];
        labelTwo.text = @"电话:";
        labelTwo.tag = 1001;
        [_infoView addSubview:labelTwo];
        [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(labelOne.mas_bottom).offset(5);
            make.bottom.equalTo(-10);
        }];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
        [button setTitle:@"按钮" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_infoView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelOne.mas_right).offset(10);
            make.centerY.equalTo(_infoView);
            make.right.equalTo(-10);
        }];
    }
    return _infoView;
}

- (UIView *)menuView {
    if (!_menuView) {
        _menuView = [[UIView alloc] initWithFrame:CGRectZero];
        _menuView.backgroundColor = [UIColor orangeColor];
        
        UIButton *lastButton = nil;
        for (int i=0; i<20; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
            [button setTitle:[@(i) stringValue] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor whiteColor]];
            [button setTag:i + 1000];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(menuButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_menuView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.and.height.equalTo(([UIScreen mainScreen].bounds.size.width -40) / 3);
                if (i==0) {
                    make.left.equalTo(_menuView).offset(10);
                    make.top.equalTo(_menuView).offset(10);
                }else if(i%3==0 && i!=0){
                    make.left.equalTo(_menuView).offset(10);
                    make.top.equalTo(lastButton.mas_bottom).offset(10);
                }else {
                    make.left.equalTo(lastButton.mas_right).offset(10);
                    make.top.equalTo(lastButton.mas_top);
                }
                
                if (i==20-1) {
                    make.bottom.equalTo(_menuView.bottom).offset(-10);
                }
            }];
            lastButton = button;
        }
    }
    return _menuView;
}

@end
