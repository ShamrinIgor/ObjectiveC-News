//
//  FeedTableViewCell.m
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 20.11.2020.
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell

- (instancetype) initWithFrame:(CGRect)frame {
	self = [super initWithFrame: frame];
	return self;
}

- (instancetype) initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder: coder];
	return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
	self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
	self.titleLabel = [UILabel new];
	self.descriptionLabel = [UILabel new];
	[self addSubview: self.titleLabel];
	[self addSubview: self.descriptionLabel];

	self.titleLabel.numberOfLines = 0;
	self.descriptionLabel.numberOfLines = 0;
	self.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
	[self.titleLabel sizeToFit];
	[self.descriptionLabel sizeToFit];
	self.descriptionLabel.font = [self.descriptionLabel.font fontWithSize: 14.0];
	self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
	self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
	return  self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	[self setupConstraints];
}

- (void)setupConstraints {
	[NSLayoutConstraint activateConstraints: @[
		[self.titleLabel.leadingAnchor constraintEqualToAnchor: self.leadingAnchor constant: 8.0],
		[self.titleLabel.trailingAnchor constraintEqualToAnchor: self.trailingAnchor constant: -8.0],
		[self.titleLabel.topAnchor constraintEqualToAnchor: self.topAnchor constant: 8.0],

		[self.descriptionLabel.leadingAnchor constraintEqualToAnchor: self.titleLabel.leadingAnchor],
		[self.descriptionLabel.trailingAnchor constraintEqualToAnchor: self.titleLabel.trailingAnchor],
		[self.descriptionLabel.topAnchor constraintEqualToAnchor: self.titleLabel.bottomAnchor constant: 8.0],
		[self.descriptionLabel.bottomAnchor constraintEqualToAnchor: self.bottomAnchor constant: -8.0]
	]];
}

- (void)setArticle:(ArticleModel *)article {
	if (article.title != nil)
		self.titleLabel.text = article.title;
	else
		self.titleLabel.text = @"none";

	if (article.articleDescription != nil)
		self.descriptionLabel.text = article.articleDescription;
	else
		self.descriptionLabel.text = @"none";
	[self layoutIfNeeded];
}
@end
