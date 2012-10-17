//
//  ViewController.h
//  ImageCropperComponent
//
//  Created by Garret on 10/17/12.
//  Copyright (c) 2012 Garret. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCropperViewController.h"


@interface ViewController : UIViewController <ImageCropperDelegate>


@property (nonatomic, retain) IBOutlet UIImageView *bgImg;
@property (nonatomic, retain) IBOutlet UIButton *btn;

- (IBAction)onBtnClick:(id)sender;

@end
