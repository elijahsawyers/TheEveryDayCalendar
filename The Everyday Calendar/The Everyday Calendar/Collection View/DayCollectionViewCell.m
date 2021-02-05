//
//  DayCollectionViewCell.m
//  The Everyday Calendar
//
//  Created by Elijah Sawyers on 2/4/21.
//

#import "DayCollectionViewCell.h"

// MARK: - Macros.

#define NOT_COMPLETED_BORDER_COLOR [UIColor colorWithRed: 1.0 green: 0.933 blue: 0.576 alpha: 0.3]
#define NOT_COMPLETED_FILL_COLOR [UIColor colorWithRed: 0.415 green: 0.364 blue: 0.220 alpha: 0.4]
#define COMPLETED_BORDER_COLOR [UIColor colorWithRed: 1.0 green: 0.933 blue: 0.576 alpha: 1.0]
#define COMPLETED_FILL_COLOR [UIColor colorWithRed: 0.415 green: 0.364 blue: 0.220 alpha: 1.0]

// MARK: - Extension.

@interface DayCollectionViewCell ()

@property UILabel* label;

@end

// MARK: - Implementation.

@implementation DayCollectionViewCell

// MARK: - Initialization and setup.

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setup];
    }
    return self;
}

- (void)setup {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self addGestureRecognizer:tapGesture];
    self.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.layer.shadowOpacity = 0;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.layer.shadowRadius = 10;
    self.completed = NO;
    [self createLabel];
}

- (void)createLabel {
    CGPoint origin = self.bounds.origin;
    CGSize size = self.bounds.size;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
    self.label.textColor = NOT_COMPLETED_BORDER_COLOR;
    self.label.font = [UIFont systemFontOfSize:40];
    self.label.text = [NSString stringWithFormat:@"%d", self.dayOfTheMonth];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

- (void)handleTap {
    self.completed = !self.completed;
}

// MARK: - Properties.

@synthesize dayOfTheMonth = _dayOfTheMonth;
@synthesize completed = _completed;

- (int)dayOfTheMonth {
    return _dayOfTheMonth;
}

- (void)setDayOfTheMonth:(int)newDayOfTheMonth {
    _dayOfTheMonth = newDayOfTheMonth;
    self.label.text = [NSString stringWithFormat:@"%d", newDayOfTheMonth];
}

- (BOOL)completed {
    return _completed;
}

- (void)setCompleted:(BOOL)newCompleted {
    _completed = newCompleted;
    if (newCompleted) {
        [UIView transitionWithView:self.label duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.label.textColor = COMPLETED_BORDER_COLOR;
        } completion:nil];
        [UIView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.layer.transform = CATransform3DRotate(CATransform3DIdentity, 360 * M_PI / 180, 0, 1, 0);
        } completion:^(BOOL finished){
            if (finished) {
                self.layer.transform = CATransform3DIdentity;
                [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    self.layer.shadowOpacity = 1;
                } completion:nil];
            }
        }];
    } else {
        [UIView transitionWithView:self duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.layer.shadowOpacity = 0;
        } completion:nil];
        [UIView transitionWithView:self.label duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.label.textColor = NOT_COMPLETED_BORDER_COLOR;
        } completion:nil];
    }
    [self setNeedsDisplay];
}

// MARK: - Drawing.

- (void)drawRect:(CGRect)rect {
    CGPoint origin = self.bounds.origin;
    CGSize size = self.bounds.size;
    UIBezierPath *path = [UIBezierPath new];
    path.lineWidth = 5.0;

    // Top-middle.
    [path moveToPoint:CGPointMake(origin.x + size.width / 2, origin.y + path.lineWidth)];

    // Right side.
    [path addLineToPoint:CGPointMake(origin.x + size.width - path.lineWidth, origin.y + size.height * 0.20)];
    [path addLineToPoint:CGPointMake(origin.x + size.width - path.lineWidth, origin.y + size.height * 0.80)];

    // Bottom-middle.
    [path addLineToPoint:CGPointMake(origin.x + size.width / 2, origin.y + size.height - path.lineWidth)];

    // Left size.
    [path addLineToPoint:CGPointMake(origin.x + path.lineWidth, origin.y + size.height * 0.80)];
    [path addLineToPoint:CGPointMake(origin.x + path.lineWidth, origin.y + size.height * 0.20)];
    
    // Close the path.
    [path closePath];
    
    if (self.completed) {
        [COMPLETED_FILL_COLOR setFill];
        [path fill];
        [COMPLETED_BORDER_COLOR setStroke];
        [path stroke];
    } else {
        [NOT_COMPLETED_FILL_COLOR setFill];
        [path fill];
        [NOT_COMPLETED_BORDER_COLOR setStroke];
        [path stroke];
    }
}

@end
