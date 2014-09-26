//
//  ProfileModel.m
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/17/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import "ProfileModel.h"
#import "NetworkManager.h"
#import "Leader.h"
#import "Profile.h"

NSString *FANFARE_URL= @"https://keith.fanfareentertainment.com/api/v4/games/matching.json";

@implementation ProfileModel

+(void)getProfileWithCallBack:(void (^)(BOOL success, id response))callback{
    Profile *profile = [[Profile alloc]init];
    
    [NetworkManager getDataFromServer:FANFARE_URL callBack:^(BOOL success, id jsonResponse) {
        if(success)
        {
            NSLog(@"Response for matching scroes is - %@",jsonResponse);
            NSArray *leaderJsonArray = [jsonResponse objectForKey:@"leaders"];
            
            NSMutableArray *leaders = [[NSMutableArray alloc]init];
            for(NSDictionary *dict in leaderJsonArray)
            {
                Leader *leader=[[Leader alloc]init];
                leader.name = [dict objectForKey:@"name"];
                if([dict objectForKey:@"rank"]){
                    leader.rank = [[dict objectForKey:@"rank"]intValue];
                }
                leader.imageURL =[dict objectForKey:@"image_url"];
                if([dict objectForKey:@"id"])
                {
                    leader.profileId = [[dict objectForKey:@"id"]intValue];
                }
                if([dict objectForKey:@"score"])
                {
                    leader.score = [[dict objectForKey:@"score"]intValue];
                }
                [leaders addObject:leader];
            }
            profile.leaders = leaders;
            if([jsonResponse objectForKey:@"your_rank"])
            {
                profile.rank =[[jsonResponse objectForKey:@"your_rank"]intValue];
            }
            if([jsonResponse objectForKey:@"your_score"])
            {
                profile.score =[[jsonResponse objectForKey:@"your_score"]intValue];
            }
            callback(success,profile);
        }
        else
        {
            callback(success,nil);
        }
    }];

}

@end
