//
//  CameraView.h
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CameraViewDelegate <NSObject>

- (void) onImageCapturedSuccessfully:(UIImage*) capturedImage;

@end

@interface CameraView : UIView<UINavigationControllerDelegate,UIImagePickerControllerDelegate> {

}

@property (assign, nonatomic) id <CameraViewDelegate> delegate;
@property (nonatomic, assign) BOOL isFlashOn;

- (void) initCameraPicker;

@end
