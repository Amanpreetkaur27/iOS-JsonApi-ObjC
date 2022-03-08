//
//  JsonTVCell.h
//  JsonApiObjectiveC
//
//  Created by Android LDT on 07/03/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonTVCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *fnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lnameTextField;

@end

NS_ASSUME_NONNULL_END
