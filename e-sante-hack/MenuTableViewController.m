//
//  MenuTableViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 21/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	UIViewController *vc;
	
	
	if (indexPath.row == 0){//RAPPORT
		
	} else if (indexPath.row == 1){//Accessibilite
		vc = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"AccessibilityViewController"]];
		
	} else if (indexPath.row == 2){//Accompagnement
		
	} else if (indexPath.row == 3){//Ma communauté
	vc = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"MaCommunaute"]];
	} else if (indexPath.row == 4){//Conseils
		
	} else { //Nos produits de demain
		vc = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"OurProductViewController"]];
	}
	[self.sideMenuViewController setContentViewController:vc animated:YES];
	[self.sideMenuViewController hideMenuViewController];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
	if (indexPath.row == 0){
		cell.itemName = @"Rapport";
	} else if (indexPath.row == 1){
		cell.itemName = @"Accessibilité";
	} else if (indexPath.row == 2){
		cell.itemName = @"Accompagnement";
	} else if (indexPath.row == 3){
		cell.itemName = @"Ma communauté";
	} else if (indexPath.row == 4){
		cell.itemName = @"Conseils";
	} else {
		cell.itemName = @"Nos produits de demain";
	}
    
	
    
    return cell;
}

@end
