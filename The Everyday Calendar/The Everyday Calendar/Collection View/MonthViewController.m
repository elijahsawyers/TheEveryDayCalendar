//
//  MonthViewController.m
//  The Everyday Calendar
//
//  Created by Elijah Sawyers on 2/4/21.
//

#import "MonthViewController.h"
#import "DayCollectionViewCell.h"

@interface MonthViewController ()

@end

@implementation MonthViewController

static NSString* const reuseIdentifier = @"monthCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register cell classes
    [self.collectionView registerClass:[DayCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(75, 75);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(25, 25, 25, 25);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.numberOfDays;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath {
    DayCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell.
    cell.dayOfTheMonth = (int)indexPath.item + 1;
    cell.month = self.month;
    cell.completed = [[self.calendar.daysCompletedInMonth valueForKey:self.month][(int)indexPath.item] boolValue];
    cell.calendar = self.calendar;
    
    return cell;
}

@end
