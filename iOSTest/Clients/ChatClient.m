//
//  ChatClient.m
//  iOSTest
//
//  Created by HannDev LLC on 9/9/19.
//  Copyright © 2019 HannDev LLC. All rights reserved.
//

#import "ChatClient.h"

@interface ChatClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ChatClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 *ATTENTION!!!!!!!!!!!!!!!!!!!!
 *vv this conflicts with a previous instruction, so I used the other instructions endpoint instead. But it should work with both endpoints
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: https:api.jsonbin.io/b/5d769a01b6d0e614dd190aff/3
 **/
+ (NSURL *)baseUrl
{
   return [NSURL URLWithString:@"https://api.jsonbin.io/b/5d769a01b6d0e614dd190aff/1"];
}


+ (void)fetchChatData:(void (^)(NSArray<Message *> *))completion withError:(void (^)(NSString *error))errorBlock
{
    NSURL * url = [self baseUrl];
   
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"unable to retrieve data");
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &error];
        NSArray *resultsArray = topLevelDictionary[@"data"];
        
        NSMutableArray *messageArray = [NSMutableArray new];
        
        for (NSDictionary *messageDictionary in resultsArray) {
            
            
            Message *message = [[Message alloc] initWithDictionary:messageDictionary];
            
            [messageArray addObject:message];
        }
        completion(messageArray);
    }]resume];
    
}

@end
