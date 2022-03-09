//
//  ViewController.m
//  JsonApiObjectiveC
//
//  Created by Android LDT on 07/03/22.
//

#import "ViewController.h"
#import "WebService.h"
#import "JsonTVCell.h"

@interface ViewController () {
    NSString *mainstr;
    NSMutableArray *strId;
    NSMutableArray *strEmail;
    NSMutableArray *strLastName;
    NSMutableArray *strFirstName;
    NSMutableArray *strImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hello, This is my json api code");
    [self requestdata];
}
@synthesize myDatePicker;
-(void)requestdata {
    mainstr = [NSString stringWithFormat:@"https://reqres.in/api/users"];
    [WebService executequery:mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
    
            NSLog(@"Response Data: %@", maindic);
            
            self->strId = [[NSMutableArray alloc]init];
            self->strEmail = [[NSMutableArray alloc]init];
            self->strFirstName = [[NSMutableArray alloc]init];
            self->strLastName = [[NSMutableArray alloc]init];
            self->strImageView = [[NSMutableArray alloc]init];
            NSMutableArray *dic1 = [maindic objectForKey:@"data"];
            for (NSDictionary *dict in dic1) {
                NSString *fName = [dict objectForKey:@"email"];
                [self->strFirstName addObject:fName];
                NSLog(@"email name : %@",fName);
                NSString *lName = [dict objectForKey:@"first_name"];
                [self->strLastName addObject:lName];
                NSLog(@"first name : %@",lName);
                NSString *emailstr = [dict objectForKey:@"last_name"];
                [self->strEmail addObject:emailstr];
                NSLog(@"last name : %@",emailstr);
                NSString *imageStr = [dict objectForKey:@"avatar"];
                [self->strImageView addObject:imageStr];
                NSLog(@"image : %@",imageStr);
                

            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
         
        }
    }];
}

- (IBAction)SubmitBtnClicked:(UIButton *)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return strFirstName.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
        
    JsonTVCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    if (cell == nil) {
     cell = [[JsonTVCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
}
    cell.emailTextField.text = strEmail[indexPath.row];
    cell.fnameTextField.text = strFirstName[indexPath.row];
    cell.lnameTextField.text = strLastName[indexPath.row];
    
    NSString *imgString =  strImageView[indexPath.row]; // @"https://reqres.in/img/faces/6-image.jpg";
   NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imgString]];
    cell.userImage.image = [UIImage imageWithData: imageData];

    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 235;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField.tag == 3 ){
        myDatePicker=[[UIDatePicker alloc]init];
        [_genderTextField setInputView:myDatePicker];
        NSString *dateString = [NSString stringWithFormat:@"%@",[NSDate date]];
        _genderTextField.text = dateString;
    }
    
}
-(void) downloadImageFromURL :(NSString *)imageUrl{

    NSURL  *url = [NSURL URLWithString:imageUrl];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    if ( urlData )
    {
        NSLog(@"Downloading started...");
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"dwnld_image.png"];
        NSLog(@"FILE : %@",filePath);
        [urlData writeToFile:filePath atomically:YES];
        UIImage *image1=[UIImage imageWithContentsOfFile:filePath];
        NSLog(@"Completed...");
    }
}
@end
    

