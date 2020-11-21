//
//  UIColor+hex.h
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 20.11.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (UIColorHex)
+ (UIColor *)colorFromHexString:(NSString *)hexString; 
@end

NS_ASSUME_NONNULL_END
