//
//  InputView.m
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 19.11.2020.
//

#import "InputView.h"

@implementation InputView

UIView *containerView;
UIView *seporatorLine;

- (instancetype) initWithFrame:(CGRect)frame {
	self.loginTextField = [UITextField new];
	self.loginTextField.backgroundColor = UIColor.whiteColor;
	self.passwordTextField = [UITextField new];
	self.passwordTextField.backgroundColor = UIColor.whiteColor;
	containerView.layer.cornerRadius = 10.0;

	seporatorLine = [[UIView alloc] initWithFrame: CGRectZero];
	seporatorLine.translatesAutoresizingMaskIntoConstraints = NO;
	seporatorLine.backgroundColor = UIColor.darkGrayColor;

	self.loginTextField.translatesAutoresizingMaskIntoConstraints = NO;
	self.passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
	self.passwordTextField.secureTextEntry = YES;

	self.loginTextField.placeholder = @"Login";
	self.passwordTextField.placeholder = @"Password";

	self.loginTextField.text = @"login";
	self.passwordTextField.text = @"password";

	self = [super initWithFrame: frame];
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.layer.cornerRadius = 10.0;
	self.backgroundColor = UIColor.whiteColor;

	[self addSubview: self.loginTextField];
	[self addSubview: self.passwordTextField];
	[self addSubview: seporatorLine];

	const CGFloat offset = 8.0;
	[NSLayoutConstraint activateConstraints: @[
		[self.loginTextField.topAnchor constraintEqualToAnchor: self.topAnchor constant: offset],
		[self.loginTextField.centerXAnchor constraintEqualToAnchor: self.centerXAnchor],
		[self.loginTextField.widthAnchor constraintEqualToAnchor: self.widthAnchor multiplier: 0.90],
		[self.loginTextField.heightAnchor constraintEqualToAnchor: self.heightAnchor multiplier: 0.5 constant: -offset],
		[seporatorLine.topAnchor constraintEqualToAnchor: self.loginTextField.bottomAnchor],
		[seporatorLine.widthAnchor constraintEqualToAnchor: self.loginTextField.widthAnchor],
		[seporatorLine.centerXAnchor constraintEqualToAnchor: self.centerXAnchor],
		[seporatorLine.heightAnchor constraintEqualToConstant: 1.0],
		[self.passwordTextField.topAnchor constraintEqualToAnchor: seporatorLine.bottomAnchor],
		[self.passwordTextField.centerXAnchor constraintEqualToAnchor: self.centerXAnchor],
		[self.passwordTextField.widthAnchor constraintEqualToAnchor: self.loginTextField.widthAnchor],
		[self.passwordTextField.heightAnchor constraintEqualToAnchor: self.loginTextField.heightAnchor]
	]];
}


@end
