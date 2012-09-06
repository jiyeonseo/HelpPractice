//
//  CLViewController.h
//  HelpPrac
//
//  Created by Jiyeon Seo on 12. 9. 6..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLViewController : UIViewController<UITableViewDelegate>
{
    NSInteger nIndex;     // 클릭한 indexpath.row 대입
	BOOL nOnOffCell;    //셀이 클릭되면 TRUE
	

    UITableView *listTableView;
}
@property (nonatomic,strong) IBOutlet UITableView *listTableView;

@end
