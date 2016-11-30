//
//  ReformerProtocol.h
//  JTMeasure
//
//  Created by comv on 2016/10/21.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReformerProtocol <NSObject>

@required
- (NSDictionary *)reformerDataWithRowData:(NSDictionary *)rowData filterCondition:(NSDictionary *)condition;

@end








