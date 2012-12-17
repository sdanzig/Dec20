//
//  SDCreateShotViewController.m
//  Dec20
//
//  Created by Scott Danzig on 12/15/12.
//  Copyright (c) 2012 Scott Danzig. All rights reserved.
//

#import "SDCreateShotViewController.h"
#import "Shot.h"
#import "SDShotList.h"
#import "SDTabBarController.h"

@interface SDCreateShotViewController ()

@end

@implementation SDCreateShotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SDTabBarController *parent = ((SDTabBarController *)self.parentViewController);
    model = parent.model;
    managedObjectContext = parent.managedObjectContext;
    [self updateSceneNumber];
    [self updateSceneSub];
    [self updateShotNumber];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sceneNumberMod:(id)sender {
    [self updateSceneNumber];
    [self.desc resignFirstResponder];
}

- (IBAction)sceneSubMod:(id)sender {
    [self updateSceneSub];
    [self.desc resignFirstResponder];
}

- (IBAction)shotMod:(id)sender {
    [self updateShotNumber];
    [self.desc resignFirstResponder];
}

- (void)updateSceneNumber {
    self.sceneNumberDisplay.text = [NSString stringWithFormat:@"%d",(int)self.sceneNumberStepper.value];
}

- (void)updateSceneSub {
    int subVal = self.sceneSubStepper.value;
    NSString *output;
    if(subVal == 0) {
        output = @"";
    } else {
        output = [NSString stringWithFormat:@"%c",(char)(subVal + 64)];
    }
    self.sceneSubDisplay.text = output;
}

- (void)updateShotNumber {
    self.shotDisplay.text = [NSString stringWithFormat:@"%d",(int)self.shotStepper.value];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.desc isFirstResponder] && [touch view] != self.desc) {
        [self.desc resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)createShot:(id)sender {
    NSLog(@"createShot activated, shots count = %d", [model.shots count]);
    Shot *newShot = (Shot *)[NSEntityDescription insertNewObjectForEntityForName:@"Shot" inManagedObjectContext:managedObjectContext];
    [newShot setScene:[NSNumber numberWithDouble:self.sceneNumberStepper.value]];
    [newShot setSub:[NSNumber numberWithDouble:self.sceneSubStepper.value]];
    [newShot setShot:[NSNumber numberWithDouble:self.shotStepper.value]];
    [newShot setDesc:self.desc.text];
    if([model.shots containsObject:newShot]) {
        NSLog(@"Object already in set");
    } else {
        NSError *error = nil;
        if (![managedObjectContext save:&error]) {
            NSLog(@"%@:%s Error saving context: %@", [self class], (char *)_cmd, [error localizedDescription]);
            return;
        }
        [model.shots addObject:newShot];
        [model sortByViewingOrder];
        
        NSLog(@"shots count now = %d", model.shots.count);
        for (Shot *shot in model.shots) {
            int subInt = shot.sub.intValue;
            NSString *sub = (subInt == 0 ? @"" : [NSString stringWithFormat:@"%c", 64+subInt]);
            
            NSLog(@"Scene #%d%@, shot %d: %@", shot.scene.intValue, sub, shot.shot.intValue, shot.desc);
        }
    }
}
@end
