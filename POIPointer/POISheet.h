//
//  POISheet.h
//  POIPointer
//
//  Created by Sylvain Julien on 17/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface POISheet : UIView

@property int width;
@property int height;
@property NSString *illURL;
@property NSString *distance;
@property NSString *name;
@property CLLocation *coordinates;
@property (nonatomic) IBOutlet UILabel *POIName;
@property (nonatomic) IBOutlet UIImageView *POIIllu;

@property (nonatomic) IBOutlet UILabel *POIDistance;

- (id)initWithName:(NSString* )name andIllu:(NSString*)illu andDistance:(NSString*)distance andCoord:(CLLocation*)coordinate;


@end
