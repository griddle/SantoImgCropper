//
//  ViewController.m
//  ImageCropperComponent
//
//  Created by Garret on 10/17/12.
//  Copyright (c) 2012 Garret. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController


@synthesize btn, bgImg;



- (IBAction)onBtnClick:(id)sender {
   UIImage *imgDog = [UIImage imageNamed:@"dog.jpeg"];
	ImageCropperViewController *cropper = [[ImageCropperViewController alloc] initWithImage:imgDog title:@"garret is the bomb"];
	[cropper setDelegate:self];
	[self presentModalViewController:cropper animated:YES];
}


- (void)imageCropper:(ImageCropperViewController *)cropper didFinishCroppingWithImage:(UIImage *)image {
	[self dismissModalViewControllerAnimated:YES];
   [self.bgImg setImage:image];
}

- (void)imageCropperDidCancel:(ImageCropperViewController *)cropper {
	[self dismissModalViewControllerAnimated:YES];
}



@end
