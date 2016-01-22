//
//  PhotoFactory.m
//  unsplash
//
//  Created by Rachouan Rejeb on 22/01/16.
//  Copyright © 2016 Rachouan Rejeb. All rights reserved.
//

#import "PhotoFactory.h"

@implementation PhotoFactory

+ (Photo*)createPhotoFromDirectory:(NSDictionary*)dict andFrame:(CGFloat )screenHeight{
    
    Photo *photo = [[Photo alloc] init];
    
    photo.identifier = [dict objectForKey:@"id"];
    
    NSString *cropString = @"crop=entropy&h=";
    cropString = [cropString stringByAppendingString:[NSString stringWithFormat:@"%f",screenHeight*2]];
    
    NSString *url = [[dict objectForKey:@"urls"] objectForKey:@"regular"];
    url = [url stringByReplacingOccurrencesOfString:@"crop=entropy&w=1080"
                                         withString:cropString];
    photo.imageurl = url;
    
    return photo;
}

@end

