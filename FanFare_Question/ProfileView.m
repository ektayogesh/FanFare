//
//  ProfileView.m
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/18/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import "ProfileView.h"
#import "Profile.h"
#import "UIImage+Helper.h"

@interface ProfileView()
@property (weak,nonatomic) IBOutlet UILabel *name;
@property (weak,nonatomic) IBOutlet UILabel *score;
@property (weak,nonatomic) IBOutlet UILabel *rank;
@property (weak,nonatomic) IBOutlet UIImageView *profileImageView;

@end
@implementation ProfileView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)updateViewForProfile:(Profile *)profile{
   
    self.name.text = @"My Name"; //It should be profile.name but for the display purpose hardcoding the value for now;
    NSNumberFormatter *numberFormatter =  [[NSNumberFormatter alloc]init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    self.rank.text = [numberFormatter stringFromNumber:[NSNumber numberWithInt:profile.rank]];
    self.score.text = [numberFormatter stringFromNumber:[NSNumber numberWithInt:profile.score]];
    if(profile.imageUrl)
    {
    [UIImage loadFromURL:[NSURL URLWithString:profile.imageUrl] callback:^(UIImage *image) {
        self.profileImageView.image = image;
    }];
    }
    else
    {
        self.profileImageView.image = [UIImage imageNamed:@"defaultProfile.jpg"];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
