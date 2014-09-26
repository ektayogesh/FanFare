//
//  MatchingGameTableViewCell.m
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/17/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import "MatchingGameTableViewCell.h"
#import "UIImage+Helper.h"

@interface MatchingGameTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *rank;

@end
@implementation MatchingGameTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateCellWithLeader:(Leader *)leader{
    
    self.name.text = leader.name;
    NSNumberFormatter *numberFormatter =  [[NSNumberFormatter alloc]init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    self.score.text = [numberFormatter stringFromNumber:[NSNumber numberWithInt:leader.score]];
    self.rank.text = [numberFormatter stringFromNumber:[NSNumber numberWithInt:leader.rank]];
    
    NSURL *url = [NSURL URLWithString:leader.imageURL];
    [UIImage loadFromURL:url callback:^(UIImage *image) {
        self.profileImage.image = image;
    }];
    
}

@end
