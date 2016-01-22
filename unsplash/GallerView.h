//
//  GallerView.h
//  Stripmuseum
//
//  Created by Rachouan Rejeb on 16/12/15.
//  Copyright © 2015 Rachouan Rejeb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "Photo.h"
#import "PhotoFactory.h"

@interface GallerView : UIView<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView * scrollVW;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong)NSMutableArray *photos;
@property (nonatomic,strong)UIRefreshControl *refreshControl;
@property int xPos;
@property int part;

- (id)initWithFrame:(CGRect)frame;

@end
