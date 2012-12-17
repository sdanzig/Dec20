//
//  SDShotListViewController.h
//  Dec20
//
//  Created by Scott Danzig on 12/16/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDShotList.h"

@interface SDShotListViewController : UITableViewController {
    SDShotList *model;
    NSManagedObjectContext *managedObjectContext;
}


@end
