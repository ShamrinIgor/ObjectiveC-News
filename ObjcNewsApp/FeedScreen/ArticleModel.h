//
//  ArticleModel.h
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 20.11.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleModel : NSObject

- (instancetype)initFromDict: (NSDictionary *) dictionary;

@property (nullable, strong, nonatomic) NSString *author;
@property (nullable, strong, nonatomic) NSString *title;
@property (nullable, strong, nonatomic) NSString *articleDescription;

@end

NS_ASSUME_NONNULL_END
