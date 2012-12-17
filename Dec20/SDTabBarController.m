//
//  SDTabBarController.m
//  Dec20
//
//  Created by Scott Danzig on 12/16/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import "SDTabBarController.h"

@interface SDTabBarController ()

@end

@implementation SDTabBarController

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder]) {
        self.model = [[SDShotList alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Shot" inManagedObjectContext:_managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[_managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        NSLog(@"%@:%s Error fetching context: %@", [self class], (char *)_cmd, [error localizedDescription]);
        return;
    }
    [self.model populateShotList:mutableFetchResults];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
