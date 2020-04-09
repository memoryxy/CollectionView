//
//  YXYoulikeLayout.m
//  testSimpleFlow
//
//  Created by wangjianfei on 2020/4/8.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import "YXYoulikeLayout.h"

@implementation YXYoulikeLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.attrsArr removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];

    for (int i=0; i<count; i++) {
        UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        //attrs.frame = CGRectMake(i%2*60, i/2 * (100+rand()%10) + i/2*10, 50, 100);
        CGFloat height = 120;
        if (i%2 == 1) {
            height = 150;
        }
        attrs.frame = CGRectMake(i%2*110, i/2 * height + i/2*10, 100, height);
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
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(375, (count+1)/2 * 160);
}

@end
