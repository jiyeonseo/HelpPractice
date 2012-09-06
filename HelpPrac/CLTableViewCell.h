//
//  CLTableViewCell.h
//  HelpPrac
//
//  Created by Jiyeon Seo on 12. 9. 6..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLTableViewCell : UITableViewCell
{
    UILabel *titleLabel;
}

@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@end
