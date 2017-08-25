//
//  JLMovie.m
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

#import "JLMovie.h"

@implementation JLMovie

- (instancetype) initWithTitle:(NSString *)title
                        rating:(NSNumber *)rating
                      overview:(NSString *)overview
{
    self = [super init];
    if (self)
    {
        _title = [title copy];
        _rating = [rating copy];
        _overview = [overview copy];
    }
    return self;
}

- (instancetype) initWithDicitonary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[[JLMovie titleKey]];
    NSNumber *rating = dictionary[[JLMovie ratingKey]];
    NSString *overview = dictionary[[JLMovie overviewKey]];
    
    return [self initWithTitle:title rating:rating overview:overview];
}

+ (NSString *) titleKey
{
    return @"title";
}

+ (NSString *) ratingKey
{
    return @"vote_average";
}

+ (NSString *) overviewKey
{
    return @"overview";
}




@end
