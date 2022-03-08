//
//  ViewController.h
//  JsonApiObjectiveC
//
//  Created by Android LDT on 07/03/22.
//
//https://reqres.in/api/users

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource , UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
- (IBAction)SubmitBtnClicked:(UIButton *)sender;

-(void)requestdata;

@end

