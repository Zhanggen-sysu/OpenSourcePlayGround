//
//  OSPGSignatureView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/2/3.
//

#import "OSPGSignatureView.h"
#import "Macros.h"

@interface OSPGSignatureView ()

@property (nonatomic,strong) NSMutableArray <CAShapeLayer*>*pathArr;
@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@end

@implementation OSPGSignatureView {
    UIBezierPath *_path;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:RGBColor(240.f, 240.f, 240.f)];
    }
    return self;
}

- (NSMutableArray<CAShapeLayer *> *)pathArr
{
    if (!_pathArr) {
        _pathArr = [[NSMutableArray alloc] init];
    }
    return _pathArr;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint p = [[touches anyObject] locationInView:self];
    _path = [[UIBezierPath alloc] init];
    [_path moveToPoint:p];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor blueColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 3;
    layer.path = _path.CGPath;
    [self.layer addSublayer:layer];
    self.shapeLayer = layer;
   [self.pathArr addObject:layer];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    [_path addLineToPoint:point];
    self.shapeLayer.path = _path.CGPath;
}

- (void)clear{
   NSInteger count = self.pathArr.count;
    for (int i = 0; i < count; i++) {
        [self.pathArr.lastObject removeFromSuperlayer];
        [self.pathArr removeLastObject];
    }
}

- (void)revoke{
    [self.pathArr.lastObject removeFromSuperlayer];
    [self.pathArr removeLastObject];
}

#pragma mark - 获取图片
- (UIImage *)getSignatureImage {
    //设置为NO，UIView是透明这里的图片就是透明的
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *signatureImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSString* docDir = [NSString stringWithFormat:@"%@/Documents/Image", NSHomeDirectory()];
    [[NSFileManager defaultManager] createDirectoryAtPath:docDir withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *path = [NSString stringWithFormat:@"%@/Documents/Image/IMAGE.PNG", NSHomeDirectory()];
    
    //用png是透明的
    [UIImagePNGRepresentation(signatureImage) writeToFile: path atomically:YES];
    return signatureImage;
}

@end
