//
//  AccompagnementViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "AccompagnementViewController.h"
#import "HeaderAccompagnementView.h"
#import "EditCellView.h"
#import "LabelPickerTableViewCell.h"

@interface AccompagnementViewController()
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *validateDateButton;
- (IBAction)didTouchValidateButton:(id)sender;

@property (strong, nonatomic) NSIndexPath *currentIndexPath;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation AccompagnementViewController

-(void) viewDidLoad{
	[super viewDidLoad];
	
	UINib *editCellNib = [UINib nibWithNibName:@"EditCellView" bundle:nil];
	[self.tableview registerNib:editCellNib forCellReuseIdentifier:@"EditCellView"];
	
	UINib *labelPicker = [UINib nibWithNibName:@"LabelPickerTableViewCell" bundle:nil];
	[self.tableview registerNib:labelPicker forCellReuseIdentifier:@"LabelPickerTableViewCell"];
	
	self.tableview.delegate = self;
	self.tableview.dataSource = self;
	
	self.navigationItem.title = [@"Accompagnement" uppercaseString];

}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 25;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 44;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
	return 4;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if (section == 0){
		return 1;
	} else if (section == 1){
		return 4;
	} else return 6;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	if (section == 0){
		return @"Ma fiche de renseignement";
	} else if (section == 1){
		return @"Mon parrain";
	} else if (section == 2){
		return @"Mon Médecin traitement";
	} else {
		return @"Mon diabétologue";
	}
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	LabelPickerTableViewCell* cellPicker;
	EditCellView *cell;
	if (indexPath.row == 5){
		cellPicker = [tableView dequeueReusableCellWithIdentifier:@"LabelPickerTableViewCell" forIndexPath:indexPath];
		return cellPicker;
	} else {
		cell = [tableView dequeueReusableCellWithIdentifier:@"EditCellView" forIndexPath:indexPath];
	}
	

	if (indexPath.section == 0){//fiche de renseignement perso
		cell.placeholderText = @"Votre nom et prénom";
	} else if (indexPath.section == 1){//parrain
		if (indexPath.row == 0){
			cell.placeholderText = @"Nom et prénom du parrain";
		} else if (indexPath.row == 1){
			cell.placeholderText = @"Email du parrain";
		} else if (indexPath.row == 2){
			cell.placeholderText = @"Télephone du parrain";
		} else if (indexPath.row == 3){
			cell.placeholderText = @"Frequence d'envoi des rapports";
		}
	} else if (indexPath.section == 2){
		if (indexPath.row == 0){
			cell.placeholderText = @"Nom et prénom du médecin";
		} else if (indexPath.row == 1){
			cell.placeholderText = @"Email du médecin";
		} else if (indexPath.row == 2){
			cell.placeholderText = @"Téléphone du médecin";
		} else if (indexPath.row == 3){
			cell.placeholderText = @"Adresse du médecin";
		} else if (indexPath.row == 4){
			cell.placeholderText = @"Fréquence d'envoi des rapports";
		}
	} else if (indexPath.section == 3){
		if (indexPath.row == 0){
			cell.placeholderText = @"Nom et prénom du diabétologue";
		} else if (indexPath.row == 1){
			cell.placeholderText = @"Email du diabletologue";
		} else if (indexPath.row == 2){
			cell.placeholderText = @"Téléphone de l'hopital";
		} else if (indexPath.row == 3){
			cell.placeholderText = @"Adresse de l'hopital";
		} else if (indexPath.row == 4){
			cell.placeholderText = @"Fréquence d'envoi des rapports";
		}
	}
	return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row == 5){
		self.currentIndexPath = indexPath;
		
		LabelPickerTableViewCell *cell = (LabelPickerTableViewCell*)[self.tableview cellForRowAtIndexPath:indexPath];
		CGRect frame = self.pickerViewContainer.frame;
		frame.origin.y = self.view.frame.size.height - self.pickerViewContainer.frame.size.height;
		[UIView animateWithDuration:0.5
							  delay:0
							options: UIViewAnimationCurveEaseOut
						 animations:^{
							 self.pickerViewContainer.frame = frame;
						 }
						 completion:^(BOOL finished){
							 NSLog(@"Done!");
						 }];
	}
}
/*
-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	HeaderAccompagnementView *view = (HeaderAccompagnementView*)[UIView viewFromNib:@"HeaderAccompagnementView"];
	if (section == 0){
		view.headerText = @"Ma fiche de renseignement";
	} else if (section == 1){
		view.headerText = @"Mon parrain";
	} else if (section == 2){
		view.headerText = @"Mon médecin généraliste";
	} else if (section == 3){
		view.headerText = @"Mon Diabétologue";
	}
	
	return view;
}*/

- (IBAction)didTouchValidateButton:(id)sender {
	CGRect frame = self.pickerViewContainer.frame;
	frame.origin.y = self.view.frame.size.height;
	[UIView animateWithDuration:0.5
						  delay:0
						options: UIViewAnimationCurveEaseOut
					 animations:^{
						 self.pickerViewContainer.frame = frame;
					 }
					 completion:^(BOOL finished){
						 NSLog(@"Done!");
					 }];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
	
	NSString *stringFromDate = [formatter stringFromDate:self.datePicker.date];
	LabelPickerTableViewCell *cell = (LabelPickerTableViewCell*)[self.tableview cellForRowAtIndexPath:self.currentIndexPath];
	cell.dateRdv = stringFromDate;
	
	NSString *string;
	NSIndexPath *index;
	if (self.currentIndexPath.section == 3){
		
		
		index = [NSIndexPath indexPathForRow:0 inSection:2];
		EditCellView *cell = (EditCellView*) [self.tableview cellForRowAtIndexPath:index];
		
		string = [@"Vous avez un rendez chez votre médecin traitement Le Dr." stringByAppendingString:cell.textField.text];
	} else {
		index = [NSIndexPath indexPathForRow:0 inSection:3];
		EditCellView *cell = (EditCellView*) [self.tableview cellForRowAtIndexPath:index];
		
		string = [@"Vous avez un rendez chez votre médecin traitement Le Dr." stringByAppendingString:cell.textField.text];
	}
	
	[Utils displayNotification:[[NSDate date] dateByAddingTimeInterval:10] withMessage:@"Vous avez un rendez chez" sender:self userInfo:@{@"type":@"rdv", @"message":@"veuillez saisir un nouveau RDV"}];
	
	
}
@end
