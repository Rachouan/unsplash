//
//  CardView.h
//  Stripmuseumv2
//
//  Created by Rachouan Rejeb on 16/12/15.
//  Copyright © 2015 Rachouan Rejeb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView
@property(nonatomic,strong) UIImageView * likebtn;
@property Boolean liked;

- (id)initWithTitle:(NSString * )titel andImage:(NSString *)img andSubTitle:(NSString*)subtitle andFrame:(CGRect)frame;

@end
