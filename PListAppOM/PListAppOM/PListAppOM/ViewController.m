//
//  ViewController.m
//  PListAppOM
//
//  Created by Glbitm on 9/13/17.
//  Copyright © 2017 Glbitm. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController () {
    NSMutableArray *recipeArray, *imageArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *recipeArray = [[NSArray alloc]init];
//    recipeArray = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
//    
//    NSArray *imageArray = [[NSArray alloc]init];
//    imageArray = [NSArray arrayWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg",@"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg", @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg",@"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg", @"angry_birds_cake.jpg",@"ham_and_cheese_panini.jpg", nil];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"record" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *recArray = [dict objectForKey:@"RecipeArray"];
    recipeArray = [[NSMutableArray alloc]init];
    imageArray = [[NSMutableArray alloc]init];
    for (int i=0;i<recArray.count; i++) {
        [recipeArray addObject:[recArray objectAtIndex:i]];
    }
    NSArray *recImage = [dict objectForKey:@"ImageArray"];
    for (int i=0;i<recImage.count; i++) {
        [imageArray addObject:[recImage objectAtIndex:i]];
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    // Remove the row from data model
    [recipeArray removeObjectAtIndex:indexPath.row];
    [imageArray removeObjectAtIndex:indexPath.row];
    // Request table view to reload
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [recipeArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    tableView.separatorColor = [UIColor grayColor];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    cell.myImageLabel.text = [recipeArray objectAtIndex:indexPath.row];
    cell.myImageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}
@end
