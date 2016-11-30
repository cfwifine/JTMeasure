//
//  CFScrollView.h
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CFScrollViewCell;

@protocol CFScrollViewDelegate <NSObject>



@end

@interface CFScrollView : UIScrollView

@property (nonatomic, weak) id<CFScrollViewDelegate> delegateForCell;

- (CFScrollViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

@end
