//
//  CLViewController.m
//  HelpPrac
//
//  Created by Jiyeon Seo on 12. 9. 6..
//  Copyright (c) 2012년 Jiyeon Seo. All rights reserved.
//

#import "CLViewController.h"
#import "CLTableViewCell.h"
#import "CLDetailViewCell.h"
@interface CLViewController ()
{
    NSArray *titleArray;
}
@end

@implementation CLViewController
@synthesize listTableView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    nIndex = 0;
	nOnOffCell = FALSE;

    // 나중에 Sync 방식으로 array 가져와서 뿌려주기 지금은 그냥
    titleArray =[ [NSArray alloc]initWithObjects:@"title1",@"title2",@"title3",@"title4",@"title5",@"title6", nil ];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - listTableView Delegate 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"numberofrowsinSection");
    return [titleArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    //    cell = (CLViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // 나중에 커스터마이즈 된 셀로 바꾸기!
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    if(cell==nil){
//                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    cell.textLabel.text = [titleArray objectAtIndex:[indexPath row]];
/////////////////////////////////////////////////////////////////////
//      TVPCell *cell = (TVPCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if(cell==nil){
//        
//        NSArray *topLevelObject = [[NSBundle mainBundle]loadNibNamed:@"View" owner:nil options:nil];
//        for(id currentObject in topLevelObject){
//            if([currentObject isKindOfClass:[UITableViewCell class]]){
//                cell = (TVPCell *)currentObject;
//                break;
//            }
//        }
//        
//    }
    //유레카!
    if (nOnOffCell && nIndex == indexPath.row) {  //클릭되고 선택된 셀이라면 셀2로 바꾸고 테이블을 위치를 상단으로
        //도대체 이걸 왜 array로 받은겅?
		NSArray *topLevelObject = [[NSBundle mainBundle]loadNibNamed:@"CLDetailViewCell" owner:self options:nil];
//		cell = [tbCell objectAtIndex:0];
		for(id currentObject in topLevelObject){
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (CLDetailViewCell *)currentObject;
                break;
            }
        }
        

        
		UILabel *label;
		label = (UILabel *)[cell viewWithTag:1];
		label.text = @"BBBBBBBBBB";
		[listTableView setContentOffset:CGPointMake(0, nIndex * 45) animated:YES];
	} else {
		NSArray *topLevelObject = [[NSBundle mainBundle]loadNibNamed:@"CLTableViewCell" owner:self options:nil];
        
//        cell = [tbCell objectAtIndex:0];
        for(id currentObject in topLevelObject){
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (CLTableViewCell *)currentObject;
                break;
            }
        }
//		UILabel *label;
//		label = (UILabel *)[cell viewWithTag:1];
//		label.text = @"aa";
        
	}
    cell.titleLabel.text = [titleArray objectAtIndex:[indexPath row]];
//            cell.detailTextLabel.text =@"dmaklsdmkalsdmklasmdklas";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (nOnOffCell)
		nOnOffCell = FALSE;
	else
		nOnOffCell = TRUE;
	
	nIndex = indexPath.row;
	
	[listTableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (nOnOffCell) {
		if (nIndex == indexPath.row)
			return 100.0;
	} else {
		
	}
	return 45.0;
}



@end
