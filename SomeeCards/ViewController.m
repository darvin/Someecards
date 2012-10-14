//
//  ViewController.m
//  SomeeCards
//
//  Created by Sergey Klimov on 10/11/12.
//  Copyright (c) 2012 Sergey Klimov. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize background, picture;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pictureDidChanged:) name:@"PictureDidChangedNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(colorDidChanged:) name:@"ColorDidChangedNotification" object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pictureDidChanged:(NSNotification*) notificaiton {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    NSURL * newPictureURL = [notificaiton userInfo  ][@"pictureURL"];
    [self.picture setImageWithURL:newPictureURL];
}

-(void)colorDidChanged:(NSNotification*) notificaiton {
    
}



@end
