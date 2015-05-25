//
//  ShareImageViewController.h
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/14/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareImageViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *shareView;
@property (strong, nonatomic) UIImage *image;
- (IBAction)postToFaceBook:(UIButton *)sender;
- (IBAction)postToTwitter:(UIButton *)sender;

@end
