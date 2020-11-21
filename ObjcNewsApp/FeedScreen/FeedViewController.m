//
//  FeedViewController.m
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 19.11.2020.
//

#import "FeedViewController.h"
#import "FeedTableViewCell.h"
#import "NetworkService.h"
#import "UIColor+hex.h"

@implementation FeedViewController

UITableView *tableView;
NSString *cellId = @"feedCell";

NSMutableArray *feedArcticles;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = UIColor.whiteColor;
	tableView =  [[UITableView alloc] initWithFrame: UIScreen.mainScreen.bounds];
	tableView.delegate = self;
	tableView.dataSource = self;
	tableView.backgroundColor = UIColor.whiteColor;
	[tableView registerClass: FeedTableViewCell.self forCellReuseIdentifier: cellId];
	tableView.estimatedRowHeight = 150;
	tableView.rowHeight = UITableViewAutomaticDimension;

	feedArcticles = [[NSMutableArray alloc] init];

	self.title = @"News";
	self.navigationController.navigationBar.prefersLargeTitles = YES;
	UINavigationBarAppearance *apperance = [UINavigationBarAppearance new];
	apperance.backgroundColor = [UIColor colorFromHexString: @"#A569BD"];
	NSDictionary *attrs = @{ NSForegroundColorAttributeName : UIColor.whiteColor };
	apperance.titleTextAttributes = attrs;
	apperance.largeTitleTextAttributes = attrs;

	self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
	self.navigationController.navigationBar.standardAppearance = apperance;
	self.navigationController.navigationBar.compactAppearance = apperance;
	self.navigationController.navigationBar.scrollEdgeAppearance = apperance;
	[self loadArticles];
	[self.view addSubview: tableView];
}

- (void)loadArticles {
	[[NetworkService sharedService] getNewsWithCompletion: ^(NSArray * _Nonnull articles) {

		NSMutableArray *newArticles = [NSMutableArray new];
		for (NSDictionary *dict in articles) {
			ArticleModel *article = [[ArticleModel alloc] initFromDict: dict];
			[newArticles addObject: article];
		}
		feedArcticles = newArticles;
		dispatch_async(dispatch_get_main_queue(), ^{
			[tableView reloadData];
		});
	}];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId forIndexPath: indexPath];
	[cell setArticle: feedArcticles[indexPath.row]];
	return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [feedArcticles count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath: indexPath animated: YES];
}

@end
