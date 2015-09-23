//
//  CameraView.m
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "CameraView.h"

@interface CameraView () {
    IBOutlet UIView *cameraDisplayView;
    IBOutlet UIView *cameraControlsVierw;
    UIImagePickerController *picker;
}
@end


@implementation CameraView {

    
}

@synthesize delegate;

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
    picker.view.frame = cameraDisplayView.frame;
    
    picker.delegate = self;
    [cameraDisplayView addSubview:picker.view];
    
}

#pragma mark - UIImagePickerController Delegate

- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo {
    
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
     UIImage *capturedImage = info[UIImagePickerControllerEditedImage];
    [self.delegate onImageCapturedSuccessfully:capturedImage];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
}

- (IBAction)onCaptureButtonClicked {
    [picker takePicture];
}

@end
