//
//  PointerView.m
//  auditemi_ios
//
//  Created by cuelogic on 24/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "PointerView.h"

@implementation PointerView {
    float oldX, oldY;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawPointerView];
    }
    return self;
}

- (void) drawPointerView {
    NSLog(@"Drawing PointerView");
    
    UIImage *backgroundImage = [UIImage imageNamed:@"pointer.png"];
    CALayer *aLayer = [CALayer layer];
    CGFloat nativeWidth = CGImageGetWidth(backgroundImage.CGImage);
    CGFloat nativeHeight = CGImageGetHeight(backgroundImage.CGImage);
    CGRect startFrame = CGRectMake(0, 0, nativeWidth * 2, nativeHeight * 2);
    aLayer.contents = (id)backgroundImage.CGImage;
    aLayer.frame = startFrame;
    [self.layer addSublayer:aLayer];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    oldX = touchLocation.x;
    oldY = touchLocation.y;
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    if((self.frame.origin.x + touchLocation.x - oldX) <= 0 ||
       (self.frame.origin.x + touchLocation.x + oldX) >= self.superview.frame.size.width) {
        oldX = touchLocation.x;
        return;
    }
    
    if((self.frame.origin.y + touchLocation.y - oldY) <= 0 ||
       (self.frame.origin.y + touchLocation.y + oldY) >= self.superview.frame.size.height ) {
        oldY = touchLocation.y;
        return;
    }
    
    if((self.frame.origin.x + touchLocation.x + self.frame.size.width - oldX ) >= self.superview.frame.size.width) {
        oldX = touchLocation.x;
        return;
    }
    
    if((self.frame.origin.y + touchLocation.y + self.frame.size.height - oldY ) >= self.superview.frame.size.height){
        oldY = touchLocation.y;
        return;
    }
    
    CGRect frame = self.frame;
    frame.origin.x = self.frame.origin.x + touchLocation.x - oldX;
    frame.origin.y =  self.frame.origin.y + touchLocation.y - oldY;
    self.frame = frame;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}


- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

@end
