//
//  TestViewCtr.h
//  JTMeasure
//
//  Created by comv on 2016/11/22.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CFCacheType){
    CFCacheTypeOne=1<<0,
    CFCacheTypeTwo=1<<1,
    CFCacheTypeThree=1<<2,
};

@interface TestViewCtr : UIViewController


@property (nonatomic, assign) CFCacheType type;


@end


@interface GloblaConfig : NSObject

@property (nonatomic, strong) NSString *name;

@end

