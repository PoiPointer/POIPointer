//
//  POISheet.m
//  POIPointer
//
//  Created by Sylvain Julien on 17/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import "POISheet.h"

@implementation POISheet

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithName:(NSString* )name andIllu:(NSString*)illu andDistance:(NSString*)distance andCoord:(CLLocation*)coordinate{

    if (self = [super initWithFrame:CGRectMake(0, 0, 500, 600)] ){
        
        self.backgroundColor=[UIColor lightGrayColor];
        
        NSURL *url = [[NSURL alloc]initWithString:illu];
        NSData *imageData = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *illuForPOI = [[UIImage alloc]initWithData:imageData];
        self.coordinates = coordinate;
        _POIIllu =[[UIImageView alloc ] initWithFrame:CGRectMake(30, 30, 300, 300)] ;
        [_POIIllu setImage:illuForPOI];
        [self addSubview:_POIIllu];
        
        _POIName = [[UILabel alloc]initWithFrame:CGRectMake(30,400,300,70)];
        [_POIName setText:name];
        [self addSubview:_POIName];
        _POIDistance = [[UILabel alloc]initWithFrame:CGRectMake(30,460,300,40)];
        [_POIDistance setText:distance];
        [self addSubview:_POIDistance];
        //self.userInteractionEnabled = YES;
        
        
    }
    
    return self;
}


@end

