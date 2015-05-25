//
//  PickerViewController.h
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/12/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@end
