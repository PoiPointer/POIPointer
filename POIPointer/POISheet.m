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
- (POISheet*)initWithName:(NSString* )name andIllu:(NSString*)illu andDistance:(NSString*)distance{

    if (self){
        
        self.backgroundColor=[UIColor lightGrayColor];
        
        NSURL *url = [[NSURL alloc]initWithString:illu];
        NSData *imageData = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *illuForPOI = [[UIImage alloc]initWithData:imageData];
        
        _POIIllu =[[UIImageView alloc ] initWithFrame:CGRectMake(50, 50, 400, 400)] ;
        [_POIIllu setImage:illuForPOI];
        [self addSubview:_POIIllu];
        
        _POIName = [[UILabel alloc]initWithFrame:CGRectMake(50,470,400,40)];
        [_POIName setText:name];
        [self addSubview:_POIName];
        _POIDistance = [[UILabel alloc]initWithFrame:CGRectMake(50,520,400,40)];
        [_POIDistance setText:name];
        [self addSubview:_POIDistance];
        //self.userInteractionEnabled = YES;
        
        
    }
    
    return self;
}


@end

