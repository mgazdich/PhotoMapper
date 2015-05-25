//
//  ShareImageViewController.m
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/14/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import "ShareImageViewController.h"
#import <Social/Social.h>

@interface ShareImageViewController ()

@end

@implementation ShareImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shareView.image = self.image;

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postToFaceBook:(UIButton *)sender {
    // Check whether we can send the request for the particular service type
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        // Good to go! Create a compose view controller and set it's parameters. Note that the compose view controller is different from the
        // viewController passed into the function, the latter acting as the container parent of the former.
        SLComposeViewController *compose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        // Set the completion handler. I've just printed the result to the console, but you should probably do something smarter if
        // your logic depends on whether or not the user submitted the image.
        compose.completionHandler = ^(SLComposeViewControllerResult result) {
            NSLog(@"%s", result == SLComposeViewControllerResultCancelled ? "Cancelled" : "Done");
        };
        // Add the image to the view controller.
        if(![compose addImage:self.image]) {
            // Based on Apple's documentation, addImage returns NO if image does not fit in the "currently available space".
            // I don't know what that means.
            NSLog(@"Could not attach the image.");
        };
        if(![compose setInitialText:@"Initial Text."]) {
            // Based on Apple's documentation, setInitialText returns NO if text does not fit in the currently available character space.
            // This is specific to Twitter's character limitation.
            NSLog(@"Could not set initial text.");
        };
        // Present the compose view controller within the parent view controller.
        [self presentViewController:compose animated:YES completion:nil];
    } else {
        // You should probably display an alert to the user here.
        NSLog(@"Service Unavailable");
    }
}

- (IBAction)postToTwitter:(UIButton *)sender {
    
    // Check whether we can send the request for the particular service type
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        // Good to go! Create a compose view controller and set it's parameters. Note that the compose view controller is different from the
        // viewController passed into the function, the latter acting as the container parent of the former.
        SLComposeViewController *compose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        // Set the completion handler. I've just printed the result to the console, but you should probably do something smarter if
        // your logic depends on whether or not the user submitted the image.
        compose.completionHandler = ^(SLComposeViewControllerResult result) {
            NSLog(@"%s", result == SLComposeViewControllerResultCancelled ? "Cancelled" : "Done");
        };
        // Add the image to the view controller.
        if(![compose addImage:self.image]) {
            // Based on Apple's documentation, addImage returns NO if image does not fit in the "currently available space".
            // I don't know what that means.
            NSLog(@"Could not attach the image.");
        };
        if(![compose setInitialText:@"Initial Text."]) {
            // Based on Apple's documentation, setInitialText returns NO if text does not fit in the currently available character space.
            // This is specific to Twitter's character limitation.
            NSLog(@"Could not set initial text.");
        };
        // Present the compose view controller within the parent view controller.
        [self presentViewController:compose animated:YES completion:nil];
    } else {
        // You should probably display an alert to the user here.
        NSLog(@"Service Unavailable");
    }
}

@end