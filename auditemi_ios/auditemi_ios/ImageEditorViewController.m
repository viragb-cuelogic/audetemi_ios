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
#import "FreeDrawView.h"

@interface ImageEditorViewController () {
    __weak IBOutlet UIImageView *imageView;
}
@end

@implementation ImageEditorViewController {
    CircleView *circleView;
    PointerView *pointerView;
    RectangleView *rectangleView;
    FreeDrawView *freeDrawView;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    imageView.image = self.capturedImage;
    imageView.userInteractionEnabled = YES;
    
    [self allocateAndAddFreeDrawView];
    
    [self allocateAndAddCircleView];
    [self allocateAndAddPointerView];
    [self allocateAndAddRectangleView];
}

- (void) allocateAndAddCircleView {
    // Allocate CircleView.
    circleView = [[CircleView alloc]initWithFrame:CGRectMake(110.0, 110.0, 100, 100)];
    circleView.userInteractionEnabled = YES;
    // Add CircleView.
    [imageView addSubview:circleView];
}

- (void) allocateAndAddPointerView {
    // Allocate PointerView.
    UIImage *backgroundImage = [UIImage imageNamed:@"pointer.png"];
    CGFloat nativeWidth = CGImageGetWidth(backgroundImage.CGImage);
    CGFloat nativeHeight = CGImageGetHeight(backgroundImage.CGImage);
    
    pointerView = [[PointerView alloc]initWithFrame:CGRectMake(110.0, 110.0, nativeWidth * 2, nativeHeight * 2)];
    pointerView.userInteractionEnabled = YES;
    // Add PointerView.
    [imageView addSubview:pointerView];
}

- (void) allocateAndAddRectangleView {
    // Allocate RectangleView.
    rectangleView = [[RectangleView alloc]initWithFrame:CGRectMake(40, 400, 120, 120)];
    rectangleView.userInteractionEnabled = YES;
    // Add RectangleView.
    [imageView addSubview:rectangleView];
}

- (void) allocateAndAddFreeDrawView {
    // Allocate FreeDrawView.
    freeDrawView = [[FreeDrawView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    // Add RectangleView.
    [imageView addSubview:freeDrawView];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
