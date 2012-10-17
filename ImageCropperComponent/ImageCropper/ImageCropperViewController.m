

#import "ImageCropperViewController.h"



@interface ImageCropperViewController(){
   UIStatusBarStyle _appBarStyle;
}

@end



@implementation ImageCropperViewController



@synthesize scrollView=_scrollView;
@synthesize imageView=_imageView;
@synthesize delegate;


- (id)initWithImage:(UIImage *)image title:(NSString *)title {
	self = [super init];
	
	if (self) {
      _appBarStyle = [[UIApplication sharedApplication] statusBarStyle];
		[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
		
		_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, -20.0, 320.0, 480.0)];
		[_scrollView setBackgroundColor:[UIColor blackColor]];
		[_scrollView setDelegate:self];
		[_scrollView setShowsHorizontalScrollIndicator:NO];
		[_scrollView setShowsVerticalScrollIndicator:NO];
		[_scrollView setMaximumZoomScale:2.0];
		
		_imageView = [[UIImageView alloc] initWithImage:image];
		
		CGRect rect;
		rect.size.width = image.size.width;
		rect.size.height = image.size.height;
		
		[_imageView setFrame:rect];
		
		[_scrollView setContentSize:[_imageView frame].size];
		[_scrollView setMinimumZoomScale:[_scrollView frame].size.width / [_imageView frame].size.width];
		[_scrollView setZoomScale:[_scrollView minimumZoomScale]];
		[_scrollView addSubview:_imageView];
		
		[[self view] addSubview:_scrollView];
		
		UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
		[navigationBar setBarStyle:UIBarStyleBlack];
		[navigationBar setTranslucent:YES];
		
		UINavigationItem *aNavigationItem = [[UINavigationItem alloc] initWithTitle:title];
		[aNavigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                          target:self
                                                                                          action:@selector(cancelCropping)]];
		[aNavigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(finishCropping)]];
		[navigationBar setItems:[NSArray arrayWithObject:aNavigationItem]];
		
		
		[[self view] addSubview:navigationBar];
	}
	return self;
}

- (void)cancelCropping {
   [[UIApplication sharedApplication] setStatusBarStyle:_appBarStyle];
	[delegate imageCropperDidCancel:self]; 
}

- (void)finishCropping {
   [[UIApplication sharedApplication] setStatusBarStyle:_appBarStyle];   
	float zoomScale = 1.0 / [_scrollView zoomScale];
	
	CGRect rect;
	rect.origin.x = [_scrollView contentOffset].x * zoomScale;
	rect.origin.y = [_scrollView contentOffset].y * zoomScale;
	rect.size.width = [_scrollView bounds].size.width * zoomScale;
	rect.size.height = [_scrollView bounds].size.height * zoomScale;
	
	CGImageRef cr = CGImageCreateWithImageInRect([[_imageView image] CGImage], rect);
	
	UIImage *cropped = [UIImage imageWithCGImage:cr];
	
	CGImageRelease(cr);
	
	[delegate imageCropper:self didFinishCroppingWithImage:cropped];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return _imageView;
}


@end