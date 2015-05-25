//
//  MapOverlayViewController.h
//  PhotoMapper
//
//  Created by Mike_Gazdich_rMBP on 12/13/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>
#import <ImageIO/ImageIO.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface MapOverlayViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *_allAnnotationsMapView;
    ALAssetsLibrary *assetsLibrary;
    NSMutableArray *assets;
    
}

@property (strong, nonatomic) NSArray *photos;
@property (nonatomic) BOOL assetsLoaded;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end