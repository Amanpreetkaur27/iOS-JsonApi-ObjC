//
//  TableViewCell.h
//  JsonApiObjectiveC
//
//  Created by Android LDT on 09/03/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userTextField;
@property (weak, nonatomic) IBOutlet UILabel *emailTextField;

@end

NS_ASSUME_NONNULL_END
