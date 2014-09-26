//
//  ProfileModel.h
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/17/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Profile;

@interface ProfileModel : NSObject

+(void)getProfileWithCallBack:(void (^)(BOOL success, id response))callback;
@end
