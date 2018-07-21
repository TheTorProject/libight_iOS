#import <UIKit/UIKit.h>
#import "UIView+Toast.h"
#import "RunButton.h"

@interface RunTestViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *urls;
}

@property (nonatomic, retain) NSURL* url;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, retain) IBOutlet UILabel *randomlistLabel;
@property (nonatomic, strong) IBOutlet RunButton *runButton;

@property (nonatomic, retain) NSString *testName;
@property (nonatomic, retain) NSDictionary *testArguments;
@property (nonatomic, retain) NSString *testDescription;


@end