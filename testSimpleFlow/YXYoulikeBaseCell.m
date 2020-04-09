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
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
        self.btn = btn;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap222)];
        [self.contentView addGestureRecognizer:tap];
        
    }
    return self;
}

- (void) tap222 {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    [self.delegate collectionView:self.delegate.cv didDeselectItemAtIndexPath:self.ip];
}


- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"%@", NSStringFromCGRect(self.bounds));
    self.title.frame = self.bounds;
    self.btn.frame = self.bounds;
}

- (void)tap {
    NSLog(@"aaaaa: %d", self.ip.row);
    [self.delegate collectionView:self.delegate.cv didDeselectItemAtIndexPath:self.ip];
}

@end
