//
//  PhotoFactory.h
//  unsplash
//
//  Created by Rachouan Rejeb on 22/01/16.
//  Copyright © 2016 Rachouan Rejeb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoFactory : NSObject

+ (Photo*)createPhotoFromDirectory:(NSDictionary*)dict andFrame:(CGFloat)screenHeight;

@end
