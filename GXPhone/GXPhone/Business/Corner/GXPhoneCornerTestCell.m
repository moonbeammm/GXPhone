//
//  GXPhoneCornerTestCell.m
//  GXPhone
//
//  Created by sunguangxin on 2017/11/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCornerTestCell.h"
#import <GXRuler/UIImage+Corlor.h>

static const NSInteger kRadius = 10;
static const NSInteger kImgViewWidth = 32;
static const NSInteger kImageViewCount = 9;
static NSString *url = @"http://f.namibox.com/user/644953/headimage/headimage.jpg?20160224215727";

@interface GXPhoneCornerTestCell () {
    int64_t _tsype;
}

@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *cornerViews;

@end

@implementation GXPhoneCornerTestCell

static int64_t _type = 0;

+ (instancetype)initializeWithTableView:(UITableView *)tableview indexPath:(NSIndexPath *)indexPath type:(int64_t)type {
    _type = type;
    return [tableview dequeueReusableCellWithIdentifier:NSStringFromClass([GXPhoneCornerTestCell class]) forIndexPath:indexPath];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        switch (_type) {
            case 0:
                [self configType0];
                break;
            case 1:
                [self configType1];
                break;
            case 2:
                [self configType2];
                break;
            case 3:
                [self configType3];
                break;
            case 4:
                [self configType4];
                break;
                
            default:
                break;
        }
    }
    return self;
}

- (void)installWithModel:(id)model params:(NSDictionary *)params {
    switch (_type) {
        case 0:
            [self installImageType0];
            break;
        case 1:
            [self installImageType1];
            break;
        case 2:
            [self installImageType2];
            break;
        case 3:
            [self installImageType3];
            break;
        case 4:
            [self installImageType4];
            break;
            
        default:
            break;
    }
}






#pragma mark - 0.无圆角
- (void)configType0 {
    self.imageViews = [NSMutableArray arrayWithCapacity:kImageViewCount];
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + kImgViewWidth) * i, 10, kImgViewWidth, kImgViewWidth);
    }
}

- (void)installImageType0 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(kImgViewWidth, kImgViewWidth) placeholderImage:nil options:0 progress:nil completed:nil];
    }
}

//////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 1.有圆角>>>>系统方法
- (void)configType1 {
    self.imageViews = [NSMutableArray arrayWithCapacity:kImageViewCount];
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        imgView.layer.cornerRadius = kRadius;
        imgView.layer.masksToBounds = YES;
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + kImgViewWidth) * i, 10, kImgViewWidth, kImgViewWidth);
    }
}

- (void)installImageType1 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(kImgViewWidth, kImgViewWidth) placeholderImage:nil options:0 progress:nil completed:nil];
    }
}

//////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 2.有圆角>>>>CAShapeLayer
- (void)configType2 {
    self.imageViews = [NSMutableArray arrayWithCapacity:kImageViewCount];
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + kImgViewWidth) * i, 10, kImgViewWidth, kImgViewWidth);
        [self imageViewAddCornerWithImgView:imgView radius:kRadius];
    }
}

- (void)installImageType2 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(kImgViewWidth, kImgViewWidth) placeholderImage:nil options:0 progress:nil completed:nil];
    }
}

- (void)imageViewAddCornerWithImgView:(UIImageView *)imageView radius:(NSInteger)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = imageView.bounds;
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
}

//////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 3.有圆角>>>>CGGraphics

- (void)configType3 {
    self.imageViews = [NSMutableArray arrayWithCapacity:kImageViewCount];
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + kImgViewWidth) * i, 10, kImgViewWidth, kImgViewWidth);
    }
}

- (void)installImageType3 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(kImgViewWidth, kImgViewWidth) placeholderImage:nil options:0 progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, GXWebImageCacheType cacheType, NSURL * _Nullable imageURL) {
            imageView.image = [image drawCircleImageWithImageViewSize:imageView.viewSize radius:CGSizeMake(kRadius, kRadius) type:UIRectCornerAllCorners];
        }];
    }
}

//////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 4.有圆角>>>>蒙一个圆角图片
- (void)configType4 {
    self.imageViews = [NSMutableArray arrayWithCapacity:kImageViewCount];
    self.cornerViews = [NSMutableArray arrayWithCapacity:kImageViewCount];
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
        
        /// 蒙一个圆角ImageView
        UIImageView *cornerImgView = [[UIImageView alloc] init];
        cornerImgView.backgroundColor = [UIColor clearColor];
        cornerImgView.image = [[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(20, 20) radius:kRadius type:GXRectCornerAll] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        [self.cornerViews addObject:cornerImgView];
    }
    
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        UIImageView *cornerView = self.cornerViews[i];
        
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + kImgViewWidth) * i, 10, kImgViewWidth, kImgViewWidth);
        
        [imgView addSubview:cornerView];
        cornerView.frame = imgView.bounds;
    }
}

- (void)installImageType4 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(kImgViewWidth, kImgViewWidth) placeholderImage:nil options:0 progress:nil completed:nil];
    }
}










+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    return 10 + kImgViewWidth + 10;
}

@end
