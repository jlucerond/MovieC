//
//  JLMovieController.m
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

#import "JLMovieController.h"
#import "JLNetworkController.h"

@implementation JLMovieController

    // call the network controller and get back a dictionary of items
    // make a new movie using initwithdictionary

+ (instancetype) shared
{
    static JLMovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JLMovieController alloc] init];
    });
    return sharedInstance;
}

- (void)searchForMoviesWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray *, NSError *))completion
{
    [[JLNetworkController shared] jsonDataFromSearchTerm:searchTerm completion:^(NSDictionary *jsonData, NSError *error) {
        
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            completion(nil, error);
        } else {
            
            NSArray *moviesArrayInJSON = jsonData[[JLMovieController resultsKey]];
            
            NSMutableArray *arrayOfMovieItems = [[NSMutableArray alloc] init];
            for (NSDictionary *movieAsDictionary in moviesArrayInJSON) {
                JLMovie *newMovie = [[JLMovie alloc] initWithDicitonary:movieAsDictionary];
                [arrayOfMovieItems addObject:newMovie];
            }
            completion(arrayOfMovieItems, nil);
        }
    }];
        

}

+(NSString *) resultsKey
{
    return @"results";
}

@end
