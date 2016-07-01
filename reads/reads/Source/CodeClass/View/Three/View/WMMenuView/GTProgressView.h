//
//  GTProgressView.h
//  GTPageController
//

//

#import <UIKit/UIKit.h>

@interface GTProgressView : UIView
@property (nonatomic, strong) NSArray *itemFrames;
@property (nonatomic, assign) CGColorRef color;
@property (nonatomic, assign) CGFloat progress;

- (void)setProgressWithOutAnimate:(CGFloat)progress;
@end
