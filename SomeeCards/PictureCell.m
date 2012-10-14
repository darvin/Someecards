//
//  PictureCell.m
//  SomeeCards
//
//  Created by Sergey Klimov on 10/14/12.
//  Copyright (c) 2012 Sergey Klimov. All rights reserved.
//

#import "PictureCell.h"
#import "UIImageView+WebCache.h"
@implementation PictureCell {
    UIImageView * image;
}
@synthesize thumbnailURL=_thumbnailURL, fullURL=_fullURL;

- (id) initWithFrame: (CGRect) frame reuseIdentifier: (NSString *) reuseIdentifier
{
    if (self=[super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [[self contentView] addSubview:image];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) setThumbnailURL:(NSURL *)thumbnailURL {
    if (_thumbnailURL==thumbnailURL)
        return;
    _thumbnailURL = thumbnailURL;
    [image setImageWithURL:thumbnailURL];
}

@end
