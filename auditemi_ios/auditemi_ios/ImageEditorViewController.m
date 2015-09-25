//
//  ImageEditorViewController.m
//  auditemi_ios
//
//  Created by cuelogic on 23/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "ImageEditorViewController.h"
#import "CircleView.h"
#import "PointerView.h"
#import "RectangleView.h"

@interface ImageEditorViewController () {
    __weak IBOutlet UIImageView *imageView;
}
@end

@implementation ImageEditorViewController {
    CircleView *circleView;
    PointerView *pointerView;
    RectangleView *rectangleView;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    imageView.image = self.capturedImage;
    imageView.userInteractionEnabled = YES;
    
    // Allocate CircleView.
    circleView = [[CircleView alloc]initWithFrame:CGRectMake(110.0, 110.0, 100, 100)];
    circleView.userInteractionEnabled = YES;
    [imageView addSubview:circleView];
    
    // Allocate PointerView.
    UIImage *backgroundImage = [UIImage imageNamed:@"pointer.png"];
    CGFloat nativeWidth = CGImageGetWidth(backgroundImage.CGImage);
    CGFloat nativeHeight = CGImageGetHeight(backgroundImage.CGImage);
    
    pointerView = [[PointerView alloc]initWithFrame:CGRectMake(110.0, 110.0, nativeWidth, nativeHeight)];
    pointerView.userInteractionEnabled = YES;
    [imageView addSubview:pointerView];
    
    // Allocate RectangleView.
    rectangleView = [[RectangleView alloc]initWithFrame:CGRectMake(40, 400, 120, 120)];
    rectangleView.userInteractionEnabled = YES;
    [imageView addSubview:rectangleView];
}

@end
