//
//  PicturesViewController.m
//  SomeeCards
//
//  Created by Sergey Klimov on 10/14/12.
//  Copyright (c) 2012 Sergey Klimov. All rights reserved.
//

#import "PicturesViewController.h"
#import "PictureCell.h"
@interface PicturesViewController ()

@end

@implementation PicturesViewController {
    NSArray *images;
}
@synthesize category=_category;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) setCategory:(NSString *)category {
    if (_category==category){
        return;
    }
    _category = category;
    images = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:category ofType:@"plist"]];
    
    [self.gridView reloadData];

}


- (NSUInteger) numberOfItemsInGridView: (AQGridView *) gridView
{
	return [images count];
}


- (AQGridViewCell *) gridView: (AQGridView *) gridView cellForItemAtIndex: (NSUInteger) index
{
    static NSString * CellIdentifier = @"CellIdentifier";
    
    PictureCell * cell = (PictureCell *)[gridView dequeueReusableCellWithIdentifier: CellIdentifier];
    if ( cell == nil )
    {
        cell = [[PictureCell alloc] initWithFrame: CGRectMake(0.0, 0.0, 72.0, 72.0) reuseIdentifier: CellIdentifier];
    }
    
    cell.thumbnailURL = [NSURL URLWithString: [[images objectAtIndex:index] objectAtIndex:0]];
    
    return ( cell );
}


- (void)gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index {
    NSURL * pictureURL = [[images objectAtIndex:index] objectAtIndex:1];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PictureDidChangedNotification" object:nil userInfo:@{@"pictureURL":pictureURL}];
}



@end
