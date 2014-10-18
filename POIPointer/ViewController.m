//
//  ViewController.m
//  POIPointer
//
//  Created by Sylvain Julien on 17/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import "ViewController.h"
#import "POIObject.h"
#import "POISheet.h"
#import "MapViewController.h"

@interface ViewController () {
    NSArray *downloadedPOISheet;
    POISheet *sheetToPass;
    CLLocation *coordinate;
    CLLocationCoordinate2D pointOfOrigin;
    CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    [locationManager stopUpdatingLocation];
    coordinate =[locationManager location];
    pointOfOrigin = coordinate.coordinate;
    // Configure the new event with information from the location
    _origin = [NSString stringWithFormat:@"%@",coordinate];
	_origin =@"50.7972419,4.3991661" ;
    
    //POISheet *sheet1 = [[POISheet alloc]initWithName:@"Place1" andIllu:@"http://static.skynetblogs.be/media/73240/dyn001_original_567_425_pjpeg_31965_fa1f0d8d08f3364d1635cdd452e7423a.jpg" andDistance:@"500m"];
    //[self.viewSlider addSubview:sheet1];
    
    //[self.POIIllu setImage:illuForPOI];
    //[self.POIName setText:testPlace.name];
    //[self.POIDistance setText:testPlace.distanceFromCurrentLocation];
    POIDowloader *loader = [[POIDowloader alloc]initWithOrigin:_origin];
    //[pois downloadItems] ;
	//[pois pushSheetsTo:self.viewSlider] ;

    
        
    
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft ) {
        UIView *p =self.viewSlider.subviews [[self.viewSlider.subviews count] - 1];
        [p removeFromSuperview];
        return;
    }
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight ) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This delegate method will get called when the items are finished downloading and create pins for each one
-(void)POIDownloaded:(NSArray *)items{
    // Set the downloaded items to the array
    downloadedPOISheet = items;
    // for each object in the array, I create a pin on the map
    for (int i=0; i<[downloadedPOISheet count]; i++) {
        
        [self.viewSlider addSubview:downloadedPOISheet[i]];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"toMap"]) {
        sheetToPass =self.viewSlider.subviews [[self.viewSlider.subviews count] - 1];
        MapViewController *mapVC = segue.destinationViewController;
        mapVC.pointOfOrigin = pointOfOrigin;
        mapVC.selectedPOI = sheetToPass;
        [sheetToPass removeFromSuperview];
        
    }
}

@end
