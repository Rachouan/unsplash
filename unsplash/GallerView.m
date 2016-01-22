//
//  GallerView.m
//  Stripmuseum
//
//  Created by Rachouan Rejeb on 16/12/15.
//  Copyright © 2015 Rachouan Rejeb. All rights reserved.
//

#import "GallerView.h"
#import "CardView.h"

@implementation GallerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        self.backgroundColor = [UIColor colorWithRed:0.110  green:0.161  blue:0.216 alpha:1];
        
        
        
        self.scrollVW = [[UIScrollView alloc]initWithFrame:frame];
        self.scrollVW.backgroundColor = [UIColor colorWithRed:0.110  green:0.161  blue:0.216 alpha:1];
        self.scrollVW.userInteractionEnabled = TRUE;
        self.scrollVW.scrollEnabled = TRUE;
        [self addSubview:self.scrollVW];
        
        [self.scrollVW setShowsHorizontalScrollIndicator:NO];
        [self.scrollVW setShowsVerticalScrollIndicator:NO];
        self.scrollVW.delegate = self;
        self.xPos = 0;
        self.part = 1;
        [self loadGallery];
        self.scrollVW.pagingEnabled = YES;
        
        
    }
    return self;
    
}


-(void)loadGallery{
    
   
    self.photos = [NSMutableArray array];
    
    NSLog(@"LOADING ... PART = %i",self.part);
    
    NSString * mainurl = @"https://api.unsplash.com/photos/?client_id=3fb95d3a8486a19fb7c51f0a6335d51cb5714b206e4e9d0e4410f5f49e79c89f&page=";
    NSString * path = [mainurl stringByAppendingString:[NSString stringWithFormat:@"%i",self.part]];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        NSDictionary *loadedData = (NSDictionary *)responseObject;
        
        if(!error){
            for (NSDictionary *dict in loadedData) {
                Photo *photo = [PhotoFactory createPhotoFromDirectory:dict];
                [self.photos addObject:photo];
            }
            
            [self reloadGallery];
             self.part ++;
            
        }else{
            NSLog(@"Error Json");
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    [operation start];
}


-(void)reloadGallery{
    
    for (Photo * photo in self.photos) {
        
        NSLog(@"photo");
        
        CGSize bounds = CGSizeMake(self.frame.size.width, self.frame.size.height);
        CardView *card = [[CardView alloc]initWithTitle:@"herge" andImage:photo.imageurl andSubTitle:@"The Adventures of Tintin" andFrame:CGRectMake(self.xPos + (self.frame.size.width - bounds.width )/2, 0, bounds.width, bounds.height)];
        
        
        [self.scrollVW addSubview:card];
        
        self.xPos += self.frame.size.width;
    }
    self.scrollVW.contentSize = CGSizeMake(self.xPos, 0);
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    if(page >= (self.photos.count * self.part)-1){
        self.scrollVW.contentSize = CGSizeMake(self.xPos+scrollView.frame.size.width, 0);
        [self loadGallery];
    }
    
}

@end
