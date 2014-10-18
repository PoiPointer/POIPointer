//
//  MapViewController.h
//  POIPointer
//
//  Created by Sylvain Julien on 17/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POISheet.h"
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *test;
@property POISheet *selectedPOI;
@property CLLocationCoordinate2D pointOfOrigin;

@end
