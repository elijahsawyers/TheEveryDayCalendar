//
//  TheEverydayCalendar.m
//  The Everyday Calendar
//
//  Created by Elijah Sawyers on 2/5/21.
//

#import "TheEverydayCalendar.h"

@implementation TheEverydayCalendar

- (instancetype)init {
    if ([super init]) {
        // Store the number of days per month.
        NSCalendar* calendar = [NSCalendar currentCalendar];
        self.months = [calendar monthSymbols];
        NSMutableDictionary* daysInMonth = [NSMutableDictionary new];
        for (int month = 1; month <= [self.months count]; month++) {
            NSDateComponents* components = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
            [components setDay:1];
            [components setMonth:month];
            NSInteger numberOfDaysInMonth = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[calendar dateFromComponents:components]].length;
            [daysInMonth setValue:[NSNumber numberWithLong:numberOfDaysInMonth] forKey:self.months[month-1]];
        }
        self.daysInMonth = [daysInMonth copy];
        
        // Initialize the days completed in a month.
        self.daysCompletedInMonth = [NSMutableDictionary new];
        for (int month = 1; month <= [self.months count]; month++) {
            NSMutableArray* completed = [NSMutableArray new];
            for (int i = 0; i < [[self.daysInMonth valueForKey:self.months[month-1]] intValue]; i++) {
                [completed addObject:[NSNumber numberWithInt:NO]];
            }
            [self.daysCompletedInMonth setValue:completed forKey:self.months[month-1]];
        }
    }
    return self;
}

@end
