//
//  NetworkService.h
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 19.11.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NetworkServiceProtocol

@end

@interface NetworkService : NSObject<NetworkServiceProtocol>

@end

NS_ASSUME_NONNULL_END
