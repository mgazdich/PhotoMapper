//
//  PhotoCell.m
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/12/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell ()
@end

@implementation PhotoCell
- (void) setAsset:(ALAsset *)asset
{
    _asset = asset;
    self.photoImageView.image = [UIImage imageWithCGImage:[asset thumbnail]];
}
@end
