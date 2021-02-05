//
//  MonthPickerViewController.m
//  The Everyday Calendar
//
//  Created by Elijah Sawyers on 2/4/21.
//

#import "MonthPickerViewController.h"

@interface MonthPickerViewController ()

@property NSArray* months;

@end

@implementation MonthPickerViewController

static NSString * const reuseIdentifier = @"monthTableViewCell";

#pragma mark - View controller life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.months = @[
       @"January",
       @"February",
       @"March",
       @"April",
       @"May",
       @"June",
       @"July",
       @"August",
       @"September",
       @"October",
       @"November",
       @"December",
   ];
    
    self.title = @"The Everyday Calendar";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

#pragma mark - Table view data source.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.months[indexPath.item]];
    
    return cell;
}

#pragma mark - Navigation.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showMonth" sender:[NSString stringWithFormat:@"%@", self.months[indexPath.item]]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[segue destinationViewController] setTitle:sender];
}

@end
