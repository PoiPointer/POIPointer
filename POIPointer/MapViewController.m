//
//  MapViewController.m
//  POIPointer
//
//  Created by Sylvain Julien on 17/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    [self.test setText:self.selectedPOI.POIName.text];
    MKPointAnnotation *userLocation = [MKPointAnnotation new];
    userLocation.title = @"You are here!";
    userLocation.coordinate = _pointOfOrigin;
    MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 6000, 6000);
    self.mapView.region = reg;
    
    [self.mapView addAnnotation:userLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //Values I used while working on emulator since there was no geoloc available
    /*double userLati = 50.8302198;
     double userLongi = 4.3512688;
     CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(userLati, userLongi);
     MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(coordinate, 1200, 1200);
     self.mapView.region = reg;*/
}

    



/*
-(void)createPinFromLieu:(Lieu*)lieu {
    CLLocationCoordinate2D coordonnees;
    MKPointAnnotation *newPin = [MKPointAnnotation new];
    newPin.title = lieu.nom;
    newPin.subtitle = lieu.subcategorie;
    float longi =[lieu.longitude floatValue];
    float lati =[lieu.latitude floatValue];
    coordonnees = CLLocationCoordinate2DMake(lati, longi);
    newPin.coordinate = coordonnees;
    
    [self.mapView addAnnotation:newPin];
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
