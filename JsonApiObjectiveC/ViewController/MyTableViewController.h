//
//  MyTableViewController.h
//  JsonApiObjectiveC
//
//  Created by Android LDT on 09/03/22.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIAlertViewDelegate,UITextFieldDelegate>

@property(strong,nonatomic)NSMutableArray *userName;
@property(strong,nonatomic)NSMutableArray *userEmail;
@property(strong,nonatomic)NSMutableArray *userImages;

@property(strong,nonatomic)NSMutableArray *userMobile;
@property(strong,nonatomic)NSMutableArray *userGender;
@property(strong,nonatomic)NSMutableArray *userCollImages;
- (IBAction)submitBtnClicked:(UIButton *)sender;
- (IBAction)EditBtnClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *CancelBtnClicked;
- (IBAction)CancelBtnpressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextfield;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
- (IBAction)submitbtnClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

NS_ASSUME_NONNULL_END
       
