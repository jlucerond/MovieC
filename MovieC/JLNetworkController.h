//
//  JLNetworkController.h
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLNetworkController : NSObject

+(instancetype) shared;

- (void)jsonDataFromSearchTerm:(NSString *)searchTerm completion:(void(^)(NSDictionary *jsonData, NSError *error))completion;

@end
