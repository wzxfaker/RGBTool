//
//  XPixelsViewController.m
//  RGBTool
//
//  Created by admin on 23/08/2017.
//  Copyright © 2017 gcg. All rights reserved.
//

#import "XPixelsViewController.h"
#import "XRGBTool.h"

@interface XPixelsViewController ()

@end

@implementation XPixelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *originalImageV = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-200)*0.5, 50+64, 200, 200)];
    originalImageV.image = [UIImage imageNamed:@"qq"];
    [self.view addSubview:originalImageV];
    
    UIImageView *dealedImageV = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-200)*0.5, 300+64, 200, 200)];
    dealedImageV.image = [XRGBTool changePicColorPartial:[UIImage imageNamed:@"qq"]];
    [self.view addSubview:dealedImageV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
