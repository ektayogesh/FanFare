//
//  NetworkManager.m
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/18/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager


+(void)getDataFromServer:(NSString *)urlString callBack:(void (^)(BOOL, id))callback{
   
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    // Specify that it will be a GET request
    request.HTTPMethod = @"GET";

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        id jsonObject;
        NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *)response;
        if (error == nil)
        {
            jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if(error != nil){
                NSLog(@"json object is nil %@", error);
            }
        }
        NSLog(@"Request Header is %@ \n Request URL is %@ \n Response is %@", request.allHTTPHeaderFields, urlString, jsonObject);
        if(httpResponse.statusCode == 200){
            callback(YES,jsonObject);
         
        }else{
            NSLog(@"Http status code is %d and the response is %@", httpResponse.statusCode, jsonObject);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@ - %@", [jsonObject objectForKey:@"code"], [jsonObject objectForKey:@"message"]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
            callback(NO,nil);
        }
    }];
}
@end
