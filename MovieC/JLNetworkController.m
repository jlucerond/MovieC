//
//  JLNetworkController.m
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

#import "JLNetworkController.h"

@interface JLNetworkController()

@end

@implementation JLNetworkController

+ (instancetype)shared
{
    static JLNetworkController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JLNetworkController alloc] init];
    });
    return sharedInstance;
}

- (void)jsonDataFromSearchTerm:(NSString *)searchTerm completion:(void (^)(NSDictionary *, NSError *))completion
{
    NSURL *myURL = [JLNetworkController urlWithSearchTerm:searchTerm];

    [[[NSURLSession sharedSession] dataTaskWithURL:myURL
                                 completionHandler:^(NSData * _Nullable data,
                                                     NSURLResponse * _Nullable response,
                                                     NSError * _Nullable error) {
        
                                     if (error) {
                                         NSLog(@"Error: %@", error.localizedDescription);
                                     }
                                     
                                     if (!data) {
                                         NSLog(@"No data available");
                                         completion(nil, error);
                                         return;
                                     }
                                     
                                     NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
                                     
                                     completion(jsonDictionary, nil);
                                     
    }] resume];
    
    
    
}

+ (NSURL *) baseURL
{
    return [NSURL URLWithString:@"https://api.themoviedb.org/3/search/movie"];
}

+ (NSURL *) urlWithSearchTerm:(NSString *)searchTerm
{
    NSURL *url = [JLNetworkController baseURL];
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:[JLNetworkController apiKey] value:[JLNetworkController apiValue]];
    NSURLQueryItem *searchTermQueryItem = [NSURLQueryItem queryItemWithName:[JLNetworkController searchKey] value:searchTerm];
    
    components.queryItems = @[apiQueryItem, searchTermQueryItem];
    
    return components.URL;
}

+ (NSString *) apiKey
{
    return @"api_key";
}

+ (NSString *) apiValue
{
    return  @"241e7cdd9c39c228149aecefa596fdbb";
}

+ (NSString *) searchKey
{
    return @"query";
}



@end
