//
//  NetworkService.h
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 19.11.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NetworkServiceProtocol

typedef void(^postRequestBlock)(NSArray *articles);

- (void)getNewsWithCompletion: (postRequestBlock) completion;

@end

@interface NetworkService : NSObject<NetworkServiceProtocol>

- (void)getNewsWithCompletion: (postRequestBlock) completion;

+ (id) sharedService; 

@end

NS_ASSUME_NONNULL_END
