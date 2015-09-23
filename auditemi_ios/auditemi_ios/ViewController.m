//
//  ViewController.m
//  auditemi_ios
//
//  Created by cuelogic on 22/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "ViewController.h"
#import "CameraView.h"

@interface ViewController () {
    __weak IBOutlet CameraView *cameraView;
}
@end

@implementation ViewController {
    
}


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
    
}

//- (IBAction)onCapturedClicked:(id)sender {
//    NSLog(@"Clicked");
//    [cameraView capturePicture];
//}

-(void) viewDidAppear:(BOOL)animated {
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
