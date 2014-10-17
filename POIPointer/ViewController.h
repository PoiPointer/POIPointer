//
//  ViewController.h
//  POIPointer
//
//  Created by Sylvain Julien on 17/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *viewSlider;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeRecognizer;
- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)recognizer;

@end

