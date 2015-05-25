//
//  BaseTabViewController.h
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/12/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface BaseTabViewController : UITabBarController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    BOOL newMedia;
}

// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage;

@end
