//
//  APDNativeView.m
//  MetaTaxi
//
//  Created by Denis Borodavchenko on 10/10/2019.
//  Copyright © 2019 High Technology Center Limited Company. All rights reserved.
//

#import "APDNativeView.h"

@interface APDNativeView ()
//required
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *callToActionLabel;
//optional
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIView *mediaContainerView;
@property (weak, nonatomic) IBOutlet UIView *adChoicesView;

@end

@implementation APDNativeView

+ (UINib *)nib {
    return [UINib nibWithNibName:@"APDNativeView" bundle:nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    APDNativeView * nativeView = [super initWithCoder:aDecoder];
    return nativeView;
}
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}
//
//- (void)setup {
//    NSArray *views = [[UINib nibWithNibName:@"APDNativeView" bundle:nil] instantiateWithOwner:self options:nil];
//    APDNativeView *nibView = (APDNativeView*)[views firstObject];
//    [self addSubview:nibView];
//    [nibView pinTo:self leftOffset:0 rightOffset:0 topOffset:0 bottomOffset:0];
//}

- (void)asxRound {
    self.layer.masksToBounds = YES;
    self.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 20;
}

- (void)drawRect:(CGRect)rect {
    [self asxRound];
    
    self.iconView.layer.cornerRadius = 10.0;
    self.iconView.layer.masksToBounds = YES;
    
    self.callToActionLabel.layer.cornerRadius = 10.0;
    self.callToActionLabel.layer.masksToBounds = YES;
}

@end
