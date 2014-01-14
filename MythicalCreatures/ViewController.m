//
//  ViewController.m
//  MythicalCreatures
//
//  Created by gule on 1/14/2014.
//  Copyright (c) 2014 gule. All rights reserved.
//

#import "ViewController.h"
#import "Creature.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *creaturesArray;
    __weak IBOutlet UITextField *magicalCreatureTextField;
    
    __weak IBOutlet UITableView *creatureTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    creaturesArray = [[NSMutableArray alloc]init];
    
    Creature *creature;
    creature = [[Creature alloc]init];
    creature.name = @"Griffen";
    [creaturesArray addObject:creature];
    
    creature = [[Creature alloc]init];
    creature.name = @"John";
    [creaturesArray addObject:creature];

}

- (IBAction)onAddButtonPressed:(id)sender
{
    //trim white space before and after text in field (if any)
    NSString *trimmedString = [magicalCreatureTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([trimmedString isEqualToString:@""] == NO)
    {
        Creature *creature = [Creature new];
        
        creature.name = magicalCreatureTextField.text;
        [creaturesArray addObject:creature];
        
        magicalCreatureTextField.text = @"";
        
        [magicalCreatureTextField resignFirstResponder];
        
        [creatureTableView reloadData];
        
    }
    else
    {
         magicalCreatureTextField.text = @"";
        
        [magicalCreatureTextField resignFirstResponder];
        
    }
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return creaturesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCellID"];
    
    Creature *creature = [creaturesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = creature.name;
    
    
    
    return cell;
    
}


@end
