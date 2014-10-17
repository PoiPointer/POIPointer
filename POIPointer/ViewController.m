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
    POISheet *sheetToPass;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    POISheet *sheet1 = [[POISheet alloc]initWithName:@"Place1" andIllu:@"http://static.skynetblogs.be/media/73240/dyn001_original_567_425_pjpeg_31965_fa1f0d8d08f3364d1635cdd452e7423a.jpg" andDistance:@"500m"];
    [self.viewSlider addSubview:sheet1];
    POISheet *sheet2 = [[POISheet alloc]initWithName:@"Place2" andIllu:@"http://tempora-expo.be/img/p/37-412-thickbox.jpg" andDistance:@"20m"];
    [self.viewSlider addSubview:sheet2];
    //[self.POIIllu setImage:illuForPOI];
    //[self.POIName setText:testPlace.name];
    //[self.POIDistance setText:testPlace.distanceFromCurrentLocation];
    
    
        
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"toMap"]) {
        sheetToPass =self.viewSlider.subviews [[self.viewSlider.subviews count] - 1];
        MapViewController *mapVC = segue.destinationViewController;
        mapVC.selectedPOI = sheetToPass;
        [sheetToPass removeFromSuperview];
        
    }
}

@end
