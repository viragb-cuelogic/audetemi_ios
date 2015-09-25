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
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

-(void) awakeFromNib
{
    [self setUserInteractionEnabled:YES];
}

- (void) drawPointerView {
    NSLog(@"Drawing PointerView");
    
    UIImage *backgroundImage = [UIImage imageNamed:@"pointer.png"];
    CALayer *aLayer = [CALayer layer];
    CGFloat nativeWidth = CGImageGetWidth(backgroundImage.CGImage);
    CGFloat nativeHeight = CGImageGetHeight(backgroundImage.CGImage);
    CGRect startFrame = CGRectMake(0, 0, nativeWidth, nativeHeight);
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
