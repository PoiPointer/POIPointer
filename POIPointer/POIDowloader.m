//
//  POIDowloader.m
//  POIPointer
//
//  Created by Sylvain Julien on 18/10/14.
//  Copyright (c) 2014 Sylvain Julien. All rights reserved.
//

#import "POIDowloader.h"
#import "POISheet.h"

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
        NSString *URL = [NSString stringWithFormat:@"http://192.168.5.186:888/poi?origin=%@&range=500", self.origin];
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
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    
    // Loop through Json objects, create question objects and add them to our questions array
    if (jsonArray&&jsonArray.count>0){
        for (int i = 0; i < jsonArray.count; i++)
        {
            NSDictionary *jsonElement = jsonArray[i];
            
            // Create a new location object and set its props to JsonElement properties
            POISheet *newSheet= [[POISheet alloc] init];
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
            //NSLog(@"moy : %f", nouveauLieu.ratingMoyen);
            
            // Add this location to the locations array
            [_POIArray addObject:newSheet];
        }
    }
    else {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"OOPS..." message:@"It seems no place on our database is open around you.\nSorry we cannot help you!"  delegate:nil cancelButtonTitle:@"Oh well... too bad!" otherButtonTitles:nil];
        [alert show];
    }
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_endroits];
    }
}



@end
