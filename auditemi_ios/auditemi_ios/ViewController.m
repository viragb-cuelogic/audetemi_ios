//
//  ViewController.m
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {}

@end

@implementation ViewController {
    IBOutlet CameraView *cameraView;
}

- (void) onImageCapturedSuccessfully:(UIImage *) capturedImage {
    NSLog(@"onImageCapturedSuccessfully");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    cameraView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
