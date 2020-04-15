//
//  YXYoulikeBaseCell.m
//  testSimpleFlow
//
//  Created by wangjianfei on 2020/4/8.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import "YXYoulikeBaseCell.h"

@interface YXYoulikeBaseCell ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation YXYoulikeBaseCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.title = [[UILabel alloc] initWithFrame:frame];
        [self addSubview:self.title];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.title.frame = self.bounds;
    self.btn.frame = self.bounds;
}

@end
