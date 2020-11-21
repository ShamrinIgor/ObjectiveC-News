//
//  ViewController.m
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 19.11.2020.
//

#import "LoginViewController.h"
#import "InputView.h"
#import "NetworkService.h"
#import "FeedViewController.h"
#import "UIColor+hex.h"

@interface LoginViewController ()

//@property (strong, nonatomic) id<NetworkServiceProtocol> networkService;
@end

@implementation LoginViewController

InputView *inputView;
UIButton *loginButton;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor colorFromHexString: @"#900C3F"];

	CAGradientLayer *gradient = [CAGradientLayer layer];

	gradient.frame = self.view.bounds;
	gradient.colors = @[(id)[UIColor colorFromHexString: @"#A569BD"].CGColor, (id)[UIColor colorFromHexString: @"#45B39D  "].CGColor];
	[self.view.layer insertSublayer:gradient atIndex:0];

	inputView = [[InputView alloc] initWithFrame: CGRectZero];
	inputView.translatesAutoresizingMaskIntoConstraints = NO;

	loginButton = [UIButton buttonWithType: UIButtonTypeSystem];
	loginButton.backgroundColor = UIColor.systemBlueColor;
	[loginButton setTitleColor: UIColor.whiteColor forState: UIControlStateNormal];
	loginButton.layer.cornerRadius = 10.0;
	[loginButton setTitle: @"Войти" forState: UIControlStateNormal];
	loginButton.backgroundColor = [UIColor colorFromHexString: @"#A569BD"];
	loginButton.translatesAutoresizingMaskIntoConstraints = NO;
	[loginButton addTarget: self action: @selector(loginButtonPressed:) forControlEvents: UIControlEventTouchUpInside];

	[self setupUI];
}

- (void)setupUI {
	[self.view addSubview: inputView];
	[self.view addSubview: loginButton];

	[NSLayoutConstraint activateConstraints: @[
		[inputView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
		[inputView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant: 150.0],
		[inputView.widthAnchor constraintEqualToAnchor: self.view.widthAnchor multiplier: 0.85],
		[inputView.heightAnchor constraintEqualToAnchor: self.view.heightAnchor multiplier: 0.12],

		[loginButton.heightAnchor constraintEqualToConstant: 50.0],
		[loginButton.widthAnchor constraintEqualToAnchor: inputView.widthAnchor],
		[loginButton.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant: -50],
		[loginButton.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor]
	]];
}

//MARK: Handlers
- (void)loginButtonPressed: obj {
	FeedViewController *loginVC = [FeedViewController new];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: loginVC];
	navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
	[self presentViewController: navigationController animated: YES completion: ^{}];
}

@end
