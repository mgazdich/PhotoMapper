//
//  PickerViewController.m
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/12/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "PickerViewController.h"
#import "PhotoCell.h"
#import "ViewPictureViewController.h"


@interface PickerViewController ()

@property(nonatomic, strong) NSArray *assets;
@property(nonatomic, strong) UIImage *selectedImage;
@end

@implementation PickerViewController

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
    _assets = [@[] mutableCopy];
    __block NSMutableArray *tmpAssets = [@[] mutableCopy];
    ALAssetsLibrary *assetsLibrary = [PickerViewController defaultAssetsLibrary];
    NSUInteger groupTypes = ALAssetsGroupSavedPhotos | ALAssetsGroupAlbum | ALAssetsGroupEvent;

    [assetsLibrary enumerateGroupsWithTypes:groupTypes usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
            {
                [tmpAssets addObject:result];
            }
        }];
        self.assets = tmpAssets;
        
        [self.collectionView reloadData];
    } failureBlock:^(NSError *error) {
        NSLog(@"Error loading images %@", error);
    }];
    
    [super viewDidLoad];

}

- (void) viewDidAppear:(BOOL)animated
{
    _assets = [@[] mutableCopy];
    __block NSMutableArray *tmpAssets = [@[] mutableCopy];
    ALAssetsLibrary *assetsLibrary = [PickerViewController defaultAssetsLibrary];
    NSUInteger groupTypes = ALAssetsGroupSavedPhotos | ALAssetsGroupAlbum | ALAssetsGroupEvent;

    [assetsLibrary enumerateGroupsWithTypes:groupTypes usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
            {
                [tmpAssets addObject:result];
            }
        }];
        
        self.assets = tmpAssets;
        
        [self.collectionView reloadData];
    } failureBlock:^(NSError *error) {
        NSLog(@"Error loading images %@", error);
    }];
    [self.collectionView reloadData];
    [super viewDidAppear:NO];
}

#pragma mark - collection view data source

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assets.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = (PhotoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    ALAsset *asset = self.assets[indexPath.row];
    cell.asset = asset;
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALAsset *asset = self.assets[indexPath.row];
    ALAssetRepresentation *defaultRep = [asset defaultRepresentation];
    UIImage *image = [UIImage imageWithCGImage:[defaultRep fullScreenImage] scale:[defaultRep scale] orientation:0];
    self.selectedImage = image;
    // Perform the segue named trailer
    [self performSegueWithIdentifier:@"viewImage" sender:self];
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

#pragma mark - Preparing for Segue

// This method is called by the system whenever you invoke the method performSegueWithIdentifier:sender:
// You never call this method. It is invoked by the system.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueIdentifier = [segue identifier];
    
    if ([segueIdentifier isEqualToString:@"viewImage"]) {
        
        // Obtain the object reference of the destination view controller
        ViewPictureViewController *itemDetailViewController = [segue destinationViewController];
        itemDetailViewController.photoImage = self.selectedImage;
        
    }
}
@end
