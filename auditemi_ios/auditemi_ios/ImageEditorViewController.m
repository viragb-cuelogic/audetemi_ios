//
//  ImageEditorViewController.m
//  auditemi_ios
//
//  Created by cuelogic on 23/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "ImageEditorViewController.h"

@interface ImageEditorViewController () {
    __weak IBOutlet UIImageView *imageView;
}
@end

@implementation ImageEditorViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    imageView.image = self.capturedImage;
}

@end
