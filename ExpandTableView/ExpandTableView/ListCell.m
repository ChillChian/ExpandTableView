//
//  ListCell.m
//  ExpandTableView
//
//  Created by Qzhq on 2018/1/24.
//  Copyright © 2018年 Qzhq. All rights reserved.
//

#import "ListCell.h"
#import "ListModel.h"

@interface ListCell ()

@property (nonatomic, assign) NSInteger level;

@end

@implementation ListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.textLabel.frame;
    rect.origin.x = 10 + self.level * 20;
    self.textLabel.frame = rect;
}

// 自己自定义每级的样式，我这里只做了一个左边距。
- (void)cellWithModel:(ListModel *)model {
    self.textLabel.text = model.showName;
    self.level = model.Level;
}

@end
