//
//  POIDowloader.m
//  POIPointer
//
//  Created by Sylvain Julien on 18/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import "POIDowloader.h"
#import "POISheet.h"
#import <CoreLocation/CoreLocation.h>

@implementation POIDowloader {
    NSMutableData *_downloadedData;
    NSMutableArray *_POIArray;
}


- (id) initWithOrigin:(NSString*)origin {
    self = [super init];
    if (self) {
        self.origin = origin;
    }
    return self;
}

- (void)downloadItems {
    NSString *URL = [NSString stringWithFormat:@"http://192.168.5.186:8888/poi?origin=%@&range=4km", self.origin];
    NSLog(@"URL : %@", URL);
    //Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:URL];
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
//Decode the JSON array sent by WSv request
{
    // Create an array to store the locations
    _POIArray = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    NSArray *jsonArray =[json objectForKey:@"features"] ;
    
    // Loop through Json objects, create question objects and add them to our questions array
    if (jsonArray&&jsonArray.count>0){
        for (int i = 0; i < jsonArray.count; i++)
        {
            NSDictionary *jsonElement = [jsonArray[i] objectForKey:@"properties"];
            NSDictionary *jsonElement2 = [jsonArray[i] objectForKey:@"geometry"];
            NSArray *coords = [jsonElement2 objectForKey:@"coordinates"];
            CLLocation *newLoc =
            [[CLLocation alloc]initWithLatitude:[coords[1] doubleValue]
                                      longitude:[coords [0] doubleValue]];
            double temp =[coords[1] doubleValue];
            NSLog(@"%f",temp);
            // Create a new location object and set its props to JsonElement properties
            //POISheet *newSheet= [[POISheet alloc] init];
			
			POISheet *newSheet= [[POISheet alloc] initWithName:[jsonElement objectForKey:@"name"]
													   andIllu:[jsonElement objectForKey:@"img"]
												   andDistance:[jsonElement objectForKey:@"distance"]
                                                    andCoord:newLoc];
			
			
			
			
/*
            newSheet.name  = [[jsonElement valueForKey:@"property"[jsonElement valueForKey:@"name"]] ] ;
            nouveauLieu.nom = [jsonElement[@"nom"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.categorie = [jsonElement[@"categorie"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.subcategorie = [jsonElement[@"subcategorie"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.adresse = [jsonElement[@"adresse"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.latitude = [jsonElement[@"latitude"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.longitude = [jsonElement[@"longitude"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.telephone = [jsonElement[@"telephone"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.website = [jsonElement[@"website"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.divers = [jsonElement[@"divers"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.heureDeFermeture = [jsonElement[@"heure_fermeture"]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            nouveauLieu.ratingMoyen = [jsonElement[@"moy"] floatValue] ;
   */
            //NSLog(@"moy : %f", nouveauLieu.ratingMoyen);
            
            // Add this location to the locations array
            [_POIArray addObject:newSheet];
        }
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate POIDownloaded:_POIArray];
    }
}



@end
