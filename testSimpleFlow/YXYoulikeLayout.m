//
//  YXYoulikeLayout.m
//  testSimpleFlow
//
//  Created by wangjianfei on 2020/4/8.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import "YXYoulikeLayout.h"

@interface YXYoulikeLayout ()

@property (nonatomic, assign) CGFloat lastY0;
@property (nonatomic, assign) CGFloat lastY1;

@end

@implementation YXYoulikeLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.attrsArr removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    self.lastY0 = 0;
    self.lastY1 = 0;

    for (int i=0; i<count; i++) {
        CGFloat height = 0;
        if (i%2 == 0) {
            height = 120;
        } else {
            height = 150;
        }
        CGFloat width = 100;

        CGFloat x, y;
        if (self.lastY0 <= self.lastY1) {
            x = 10;
            y = self.lastY0 + 10;
            self.lastY0 = y+height;
        } else {
            x = 10 + width + 10;
            y = self.lastY1 + 10;
            self.lastY1 = y+height;
        }
        UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attrs.frame = CGRectMake(x, y, width, height);
        [self.attrsArr addObject:attrs];
    }
}

- (NSMutableArray *)attrsArr {
    if (_attrsArr == nil) {
        _attrsArr = [NSMutableArray new];
    }
    return _attrsArr;
}

/**
 * 决定cell的高度
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArr;
}

/**
 * 内容的高度
 */
- (CGSize)collectionViewContentSize {
    return CGSizeMake(375, MAX(self.lastY0, self.lastY1));
}

@end
