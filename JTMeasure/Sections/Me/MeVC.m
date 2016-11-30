//
//  MeVC.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/19.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "MeVC.h"
#import "NextVC.h"
#import "TestVC.h"

static NSString *name = @"田";

@interface MeVC()

@end

@implementation MeVC
{
    UIImage *_image;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人中心";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

+ (void)pringName {
    NSLog(@"name:%@",name);
}


- (void)initUI {
    BaseButton *nextButton = [BaseButton defaultButton];
    [nextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton borderRadius:35 / 2 borderColor:[UIColor orangeRed] borderWidth:2.0];
    [self.view addSubview:nextButton];
    
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.5);
        make.height.equalTo(35);
    }];
    
}

- (void)nextButtonCliked:(id)sender {
    TestVC *testVC = [[TestVC alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];

}



@end
