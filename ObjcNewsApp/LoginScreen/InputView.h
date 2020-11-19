//
//  InputView.h
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 19.11.2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputView : UIView

@property (strong, nonatomic) UITextField *loginTextField;
@property (strong, nonatomic) UITextField *passwordTextField;

- (instancetype) initWithFrame: (CGRect) frame;

@end

NS_ASSUME_NONNULL_END
