//
//  FeedTableViewCell.h
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 20.11.2020.
//

#import <UIKit/UIKit.h>
#import "ArticleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedTableViewCell : UITableViewCell

- (instancetype) initWithFrame:(CGRect)frame;
- (instancetype) initWithCoder:(NSCoder *)coder;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

- (void)setArticle:(ArticleModel *)article;

@end

NS_ASSUME_NONNULL_END
