//
//  POIDowloader.h
//  POIPointer
//
//  Created by Sylvain Julien on 18/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol POIDownloadProtocol <NSObject>
- (void)POIDownloaded:(NSArray *)items;
@end

@interface POIDowloader : NSObject<NSURLConnectionDataDelegate>
@property NSString *origin;
@property NSString *range;
@property NSString *cat;

- (id) initWithOrigin:(NSString*)origin;

@end
