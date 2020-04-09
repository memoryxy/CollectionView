//
//  ViewController.m
//  testSimpleFlow
//
//  Created by wangjianfei on 2020/4/8.
//  Copyright © 2020 wangjianfei. All rights reserved.
//

#import "ViewController.h"
#import "YXYoulikeLayout.h"
#import "YXYoulikeBaseCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) YXYoulikeLayout *likeLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YXYoulikeLayout *layout = [YXYoulikeLayout new];
    self.likeLayout = layout;
    
    self.cv = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:self.cv];
    self.cv.delegate = self;
    self.cv.dataSource = self;
    
    self.datas = [NSMutableArray new];
    
    for (int i=0; i<16; i++) {
        [self.datas addObject:@(i)];
    }
    
    self.cv.backgroundColor = [UIColor lightGrayColor];
    
    [self.cv registerClass:YXYoulikeBaseCell.class forCellWithReuseIdentifier:NSStringFromClass(YXYoulikeBaseCell.class)];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.datas removeObjectAtIndex:indexPath.row];
    [collectionView performBatchUpdates:^{
        [collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self.cv reloadData];
    }];
    
//    [UIView animateWithDuration:1.5 animations:^{
//        //[collectionView deleteItemsAtIndexPaths:@[indexPath]];
//        self.view.backgroundColor = [UIColor redColor];
//    } completion:^(BOOL finished) {
//        NSLog(@"finish %d", finished);
    //        [self.cv reloadData];
//    }];
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXYoulikeBaseCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(YXYoulikeBaseCell.class) forIndexPath:indexPath];
    cell.backgroundColor = [self randomColor];
    cell.title.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.ip = indexPath;
    cell.delegate = self;
    return cell;
}

- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
