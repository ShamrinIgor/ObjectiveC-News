//
//  NetworkService.m
//  ObjcNewsApp
//
//  Created by Игорь Шамрин on 19.11.2020.
//

#import "NetworkService.h"

@implementation NetworkService

#pragma mark Singleton Methods

+ (id)sharedService {
	static NetworkService *sharedMyManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedMyManager = [[self alloc] init];
	});
	return sharedMyManager;
}

NSString *const topHeadlinesEndpoint = @"https://newsapi.org/v2/top-headlines";
NSString *const apiKey = @"837a7deab2df4ae89fc670fbad181e11";
NSString *const country = @"us";

- (void)getNewsWithCompletion: (postRequestBlock) completion {

	NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString: topHeadlinesEndpoint];
	NSArray *items = @[
		[[NSURLQueryItem alloc] initWithName: @"apiKey" value: apiKey],
		[[NSURLQueryItem alloc] initWithName: @"country" value: country]
	];

	urlComponents.queryItems = items;
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL: urlComponents.URL];

	NSURLSessionTask *task = [NSURLSession.sharedSession
							  dataTaskWithRequest: request
							  completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		NSError *e;
		NSDictionary *jsonDictionaty = [NSJSONSerialization
							  JSONObjectWithData: data
							  options: kNilOptions
							  error: &e];
		if (jsonDictionaty) {
			NSArray *articles = [jsonDictionaty valueForKey: @"articles"];
			completion(articles);
		}

	}];
	[task resume];
}

@end
