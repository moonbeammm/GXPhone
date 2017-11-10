//
//  GXPhoneCornerTestCell.m
//  GXPhone
//
//  Created by sunguangxin on 2017/11/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCornerTestCell.h"
#import <GXRuler/UIImage+Corlor.h>

static const NSInteger imageViewCount = 9;
static const NSInteger width = 32;
static NSString *url = @"http://f.namibox.com/user/644953/headimage/headimage.jpg?20160224215727";

@interface GXPhoneCornerTestCell () {
    NSInteger _tsype;
}

@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *cornerViews;

@end

@implementation GXPhoneCornerTestCell

static int64_t _type = 0;

+ (instancetype)initializeWithTableView:(UITableView *)tableview indexPath:(NSIndexPath *)indexPath type:(NSInteger)type {
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






/// 无圆角
- (void)configType0 {
    self.imageViews = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + width) * i, 10, width, width);
    }
}

- (void)installImageType0 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(width, width) placeholderImage:nil options:0 progress:nil completed:nil];
    }
}

//////////////////////////////////////////////////////////////////////////////////////

/// 有圆角>>>>系统方法
- (void)configType1 {
    self.imageViews = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        imgView.layer.cornerRadius = 8;
        imgView.layer.masksToBounds = YES;
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + width) * i, 10, width, width);
    }
}

- (void)installImageType1 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(width, width) placeholderImage:nil options:0 progress:nil completed:nil];
    }
}

//////////////////////////////////////////////////////////////////////////////////////

/// 有圆角>>>>CAShapeLayer
- (void)configType2 {
    self.imageViews = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + width) * i, 10, width, width);
        [self imageViewAddCornerWithImgView:imgView];
    }
}

- (void)installImageType2 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(width, width) placeholderImage:nil options:0 progress:nil completed:nil];
    }
}

- (void)imageViewAddCornerWithImgView:(UIImageView *)imageView {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = imageView.bounds;
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
}

//////////////////////////////////////////////////////////////////////////////////////

/// 有圆角>>>>CGGraphics

- (void)configType3 {
    self.imageViews = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
    }
    
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + width) * i, 10, width, width);
    }
}

- (void)installImageType3 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(width, width) placeholderImage:nil options:0 progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, GXWebImageCacheType cacheType, NSURL * _Nullable imageURL) {
            imageView.image = [image drawCircleImage];
        }];
    }
}

//////////////////////////////////////////////////////////////////////////////////////

/// 有圆角>>>>蒙一个圆角图片
- (void)configType4 {
    self.imageViews = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = GXImageMake(GXPhone,@"mine_default");
        [self.imageViews addObject:imgView];
        
        UIImageView *cornerImgView = [[UIImageView alloc] init];
        cornerImgView.backgroundColor = [UIColor clearColor];
        cornerImgView.image = [[UIImage concernImageWithColor:[UIColor whiteColor] size:CGSizeMake(20, 20) cornerRadius:8.0 cornerType:BiliImageCornerTypeAll] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        [self.cornerViews addObject:cornerImgView];
    }
    
    for (NSInteger i = 0; i < imageViewCount; i++) {
        UIImageView *imgView = self.imageViews[i];
        UIImageView *cornerView = self.cornerViews[i];
        
        [self.contentView addSubview:imgView];
        imgView.frame = CGRectMake((10 + width) * i, 10, width, width);
        
        [imgView addSubview:cornerView];
        cornerView.frame = imgView.bounds;
    }
}

- (void)installImageType4 {
    for (UIImageView *imageView in self.imageViews) {
        [imageView gx_setImageWithURL:url ptSize:CGSizeMake(width, width) placeholderImage:nil options:0 progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, GXWebImageCacheType cacheType, NSURL * _Nullable imageURL) {
            imageView.image = [image drawCircleImage];
        }];
    }
}










+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    return 10 + width + 10;
}

@end
