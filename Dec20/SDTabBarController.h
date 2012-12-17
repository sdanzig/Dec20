//
//  SDTabBarController.h
//  Dec20
//
//  Created by Scott Danzig on 12/16/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDShotList.h"

@interface SDTabBarController : UITabBarController

@property (strong, nonatomic) SDShotList *model;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
