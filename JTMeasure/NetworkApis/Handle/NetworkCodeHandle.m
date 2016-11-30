//
//  NetworkCodeHandle.m
//  
//
//  Created by 魏初芳 on 16/3/7.
//
//

#import "NetworkCodeHandle.h"
#import "ProgressHUDHandler.h"

@implementation NetworkCodeHandle

+ (void)handleResponse:(id)response isShowTipStr:(BOOL)showTipStr{
    
    NSNumber *codeNumber = [response objectForKey:@"code"];
    
    NSInteger code = [codeNumber integerValue];
    
    NSString *msg = [response objectForKey:@"msg"];
    
    switch (code) {
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            
            break;
    }
    
    [ProgressHUDHandler showMBInfoTipStr:msg];
}

@end
