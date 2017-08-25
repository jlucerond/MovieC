//
//  JLMovieController.h
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLMovie.h"

@interface JLMovieController : NSObject

+ (instancetype) shared;

- (void) searchForMoviesWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray *movies, NSError *error))completion;

@end
