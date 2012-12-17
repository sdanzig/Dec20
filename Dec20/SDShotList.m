//
//  SDShotList.m
//  Dec20
//
//  Created by Scott Danzig on 12/15/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import "SDShotList.h"
#import "Shot.h"

@implementation SDShotList

- (id)init {
    self = [super init];
    if(self) {
        self.shots = [[NSMutableOrderedSet alloc] init];
    }
    return self;
}

- (void)sortByViewingOrder {
    [self.shots sortUsingComparator: ^(id obj1, id obj2) {
        NSLog(@"Comparing two objects");
        NSComparisonResult cmp = NSOrderedSame;
        if(obj1 != obj2) {
            NSLog(@"Objects are not the same");
            Shot *first = (Shot *)obj1;
            Shot *second = (Shot *)obj2;
            cmp = [first.scene compare:second.scene];
            if(cmp == NSOrderedSame) {
                cmp = [first.sub compare:second.sub];
                if(cmp == NSOrderedSame) {
                    cmp = [first.shot compare:second.shot];
                }
            }
        }
        return cmp;
    }];
}

- (void)populateShotList:(NSMutableArray *)mutableFetchResults {
    [self.shots addObjectsFromArray:mutableFetchResults];
    [self sortByViewingOrder];
}

@end
