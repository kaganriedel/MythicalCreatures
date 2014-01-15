//
//  CreatureViewController.m
//  MythicalCreatures
//
//  Created by gule on 1/14/2014.
//  Copyright (c) 2014 gule. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"
#import "ViewController.h"

@interface CreatureViewController () <UITextFieldDelegate>
{
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *descriptionLabel;
    __weak IBOutlet UILabel *accessoriesLabel;
}

@end

@implementation CreatureViewController

@synthesize creature;


- (void)viewDidLoad
{
    [super viewDidLoad];
    name.text = creature.name;
    descriptionLabel.text = creature.description;
    imageView.image = creature.image;
    
    NSString *attributesString = creature.attributes[0];
    for (int i = 1; i<=(creature.attributes.count-1); i++) {
        attributesString = [NSString stringWithFormat:@"%@, %@",attributesString, creature.attributes[i]];
    }
    accessoriesLabel.text = attributesString;
}

- (IBAction)onEditButtonPressed:(id)sender
{
    nameTextField.alpha = 1;
    name.alpha = 0;
    nameTextField.text = creature.name;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    creature.name = nameTextField.text;
    name.text = creature.name;
    nameTextField.text = @"";
    nameTextField.alpha = 0;
    name.alpha = 1;
}

- (IBAction)onSaveButtonPressed:(id)sender
{
    [nameTextField resignFirstResponder];
    //don't need to write code here because textFieldDidEndEditing calls it! baller
}

@end
