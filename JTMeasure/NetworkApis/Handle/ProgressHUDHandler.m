//
//  ProgressHUDHandler.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/2.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "ProgressHUDHandler.h"

@implementation ProgressHUDHandler

//**************************  SVProgress  ********************
/** SV成功提示*/
+ (void)showSVSuccessTipStr:(NSString *)tipStr {
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] ];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor] ];
    [SVProgressHUD showSuccessWithStatus:tipStr maskType:SVProgressHUDMaskTypeClear];
}

/** SV错误提示*/
+ (void)showSVErrorTipStr:(NSString *)errorStr {
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] ];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor] ];
    [SVProgressHUD showErrorWithStatus:errorStr maskType:SVProgressHUDMaskTypeClear];

}

/** SV提示信息*/
+ (void)showSVInfoTipStr:(NSString *)errorStr {
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] ];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor] ];
    [SVProgressHUD showInfoWithStatus:errorStr maskType:SVProgressHUDMaskTypeClear];
}

/** SV等待提示*/
+ (void)showSVWaiting {
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    [SVProgressHUD setForegroundColor:[UIColor orangeColor]];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
}

/** SV下载、上传进度*/
+ (void)showSVProgress:(float)progress {
    [SVProgressHUD showProgress:progress status:@"请稍等" maskType:SVProgressHUDMaskTypeBlack];
}

/** SV隐藏*/
+ (void)dismissSV {
    [SVProgressHUD dismiss];
}

//**************************  MBProgress  ********************
/** MB成功提示*/
+ (void)showMBSuccessTipStr:(NSString *)tipStr {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    imageView.image        = [UIImage imageNamed:@"b"];
    MBProgressHUD *hud   = [ProgressHUDHandler configMBStyleWithMode:MBProgressHUDModeCustomView customView:imageView];
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
    hud.detailsLabelText = tipStr;
    [hud hide:YES afterDelay:1.5];

}

/** MB错误提示*/
+ (void)showMBErrorTipStr:(NSString *)errorStr {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    imageView.image        = [UIImage imageNamed:@"b"];
    MBProgressHUD *hud   = [ProgressHUDHandler configMBStyleWithMode:MBProgressHUDModeCustomView customView:imageView];
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
    hud.detailsLabelText = errorStr;
    [hud hide:YES afterDelay:1.5];
}

/** MB提示信息*/
+ (void)showMBInfoTipStr:(NSString *)tipStr {
    MBProgressHUD *hud = [ProgressHUDHandler configMBStyleWithMode:MBProgressHUDModeText customView:nil];
    hud.detailsLabelFont          = [UIFont boldSystemFontOfSize:15.0];
    hud.detailsLabelText          = tipStr;
    hud.margin                    = 10.0;
    [hud hide:YES afterDelay:1.5];
}

/** MB等待提示*/
+ (void)showMBWaitingInView:(UIView *)view {
    if (view) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.animationType             = MBProgressHUDAnimationZoom;
        hud.mode                      = MBProgressHUDModeIndeterminate;
        hud.labelText                 = @"加载中";
        hud.labelFont                 = [UIFont systemFontOfSize:12];
        hud.removeFromSuperViewOnHide = YES;
        hud.square                    = YES;
    }else {
        MBProgressHUD *hud = [ProgressHUDHandler configMBStyleWithMode:MBProgressHUDModeIndeterminate customView:nil];
        hud.labelText      = @"加载中";
        hud.labelFont      = [UIFont systemFontOfSize:12];
    }
}

/** MB隐藏*/
+ (void)hideInView:(UIView *)view {
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

#pragma mark -- PrivateMethod
+ (MBProgressHUD *)configMBStyleWithMode:(MBProgressHUDMode)mode customView:(UIView *)customView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    hud.animationType             = MBProgressHUDAnimationZoom;
    hud.mode                      = mode;
    if (customView) {
        hud.customView            = customView;
    }
    hud.removeFromSuperViewOnHide = YES;
    hud.square                    = YES;
    return hud;
}

@end
