//
//  Leader.h
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/17/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Leader : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *imageURL;
@property int profileId;
@property int rank;
@property int score;

@end
