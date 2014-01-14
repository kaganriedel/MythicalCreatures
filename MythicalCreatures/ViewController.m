//
//  ViewController.m
//  MythicalCreatures
//
//  Created by gule on 1/14/2014.
//  Copyright (c) 2014 gule. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *creatures;
    __weak IBOutlet UITextField *magicalCreatureTextField;
    
    __weak IBOutlet UITableView *creatureTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    creatures = [[NSMutableArray alloc]init];
    
    MagicalCreature *creature;
    creature = [[MagicalCreature alloc]init];
    creature.name = @"Griffen";
    [creatures addObject:creature];
    
    creature = [[MagicalCreature alloc]init];
    creature.name = @"Hippogriff";
    [creatures addObject:creature];

    creature = [[MagicalCreature alloc]init];
    creature.name = @"Dragon";
    [creatures addObject:creature];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [creatureTableView indexPathForSelectedRow];
    vc.creature = creatures[indexPath.row];
    
    
    
 //   MagicalCreature *creatures = [MagicalCreature new];
    
    
}

- (IBAction)onAddButtonPressed:(id)sender
{
    //trim white space before and after text in field (if any)
    NSString *trimmedString = [magicalCreatureTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([trimmedString isEqualToString:@""] == NO)
    {
        MagicalCreature *creature = [MagicalCreature new];
        
        creature.name = magicalCreatureTextField.text;
        [creatures addObject:creature];
        
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
    
    return creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCellID"];
    
    MagicalCreature *creature = [creatures objectAtIndex:indexPath.row];
    
    cell.textLabel.text = creature.name;
    
    
    
    return cell;
    
}


@end
