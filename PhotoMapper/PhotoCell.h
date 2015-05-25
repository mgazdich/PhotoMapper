//
//  PhotoCell.h
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/12/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoCell : UICollectionViewCell
@property(nonatomic, strong) ALAsset *asset;
@property(nonatomic, weak) IBOutlet UIImageView *photoImageView;

@end