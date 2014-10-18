//
//  ViewController.h
//  POIPointer
//
//  Created by Sylvain Julien on 17/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POIDowloader.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <POIDownloadProtocol>
@property (strong, nonatomic) IBOutlet UIView *viewSlider;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeRecognizer;
@property NSString *origin;

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)recognizer;

@end

