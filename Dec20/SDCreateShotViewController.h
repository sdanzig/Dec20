//
//  SDCreateShotViewController.h
//  Dec20
//
//  Created by Scott Danzig on 12/15/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDShotList.h"

@interface SDCreateShotViewController : UIViewController {
    SDShotList *model;
    NSManagedObjectContext *managedObjectContext;
}

@property (weak, nonatomic) IBOutlet UITextField *sceneNumberDisplay;
@property (weak, nonatomic) IBOutlet UITextField *sceneSubDisplay;
@property (weak, nonatomic) IBOutlet UITextField *shotDisplay;

- (IBAction)sceneNumberMod:(id)sender;
- (IBAction)sceneSubMod:(id)sender;
- (IBAction)shotMod:(id)sender;


@property (weak, nonatomic) IBOutlet UIStepper *sceneNumberStepper;
@property (weak, nonatomic) IBOutlet UIStepper *sceneSubStepper;
@property (weak, nonatomic) IBOutlet UIStepper *shotStepper;


@property (weak, nonatomic) IBOutlet UITextView *desc;

- (IBAction)createShot:(id)sender;

@end
