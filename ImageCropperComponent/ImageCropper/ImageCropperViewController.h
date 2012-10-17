


#import <UIKit/UIKit.h>


@class ImageCropperViewController;


@protocol ImageCropperDelegate <NSObject>
- (void)imageCropper:(ImageCropperViewController *)cropper didFinishCroppingWithImage:(UIImage *)image;
- (void)imageCropperDidCancel:(ImageCropperViewController *)cropper;
@end


@interface ImageCropperViewController : UIViewController <UIScrollViewDelegate> {
	UIScrollView *_scrollView;
	UIImageView *_imageView;
	
	id <ImageCropperDelegate> __weak delegate;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) id <ImageCropperDelegate> delegate;

- (id)initWithImage:(UIImage *)image title:(NSString *)title;

@end

