//
//  Profile.h
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/18/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *imageUrl;
@property (strong,nonatomic) NSArray/*Leader*/ *leaders;
@property int rank;
@property int score;
@end
