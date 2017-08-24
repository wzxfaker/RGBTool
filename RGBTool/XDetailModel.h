//
//  XDetailModel.h
//  RGBTool
//
//  Created by admin on 23/08/2017.
//  Copyright © 2017 gcg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDetailModel : NSObject

/** title */
@property (nonatomic, copy) NSString *title;
/** 关联的类 */
@property (nonatomic, strong) Class detailClass;

+ (NSArray *)loadAllDetailModel;

@end
