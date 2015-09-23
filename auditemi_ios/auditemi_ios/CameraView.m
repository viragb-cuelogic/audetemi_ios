//
//  CameraView.m
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "CameraView.h"

@interface CameraView () {
    UIImagePickerController *picker;
}
@end

@implementation CameraView {
    
}

- (void) awakeFromNib {
    [self initialiseCameraView];
}

- (void) initialiseCameraView {
    picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    picker.showsCameraControls = NO;
    picker.navigationBarHidden = YES;
    picker.toolbarHidden = YES;
    picker.view.frame = self.frame;
    
    picker.delegate = self;
    [self addSubview:picker.view];
    
}

- (void) capturePicture {
    NSLog(@"I m here in capturePicture CameraView");
}


#pragma mark - UIImagePickerController Delegate

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0) {
    
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
}

@end
