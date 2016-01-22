//
//  CardView.m
//  Stripmuseumv2
//
//  Created by Rachouan Rejeb on 16/12/15.
//  Copyright © 2015 Rachouan Rejeb. All rights reserved.
//

#import "CardView.h"
#import <AFNetworking.h>

@implementation CardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithTitle:(NSString * )titel andImage:(NSString *)img andSubTitle:(NSString*)subtitle andFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.184  green:0.251  blue:0.345 alpha:1];
        
        self.liked = false;
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: img]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                // WARNING: is the cell still using the same data by this point??
                UIImage * image = [UIImage imageWithData:data];
                UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
                imageView.frame = CGRectMake(0,0,frame.size.width,frame.size.height);
                [imageView setClipsToBounds:YES];
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                [self addSubview:imageView];
                
                
                [self like];
            });
        });
        
        
        
    }
    return self;
}

- (void)like{
    // Load images
    NSMutableArray *imageNames = [NSMutableArray array];
    
    for (int i = 0; i < 29; i++) {
        NSString *filename = [NSString stringWithFormat:@"like_%05i.png", i];
        [imageNames addObject:filename];
    }
    
    
    
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    self.likebtn = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.likebtn.center = CGPointMake(40, self.frame.size.height - 40);
    self.likebtn.animationImages = images;
    self.likebtn.animationDuration = 0.5;
    self.likebtn.animationRepeatCount = 1;
    self.likebtn.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(likeImageHandler:)];
    [self.likebtn addGestureRecognizer:tap];
    self.likebtn.image = [self.likebtn.animationImages objectAtIndex:0];
    [self addSubview:self.likebtn];
    
}

- (void)likeImageHandler:(UITapGestureRecognizer *)recognizer  {
    
    
    if(!self.liked){
        self.likebtn.image = [self.likebtn.animationImages objectAtIndex:self.likebtn.animationImages.count-1];
        [self.likebtn startAnimating];
    }else{
        self.likebtn.image = [self.likebtn.animationImages objectAtIndex:0];
    }
    
    self.liked = !self.liked;
    
}


@end
