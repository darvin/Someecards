//
//  PictureCell.h
//  SomeeCards
//
//  Created by Sergey Klimov on 10/14/12.
//  Copyright (c) 2012 Sergey Klimov. All rights reserved.
//

#import "AQGridViewCell.h"

@interface PictureCell : AQGridViewCell
@property (strong, nonatomic) NSURL*thumbnailURL;
@property (strong, nonatomic) NSURL*fullURL;
@end
