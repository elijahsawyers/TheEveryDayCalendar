//
//  TheEverydayCalendar.h
//  The Everyday Calendar
//
//  Created by Elijah Sawyers on 2/5/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheEverydayCalendar : NSObject

@property NSArray* months;
@property NSDictionary<NSString*, NSNumber*>* daysInMonth;
@property NSMutableDictionary<NSString*, NSMutableArray*>* daysCompletedInMonth;

@end

NS_ASSUME_NONNULL_END
