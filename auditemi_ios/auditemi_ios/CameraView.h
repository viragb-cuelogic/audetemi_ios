//
//  CameraView.h
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraView : UIView<UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
}

- (void) capturePicture;
@end
