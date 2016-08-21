//
//  RootViewController.m
//  1209donghua
//
//  Created by Cyber on 15/12/9.
//  Copyright (c) 2015年 Cyber. All rights reserved.
//

#import "RootViewController.h"

@interface SBScreenShotter : NSObject
//+ (id)sharedInstance;
//- (void)saveScreenshot:(_Bool)arg1;
@end

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 100, 200, 300);
    button.backgroundColor = [UIColor redColor];
    button.adjustsImageWhenHighlighted = NO;
//    [button setBackgroundImage:[UIImage imageNamed:@"au.png"] forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageNamed:@"au.png"];
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:image];
    imageView2.contentMode = UIViewContentModeCenter;
    imageView2.frame = button.bounds;
    
    
//    [button addSubview:imageView2];
    
//    NSOrderedDescending
    
//    [button setTitle:@"123456" forState:UIControlStateNormal];
//    [button.titleLabel setTextColor:[UIColor blueColor]];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:@"abc" forState:UIControlStateNormal];
    [button.imageView setContentMode:UIViewContentModeCenter];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    
    /*
    
//    UIImage *image = [UIImage imageNamed:@"image01.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(100, 100, 64, 113);
    imageView.center = CGPointMake(160, 240);
//    [self.view addSubview:imageView];
    
    
     移动 
    CABasicAnimation *animation1 =
    [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    // 起止点的设定
    animation1.toValue = [NSNumber numberWithFloat:200];; // 終点
    
    
     旋转 
    CABasicAnimation *animation2 =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    
    // 绕x轴转3圈
    animation2.toValue = [NSNumber numberWithFloat:6 * M_PI]; // 结束时的角度
    
    
     动画组 
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.duration = 2.0;
    group.repeatCount = 1;
    
    // 动画结束后不变回初始状态
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    // 添加动画
    group.animations = [NSArray arrayWithObjects:animation2, nil];
    [imageView.layer addAnimation:group forKey:@"move-rotate-layer"];
    
    */
}

- (void)buttonAction {
    NSLog(@"dianji button !!!");
    
    self.view.backgroundColor = [UIColor blueColor];
//    UIImageWriteToSavedPhotosAlbum([self imageFromView:self.view], nil, nil, nil);  //保存到相册中
    [self fullScreenshots];


    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)fullScreenshots{
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    
//    UIGraphicsBeginImageContext(screenWindow.frame.size);//全屏截图，包括window
    
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, NO, 0);
    
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    
}

- (UIImage*)snapshotInternalOnIOS7AndLater
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height), NO, [UIScreen mainScreen].scale);
    // Render our snapshot into the image context
//    [self.view drawViewHierarchyInRect:CGRectMake(0, - (SCREENHEIGHT - SCREENWIDTH)/2, self.view.frame.size.width, self.view.frame.size.height) afterScreenUpdates:NO];
    
    // Grab the image from the context
    UIImage *complexViewImage = UIGraphicsGetImageFromCurrentImageContext();
    // Finish using the context
    UIGraphicsEndImageContext();
    
    return complexViewImage;
}

/*
 情景： 遇到的分享的图片 很模糊。
 
 
 那么首先去搜索下 在你的代码里面有没有遇到
 
 用 UIGraphicsBeginImageContext(<#CGSize size#>) 这个方法。
 
 
 解决：
 
 如果有那么 截屏的图片肯定是模糊的，因为在iOS7 的分辨率 会改为另外一种代替的方法
 
 就是它
 
 UIGraphicsBeginImageContextWithOptions(<#CGSize size#>, <#BOOL opaque#>, <#CGFloat scale#>)
 */

- (UIImage *)imageFromView: (UIView *) theView
{
    
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

/**
 * 动画开始时
 */
- (void)animationDidStart:(CAAnimation *)theAnimation
{
    NSLog(@"begin");
}

/**
 * 动画结束时
 */
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    NSLog(@"end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
