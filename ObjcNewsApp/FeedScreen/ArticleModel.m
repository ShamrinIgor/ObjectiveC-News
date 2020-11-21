//
//  ArticleModel.m
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 20.11.2020.
//

#import "ArticleModel.h"

@implementation ArticleModel

- (instancetype) initFromDict:(NSDictionary *) dictionary {
	self = [super init];

	id author = [dictionary valueForKey: @"author"];
	if (author != [NSNull null]) {
		self.author = author;
	}

	id title = [dictionary valueForKey: @"title"];
	if (title != [NSNull null]) {
		self.title = title;
	}

	id articleDescription = [dictionary valueForKey: @"description"];
	if (articleDescription != [NSNull null]) {
		self.articleDescription = articleDescription;
	}
	
	return self;
}

@end
