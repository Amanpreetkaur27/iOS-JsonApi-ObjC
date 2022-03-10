//
//  MyTableViewController.m
//  JsonApiObjectiveC
//
//  Created by Android LDT on 09/03/22.
//

#import "MyTableViewController.h"
#import "HomeViewController.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"


@interface MyTableViewController ()

@end

@implementation MyTableViewController
@synthesize userName,userEmail,userImages,userGender,userMobile,userCollImages,datePicker,genderTextfield,usernameTextField,dateTextField;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: - TableView Array
    
    userName = [[NSMutableArray alloc]initWithObjects:@"Aman",@"prabh",@"Jass",@"Taran",@"raman", nil];
    userEmail = [[NSMutableArray alloc]initWithObjects:@"preet12@gmail.com",@"kaur12@gmail.com",@"singh12@gmail.com",@"sasan8@gmail.com",@"rathour@gmail", nil];
    userImages = [[NSMutableArray alloc]initWithObjects:@"User1",@"User2",@"User1",@"User2",@"User1", nil];
    
    //MARK: - CollectionView Array
    
    userCollImages = [[NSMutableArray alloc]initWithObjects:@"User1",@"User2",@"User1",@"User2",@"User1", nil];
    userGender = [[NSMutableArray alloc]initWithObjects:@"Femail",@"Male",@"Female",@"Female",@"Male", nil];
    userMobile = [[NSMutableArray alloc]initWithObjects:@"9856325698",@"858756256",@"9856325985",@"7856941236",@"8569741236", nil];
    datePicker=[[UIDatePicker alloc]init];
   [ dateTextField setInputView:datePicker];
    
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 55)];
    [toolBar setTintColor:[UIColor blackColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(ShowSelectedDate)];
     
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];

    [dateTextField setInputAccessoryView:toolBar];

}
-(void)ShowSelectedDate{
    dateTextField.delegate = self;
    NSDateFormatter *objDateFormatter = [[NSDateFormatter alloc] init];
    objDateFormatter.dateFormat = @"yyyy-MM-dd 'at' HH:mm";
    NSDate *date = [NSDate date]; // your NSDate object
    NSString *dateString = [objDateFormatter stringFromDate:date];
    dateTextField.text = dateString;

}

//MARK: - UITableViewDataSource and UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return userName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        if (cell == nil) {
            cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
   }
    cell.userTextField.text = userName[indexPath.row];
    cell.emailTextField.text = userEmail[indexPath.row];
    cell.userImage.image = [UIImage imageNamed:userImages[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//MARK: - UICollectionViewDataSource and UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return userMobile.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.mobileTextField.text = userMobile[indexPath.row];
    cell.genderTextField.text = userGender[indexPath.row];
    cell.userImage.image = [UIImage imageNamed:userCollImages[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(130, 130);
}

- (IBAction)EditBtnClicked:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Edit Profile"
               message:@"Do you want to edit your profile"
               preferredStyle:UIAlertControllerStyleAlert]; // 1
       UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Yes"
               style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                   NSLog(@"You pressed button one");
           
               }]; // 2
       UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"No"
               style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                  NSLog(@"You pressed button two");

               }]; // 3
      UIAlertAction *thirdAction = [UIAlertAction actionWithTitle:@"Maybe Later"
            style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                NSLog(@"You pressed button three");
        }]; //4
   [alert addAction:firstAction]; // 5
   [alert addAction:secondAction]; // 6
   [alert addAction:thirdAction];  // 7
   [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)submitBtnClicked:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //Now write your next view controller and write your storyboard id.
    UIViewController *myNewVC = (HomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:myNewVC animated:YES];
}

- (IBAction)CancelBtnpressed:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cancel Page"
               message:@"Do you want to cancel the request"
               preferredStyle:UIAlertControllerStyleAlert]; // 1
       UIAlertAction *No = [UIAlertAction actionWithTitle:@"No"
               style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                   NSLog(@"You pressed button one");
    }];
        UIAlertAction *Yes = [UIAlertAction actionWithTitle:@"Yes"
                   style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                       NSLog(@"You pressed button one");
    }];
    [alert addAction:Yes];
    [alert addAction:No];
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)submitbtnClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //Now write your next view controller and write your storyboard id.
    UIViewController *myNewVC = (HomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:myNewVC animated:YES];
    NSLog(@"UserName is %@",usernameTextField.text);
    NSLog(@"Date is %@",dateTextField.text);
    NSLog(@"Gender is %@",genderTextfield.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
