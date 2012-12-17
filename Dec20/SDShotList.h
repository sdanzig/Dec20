//
//  SDShotList.h
//  Dec20
//
//  Created by Scott Danzig on 12/15/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDShotList : NSObject

@property (nonatomic, retain) NSMutableOrderedSet *shots;

- (void)sortByViewingOrder;
- (void)populateShotList:(NSMutableArray *)mutableFetchResults;

@end
