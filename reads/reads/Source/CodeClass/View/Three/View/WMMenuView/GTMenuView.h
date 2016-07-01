//
//  GTMenuView.h
//  GTPageController
//
//

#import <UIKit/UIKit.h>
@class GTMenuView;
@class GTMenuItem;
typedef enum {
    GTMenuViewStyleDefault,     // 默认
    GTMenuViewStyleLine,        // 带下划线 (若要选中字体大小不变，设置选中和非选中大小一样即可)
    GTMenuViewStyleFoold,       // 涌入效果 (填充)
    GTMenuViewStyleFooldHollow, // 涌入效果 (空心的)
} GTMenuViewStyle;

@protocol GTMenuViewDelegate <NSObject>
@optional
- (void)menuView:(GTMenuView *)menu didSelesctedIndex:(NSInteger)index currentIndex:(NSInteger)currentIndex;
- (CGFloat)menuView:(GTMenuView *)menu widthForItemAtIndex:(NSInteger)index;
@end

@interface GTMenuView : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) GTMenuViewStyle style;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, weak) id<GTMenuViewDelegate> delegate;
@property (nonatomic, copy) NSString *fontName;

- (instancetype)initWithFrame:(CGRect)frame buttonItems:(NSArray *)items backgroundColor:(UIColor *)bgColor norSize:(CGFloat)norSize selSize:(CGFloat)selSize norColor:(UIColor *)norColor selColor:(UIColor *)selColor;
- (void)slideMenuAtProgress:(CGFloat)progress;
- (void)selectItemAtIndex:(NSInteger)index;
@end
