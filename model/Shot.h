//
//  Shot.h
//  Dec20
//
//  Created by Scott Danzig on 12/16/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Shot : NSManagedObject

@property (nonatomic, retain) NSNumber * scene;
@property (nonatomic, retain) NSNumber * sub;
@property (nonatomic, retain) NSNumber * shot;
@property (nonatomic, retain) NSString * desc;

@end
