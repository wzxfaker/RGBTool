
//
//  XDetailModel.m
//  RGBTool
//
//  Created by admin on 23/08/2017.
//  Copyright © 2017 gcg. All rights reserved.
//

#import "XDetailModel.h"
#import "XPixelsViewController.h"
#import "XMosaicViewController.h"
#import "XScratchViewController.h"

@implementation XDetailModel

- (instancetype)initWithTitle:(NSString *)title class:(Class)detailClass{
    if (self = [super init]) {
        self.title = title;
        self.detailClass = detailClass;
    }
    return self;
}

+ (XDetailModel *)detailModelWithTitle:(NSString *)title class:(Class)detailClass{
    return [[self alloc] initWithTitle:title class:detailClass];
}

+ (NSArray *)loadAllDetailModel{
    XDetailModel *detailOne = [XDetailModel detailModelWithTitle:@"像素" class:[XPixelsViewController class]];
    XDetailModel *detailTwo = [XDetailModel detailModelWithTitle:@"马赛克" class:[XMosaicViewController class]];
    XDetailModel *detailThree = [XDetailModel detailModelWithTitle:@"涂抹马赛克" class:[XScratchViewController class]];
    return @[detailOne,detailTwo,detailThree];
}


@end
