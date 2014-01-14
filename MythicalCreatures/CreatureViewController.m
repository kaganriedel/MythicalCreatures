//
//  CreatureViewController.m
//  MythicalCreatures
//
//  Created by gule on 1/14/2014.
//  Copyright (c) 2014 gule. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()
{
    
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UITextField *nameTextField;
    
    
}


@end

@implementation CreatureViewController

@synthesize creature;


- (void)viewDidLoad
{
    [super viewDidLoad];
    name.text = creature.name;
    
}

- (IBAction)onEditButtonPressed:(id)sender
{
    nameTextField.alpha = 1;
    name.alpha = 0;
    
}

- (IBAction)nameEditingDidEnd:(id)sender
{
    name.text = nameTextField.text;
    nameTextField.alpha = 0;
    name.alpha = 1;
    [sender resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
