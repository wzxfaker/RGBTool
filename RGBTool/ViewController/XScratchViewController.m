//
//  XScratchViewController.m
//  RGBTool
//
//  Created by admin on 23/08/2017.
//  Copyright © 2017 gcg. All rights reserved.
//

#import "XScratchViewController.h"
#import "XScratchView.h"
#import "XRGBTool.h"

@interface XScratchViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/** <##> */
@property (nonatomic, strong) XScratchView *scratchView;

@end

@implementation XScratchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    XScratchView *scratchView = [[XScratchView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 300)];
//    scratchView.mosaicImage = [XRGBTool getFilterMosaicImageWith:[UIImage imageNamed:@"qq.png"]];
    scratchView.surfaceImage = [UIImage imageNamed:@"smoke.jpeg"];
    scratchView.mosaicImage = [XRGBTool getMosaicImageWith:[UIImage imageNamed:@"smoke.jpeg"] level:0];
    
    _scratchView = scratchView;
    [self.view addSubview:scratchView];

    UIButton *recoverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    recoverBtn.frame = CGRectMake((kScreenWidth-100)*0.5, 450, 100, 40);
    [recoverBtn setTitle:@"复原" forState:UIControlStateNormal];
    [recoverBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [recoverBtn addTarget:self action:@selector(recover) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:recoverBtn];
    
    UIButton *picBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    picBtn.frame = CGRectMake((kScreenWidth-100)*0.5, 500, 100, 40);
    [picBtn setTitle:@"更换图片" forState:UIControlStateNormal];
    [picBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [picBtn addTarget:self action:@selector(selectPic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:picBtn];
}

- (void)recover{
    [_scratchView recover];

}

- (void)selectPic{
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerVC.delegate = self;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [_scratchView recover];
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    _scratchView.surfaceImage = selectedImage;
    _scratchView.mosaicImage = [XRGBTool getMosaicImageWith:selectedImage level:0];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
