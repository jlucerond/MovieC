//
//  JLMovie.h
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLMovie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSNumber *rating;
@property (strong, nonatomic) NSString *overview;

- (instancetype) initWithDicitonary:(NSDictionary *)dictionary;

@end
