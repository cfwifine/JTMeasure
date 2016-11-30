//
//  AuthorityManager.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/22.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "AuthorityManager.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

@interface AuthorityManager()<UIAlertViewDelegate>

@end

@implementation AuthorityManager

+ (instancetype)sharedAuthorityManager {
    static dispatch_once_t predicate;
    static AuthorityManager *shareInstance = nil;
    dispatch_once(&predicate, ^{
        shareInstance = [[AuthorityManager alloc] init];
    });
    return shareInstance;
}

- (BOOL)hasAuthoritedWithType:(AuthorityType)type shouldAlert:(BOOL)alert {
    NSString *title = nil;
    NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [bundleInfo valueForKey:@"CFBundleDisplayName"];
    switch (type) {
        case AuthorityTypeLocation:{   //定位
            BOOL hasServer = [CLLocationManager locationServicesEnabled] &&
            ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized
                                                                         ||
             [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined);
            if (!hasServer && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
                title = ios8x ? @"需要访问您的位置，请到设置里打开位置服务" : [NSString stringWithFormat:@"您关闭了%@访问位置的权限，请在[设置]->[隐私]->[定位服务]里允许%@访问定位服务",appName,appName];
                
            }else{
                return YES;
            }
        }
            break;
        case AuthorityTypeCamara:{     //相机
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
            {
                
                title = ios8x ? @"需要访问您的相机，请到设置里打开相机服务" : [NSString stringWithFormat:@"您关闭了%@访问相机的权限，请在[设置]->[隐私]->[相机]里允许%@打开相机",appName,appName];
                
            }else{
                return YES;
            }
            
        }
            break;
        case AuthorityTypePhotos:{     //相册
            ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
            if (author == kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied){
                
                title = ios8x ? @"需要访问您的相册，请到设置里打开相册服务" : [NSString stringWithFormat:@"您关闭了%@访问相册的权限，请在[设置]->[隐私]->[照片]里允许%@访问相册",appName,appName];
                
            }else{
                return YES;
            }

        }
            break;
        case AuthorityTypeMicrophonic:{//麦克风
            AVAudioSession *avSession = [AVAudioSession sharedInstance];
            if ([avSession respondsToSelector:@selector(requestRecordPermission:)]) {
                __block NSString *result;
                __block BOOL canRecord = NO;
                [avSession requestRecordPermission:^(BOOL available) {
                    if (available) {
                        canRecord = YES;
                    }else{
                        result = ios8x ? @"需要访问您的麦克风，请到设置里打开麦克风服务" : [NSString stringWithFormat:@"您关闭了%@访问麦克风的权限，请在[设置]->[隐私]->[麦克风]里允许%@访问麦克风",appName,appName];
                    }
                }];
                if (canRecord) return YES;
                title = result;
            }else{
                return NO;
            }

        }
            break;
        case AuthorityTypePush:{       //推送
            if (ios8x) {
                if ([[UIApplication sharedApplication] currentUserNotificationSettings].types == 0)
                    return NO;
                else
                    return YES;
            }else{
                if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 0)
                    return NO;
                else
                    return YES;
            }

        }
            break;
        case AuthorityTypeAddressBook: {  //通讯录
            ABAuthorizationStatus ABstatus = ABAddressBookGetAuthorizationStatus();
            if (ABstatus == kABAuthorizationStatusDenied || ABstatus == kABAuthorizationStatusRestricted) {
                title = ios8x ? @"需要访问您的通讯录，请到设置里打开通讯录服务" : [NSString stringWithFormat:@"您关闭了%@访问通讯录的权限，请在[设置]->[隐私]->[通讯录]里允许%@打开通讯录",appName,appName];
                return NO;
            }else {
                return YES;
            }
            
        }
            break;
        case AuthorityTypeEvent: {  //日历
        
        }
            break;
        case AuthorityTypeReminder: { //备忘录
        
        }
            break;
        default:
            break;
    }
    
    if (alert) {
        if (ios8x) {
            UIAlertView *alert =[ [UIAlertView alloc] initWithTitle:title
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"取消"
                                                  otherButtonTitles:@"去设置",nil];
            alert.tag = 66;
            [alert show];
        } else {
            UIAlertView *alert =[ [UIAlertView alloc] initWithTitle:title
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            alert.tag = 67;
            [alert show];
        }

    }
    
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 66 && buttonIndex == 1) {
        if (UIApplicationOpenSettingsURLString != NULL) {
            NSURL *appSettings = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:appSettings];
        }
    }
}

- (BOOL)requestAuthoritedWithType:(AuthorityType)type {
    
    return YES;
}

@end

