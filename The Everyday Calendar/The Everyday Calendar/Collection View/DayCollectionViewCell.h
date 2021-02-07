//
//  DayCollectionViewCell.h
//  The Everyday Calendar
//
//  Created by Elijah Sawyers on 2/4/21.
//

#import <UIKit/UIKit.h>
#import "TheEverydayCalendar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DayCollectionViewCell : UICollectionViewCell

@property NSString* month;
@property int dayOfTheMonth;
@property BOOL completed;
@property TheEverydayCalendar* calendar;

@end

NS_ASSUME_NONNULL_END
