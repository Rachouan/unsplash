//
//  Photo.h
//  unsplash
//
//  Created by Rachouan Rejeb on 22/01/16.
//  Copyright © 2016 Rachouan Rejeb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* imageurl;

@property (nonatomic, strong) NSString* user_id;
@property (nonatomic, strong) NSString* user_name;
@property (nonatomic, strong) NSString* user_image;

@end
