//
//  XMosaicViewController.m
//  RGBTool
//
//  Created by admin on 23/08/2017.
//  Copyright © 2017 gcg. All rights reserved.
//

#import "XMosaicViewController.h"
#import "XRGBTool.h"

@interface XMosaicViewController ()

@end

@implementation XMosaicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //遍历像素点实现马赛克效果
    UIImageView *pixelImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-200)*0.5, 50+64, 200, 200)];
    pixelImageView.contentMode = UIViewContentModeScaleAspectFill;
    pixelImageView.image = [XRGBTool getMosaicImageWith:[UIImage imageNamed:@"qq"] level:0];
    [self.view addSubview:pixelImageView];
    
    //通过滤镜实现马赛克(滤镜只能处理.png类型的图片，必须star.jpeg就没有效果)
    UIImageView *filterImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-200)*0.5, 300+64, 200, 200)];
    filterImageView.image = [XRGBTool getFilterMosaicImageWith:[UIImage imageNamed:@"qq"]];
    [self.view addSubview:filterImageView];
    
    //所有滤镜
    NSArray *filters = [CIFilter filterNamesInCategory:kCICategoryDistortionEffect];
    for (NSString *filterName in filters) {
        CIFilter *filter = [CIFilter filterWithName:filterName];
        NSDictionary *attr = [filter attributes];
//        NSLog(@"filterName -> %@,attr -> %@",filterName,attr);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
