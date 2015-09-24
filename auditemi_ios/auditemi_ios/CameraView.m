//
//  CameraView.m
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "CameraView.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraView () {
    
    IBOutlet UIView *cameraDisplayView;
    IBOutlet UIView *cameraControlsVierw;
    
    UIImagePickerController *cameraPicker;
    UIImagePickerController *libraryPicker;

}
@end


@implementation CameraView {}

@synthesize delegate;
@synthesize isFlashOn;

- (void) awakeFromNib {
    [self addCameraPicker];
}

- (void) initCameraPicker {
    [self removeCameraPicker];
    [self addCameraPicker];
}

- (void) addCameraPicker {
    
    [self removeCameraPicker];
    [self removePhotoPicker];
    
    cameraPicker = [[UIImagePickerController alloc] init];
    cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraPicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    cameraPicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    cameraPicker.showsCameraControls = NO;
    cameraPicker.navigationBarHidden = NO;
    cameraPicker.toolbarHidden = YES;
    cameraPicker.view.frame = cameraDisplayView.frame;
    cameraPicker.delegate = self;
    [cameraDisplayView addSubview:cameraPicker.view];
    
}

-(void) addPhotoPicker {
    [self removeCameraPicker];
    [self removePhotoPicker];
    
    libraryPicker = [[UIImagePickerController alloc] init];
    libraryPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    libraryPicker.delegate = self;
    [self addSubview:libraryPicker.view];
}

-(void) removeCameraPicker {
    if(cameraPicker != nil){
        [cameraPicker.view removeFromSuperview];
        cameraPicker = nil;
    }
}

-(void) removePhotoPicker {
    if(libraryPicker != nil){
        [libraryPicker.view removeFromSuperview];
        libraryPicker = nil;
    }
}


#pragma mark - UIImagePickerController Delegate

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    if([picker isEqual:cameraPicker]) {
        UIImage *capturedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self.delegate onImageCapturedSuccessfully:capturedImage];
        [cameraPicker.view removeFromSuperview];
        [cameraPicker dismissViewControllerAnimated:NO completion:nil];
        
    } else if([picker isEqual:libraryPicker]) {
        UIImage *capturedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self.delegate onImageCapturedSuccessfully:capturedImage];
        [libraryPicker.view removeFromSuperview];
        [libraryPicker dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if([picker isEqual:cameraPicker]) {
        [cameraPicker.view removeFromSuperview];
        [cameraPicker dismissViewControllerAnimated:NO completion:nil];
    } else if([picker isEqual:libraryPicker]) {
        [libraryPicker.view removeFromSuperview];
        [libraryPicker dismissViewControllerAnimated:NO completion:nil];
    }
    [self addCameraPicker];
}

#pragma mark - Button Click Events.

- (IBAction)onCaptureButtonClicked {
    [cameraPicker takePicture];
}

- (IBAction)onGalleryButtonClicked {
    [self removeCameraPicker];
    [self addPhotoPicker];
}

- (IBAction)onFlashControllerButtonClicked {
    
    // Check if flashlight available.
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasFlash]){
            [device lockForConfiguration:nil];
            if (!isFlashOn) {
                [device setFlashMode:AVCaptureFlashModeOn];
                isFlashOn = YES;
            } else {
                [device setFlashMode:AVCaptureFlashModeOff];
                isFlashOn = NO;
            }
            [device unlockForConfiguration];
        }
    }
}

@end
