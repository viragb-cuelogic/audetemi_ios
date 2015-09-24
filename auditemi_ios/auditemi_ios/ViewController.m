//
//  ViewController.m
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "ViewController.h"
#import "ImageEditorViewController.h"

@interface ViewController () {}

@end

@implementation ViewController {
    IBOutlet CameraView *cameraView;
}

- (void) onImageCapturedSuccessfully:(UIImage *) capturedImage {   
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ImageEditorViewController *imageEditorViewController = [sb instantiateViewControllerWithIdentifier:@"ImageEditorViewController"];
    imageEditorViewController.capturedImage = capturedImage;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:imageEditorViewController animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    cameraView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [cameraView initCameraPicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
