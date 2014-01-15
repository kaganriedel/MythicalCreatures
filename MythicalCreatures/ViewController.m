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
    __weak IBOutlet UITextField *magicalCreatureTextField;
    __weak IBOutlet UITableView *creatureTableView;
    NSMutableArray *creatures;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    creatures = [[NSMutableArray alloc]init];
    
    MagicalCreature *creature;
    
    creature = [[MagicalCreature alloc]init];
    creature.name = @"Griffin";
    creature.description = @"A bird lion mess";
    creature.image = [UIImage imageNamed:@"Griffen.png"];
    creature.attributes = [NSMutableArray arrayWithObjects:@"Claws", @"Beak", @"Talons", nil];
    [creatures addObject:creature];
    
    creature = [[MagicalCreature alloc]init];
    creature.name = @"Hippogriff";
    creature.description = @"A horse bird thing";
    creature.image = [UIImage imageNamed:@"Hippogriff.jpg"];
    creature.attributes = [NSMutableArray arrayWithObjects:@"Claws", @"Beak", nil];
    [creatures addObject:creature];

    creature = [[MagicalCreature alloc]init];
    creature.name = @"Dragon";
    creature.description = @"Total badass. Also, a vicious killing machine";
    creature.attributes = [NSMutableArray arrayWithObjects:@"Claws", @"Teeth", @"Wicked Tail", @"Fire Breath", @"Badass Attitude", nil];
    creature.image = [UIImage imageNamed:@"Dragon.jpg"];
    [creatures addObject:creature];

}

-(void)viewWillAppear:(BOOL)animated
{
    [creatureTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [creatureTableView indexPathForSelectedRow];
    vc.creature = creatures[indexPath.row];
}

- (IBAction)onAddButtonPressed:(id)sender
{
    //trim white space before and after text in field (if any)
    NSString *trimmedString = [magicalCreatureTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([trimmedString isEqualToString:@""] == NO)
    {
        MagicalCreature *creature = [MagicalCreature new];
        creature.name = magicalCreatureTextField.text;
        creature.description = @"Totally legendary";
        creature.image = [UIImage imageNamed:@"Phoenix.jpg"];
        creature.attributes = [NSMutableArray arrayWithObject:@"Pride"];
        [creatures addObject:creature];
        magicalCreatureTextField.text = @"";
        [magicalCreatureTextField resignFirstResponder];
        [creatureTableView reloadData];
    } else
    {
         magicalCreatureTextField.text = @"";
        [magicalCreatureTextField resignFirstResponder];
    }
}

- (IBAction)onFightButtonPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"FIGHT!" message:@"A vicious battle breaks out between Griffin, Hippogriff and the other Mythical Creatures! Dragon wins. Duh." delegate:nil cancelButtonTitle:@"No surprises there" otherButtonTitles:nil];
    [alert show];
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
    cell.detailTextLabel.text = creature.description;
    cell.imageView.image = creature.image;
    
    return cell;
}


@end
