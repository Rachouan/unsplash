//
//  PhotoFactory.m
//  unsplash
//
//  Created by Rachouan Rejeb on 22/01/16.
//  Copyright © 2016 Rachouan Rejeb. All rights reserved.
//

#import "PhotoFactory.h"

@implementation PhotoFactory

+ (Photo*)createPhotoFromDirectory:(NSDictionary*)dict{
    
    Photo *photo = [[Photo alloc] init];
    
    photo.identifier = [dict objectForKey:@"id"];
    photo.imageurl = [[dict objectForKey:@"urls"] objectForKey:@"regular"];
    
    return photo;
}

@end

