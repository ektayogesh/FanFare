//
//  NetworkManager.h
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/18/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+ (void)getDataFromServer:(NSString *)urlString callBack:(void (^)(BOOL success , id jsonresponse))callback;
@end
