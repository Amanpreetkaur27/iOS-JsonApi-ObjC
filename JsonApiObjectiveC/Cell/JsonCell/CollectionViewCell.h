//
//  CollectionViewCell.h
//  JsonApiObjectiveC
//
//  Created by Android LDT on 09/03/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *mobileTextField;
@property (weak, nonatomic) IBOutlet UILabel *genderTextField;

@end

NS_ASSUME_NONNULL_END
