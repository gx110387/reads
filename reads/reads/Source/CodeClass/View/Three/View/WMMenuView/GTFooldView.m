//
//  GTFooldView.m
//  GTPageController
//
//

#import "GTFooldView.h"

@implementation GTFooldView {
    CGFloat GTFooldMargin;
    CGFloat GTFooldRadius;
    CGFloat GTFooldLength;
    CGFloat GTFooldHeight;
    int sign;
    CGFloat gap;
    CGFloat step;
    CADisplayLink *link;
    CGFloat kTime;
}

@synthesize progress = _progress;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        GTFooldHeight = frame.size.height;
        GTFooldMargin = GTFooldHeight * 0.15;
        GTFooldRadius = (GTFooldHeight - 2*GTFooldMargin)/2;
        GTFooldLength = frame.size.width  - 2*GTFooldRadius;
        kTime = 20.0;
    }
    return self;
}

- (void)setProgressWithOutAnimate:(CGFloat)progress {
    if (self.progress == progress) return;
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)setProgress:(CGFloat)progress {
    if (self.progress == progress) return;
    if (fabs(progress - _progress) >= 0.9 && fabs(progress - _progress) < 1.5) {
        gap  = fabs(self.progress - progress);
        sign = self.progress>progress?-1:1;
        if (self.itemFrames.count <= 3) {
            kTime = 15.0;
        }
        step = gap / kTime;
        link = [CADisplayLink displayLinkWithTarget:self selector:@selector(progressChanged)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        return;
    }
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)progressChanged {
    if (gap >= 0.0) {
        gap -= step;
        if (gap < 0.0) {
            self.progress = (int)(self.progress+0.5);
            return;
        }
        self.progress += sign * step;
    } else {
        self.progress = (int)(self.progress+0.5);
        [link invalidate];
        link = nil;
    }
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    int currentIndex = (int)self.progress;
    CGFloat rate = self.progress - currentIndex;
    int nextIndex = currentIndex+1 >= self.itemFrames.count ?: currentIndex+1;

    // 当前item的各数值
    CGRect  currentFrame = [self.itemFrames[currentIndex] CGRectValue];
    CGFloat currentWidth = currentFrame.size.width;
    CGFloat currentX = currentFrame.origin.x;
    // 下一个item的各数值
    CGFloat nextWidth = [self.itemFrames[nextIndex] CGRectValue].size.width;
    CGFloat nextX = [self.itemFrames[nextIndex] CGRectValue].origin.x;
    // 计算点
    CGFloat startX = currentX + (nextX - currentX) * rate;
    CGFloat endX = startX + currentWidth + (nextWidth - currentWidth)*rate;
    // 绘制
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, 0.0f, GTFooldHeight);
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    CGContextAddArc(ctx, startX+GTFooldRadius, GTFooldHeight/2.0, GTFooldRadius, M_PI_2, M_PI_2*3, 0);
    CGContextAddLineToPoint(ctx, endX-GTFooldRadius, GTFooldMargin);
    CGContextAddArc(ctx, endX-GTFooldRadius, GTFooldHeight/2.0, GTFooldRadius, -M_PI_2, M_PI_2, 0);
    CGContextClosePath(ctx);
    
    if (self.hollow) {
        CGContextSetStrokeColorWithColor(ctx, self.color);
        CGContextStrokePath(ctx);
        return;
    }
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, self.color);
    CGContextFillPath(ctx);
}

@end
