//
//  MatchingGameTableViewCell.h
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/17/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Leader.h"


@interface MatchingGameTableViewCell : UITableViewCell

-(void)updateCellWithLeader:(Leader*)leader;
@end
