//
//  ViewPictureViewController.h
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/13/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPictureViewController : UIViewController <UIScrollViewDelegate>
@property(nonatomic, weak) IBOutlet UIImageView *photoImageView;
@property(nonatomic, weak) IBOutlet UIImage *photoImage;


@end
