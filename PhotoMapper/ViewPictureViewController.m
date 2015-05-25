//
//  ViewPictureViewController.m
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/13/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import "ViewPictureViewController.h"
#import "ShareImageViewController.h"

@interface ViewPictureViewController ()

@end

@implementation ViewPictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photoImageView.image = self.photoImage;
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                       target:self action:@selector(shareClicked:)];
    self.navigationItem.rightBarButtonItem = refreshButton;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photoImageView;
}

- (IBAction)shareClicked:(id)sender
{
    // Perform the segue named trailer
    [self performSegueWithIdentifier:@"Share" sender:self];
}

#pragma mark - Preparing for Segue

// This method is called by the system whenever you invoke the method performSegueWithIdentifier:sender:
// You never call this method. It is invoked by the system.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueIdentifier = [segue identifier];
    
    if ([segueIdentifier isEqualToString:@"Share"]) {
        
        // Obtain the object reference of the destination view controller
        ShareImageViewController *shareViewController = [segue destinationViewController];
        shareViewController.image = self.photoImage;
        
    }
}
@end
