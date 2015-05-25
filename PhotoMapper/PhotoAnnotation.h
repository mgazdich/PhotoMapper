//
//  PhotoAnnotation.h
//  Photo Map
//
//  Created by Mike_Gazdich_rMBP on 12/13/13.
//  Copyright (c) 2013 Mike Gazdich. All rights reserved.//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoAnnotation : NSObject <MKAnnotation, NSCoding> {
    double latitude;
    double longitude;
}

- (id)initWithImagePath:(NSString *)imagePath title:(NSString *)title coordinate:(CLLocationCoordinate2D)coord;

@property (nonatomic, strong) ALAssetRepresentation *image;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) PhotoAnnotation *clusterAnnotation;
@property (nonatomic, strong) NSArray *containedAnnotations;

@end
