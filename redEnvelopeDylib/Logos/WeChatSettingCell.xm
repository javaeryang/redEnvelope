#import <UIKit/UIKit.h>
#import "WeChatHeader.h"

//设置界面代码
@interface WCTableViewManager
- (long long)numberOfSectionsInTableView:(id)arg1;
@end

%hook WCTableViewManager
%new
- (void)textFieldDidChangeValue:(NSNotification *)notification {
    UITextField *sender = (UITextField *)[notification object];
    [HKDefaults setValue:sender.text forKey:sender.tag==2030?REDTIMEKEY:SPORTSTEPKEY];
    [HKDefaults synchronize];
}

%new
-(void)switchChang:(UISwitch *)switchView {
    [HKDefaults setBool:switchView.isOn forKey:switchView.tag==2020?REDSWITCHKEY:SPORTSWITCHKEY];
    [HKDefaults synchronize];
    [MSHookIvar <UITableView *>(self,"_tableView") reloadData];
}

//监听滚动
- (void)scrollViewWillBeginDragging:(id)arg1{
    %orig;
    //退出编辑
    [MSHookIvar <UITableView *>(self,"_tableView") endEditing:YES];
}

//返回高度
- (double)tableView:(UITableView *)tableView heightForRowAtIndexPath:(id)indexPath{
    //定位设置界面,并且是最后一组
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)]
       &&([indexPath section] >= [self numberOfSectionsInTableView:tableView] - 2)){
        return 44;
    }
    return %orig;
}

//返回每一个Cell
- (id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(id)indexPath{
    //定位设置界面,并且是最后一组
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)]
       &&([indexPath section] >= [self numberOfSectionsInTableView:tableView] - 2)){
        //创建Cell
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
        cell.backgroundColor = [UIColor whiteColor];
        BOOL isRed = [indexPath section] == [self numberOfSectionsInTableView:tableView]-2;
        
        if([indexPath row] == 0){//设置开关
            cell.textLabel.text = isRed?@"自动抢红包":@"修改微信步数";
            UISwitch * switchView = [[UISwitch alloc] init];
            switchView.tag = isRed?2020:2021;//设置tag
            switchView.on = [HKDefaults boolForKey:isRed?REDSWITCHKEY:SPORTSWITCHKEY];//记录开关状态
            //添加开关监听
            [switchView addTarget:self action:@selector(switchChang:) forControlEvents:(UIControlEventValueChanged)];
            cell.accessoryView = switchView;
        } else if([indexPath row] == 1){//设置时间
            cell.textLabel.text = isRed?@"等待的时间(秒)":@"运动步数";
            UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 5, 100, 30)];
            textField.tag = isRed?2030:2031;//设置tag
            //监听键盘输入
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChangeValue:) name:UITextFieldTextDidChangeNotification object:textField];
            textField.text = [HKDefaults valueForKey:isRed?REDTIMEKEY:SPORTSTEPKEY];
            textField.borderStyle = UITextBorderStyleRoundedRect;
            cell.accessoryView = textField;
        }
        
        return cell;
    }
    return %orig;
}

//每一组多少行
- (long long)tableView:(UITableView *)tableView numberOfRowsInSection:(long long)section{
    //定位设置界面,并且是最后一组
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)]){
        //增加两组 1设置自动抢红包 2设置修改微信步数
        if(section >= [self numberOfSectionsInTableView:tableView] - 2) {
            return 2;
        }
    }
    return %orig;
}

//多少组
- (long long)numberOfSectionsInTableView:(UITableView *)tableView{
    //定义到设置页面
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)]){
        //增加两组
        return %orig+2;
    }
    return %orig;
}

%end

@interface NewSettingViewController : UIViewController

@end

%hook NewSettingViewController

%new
-(void)keyboardWillShow:(NSNotification*)note{
    UIView * view = self.view;
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    view.frame = CGRectMake(0, -keyBoardRect.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height );
}

%new
-(void)keyboardWillhide:(NSNotification*)note{
    UIView * view = self.view;
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
}

- (void)viewDidLoad{
    //监听键盘弹出和消失
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillhide:) name:UIKeyboardWillHideNotification object:nil];
    %orig;
}
%end


%hook WCDeviceStepObject
- (int)m7StepCount {
    if([HKDefaults boolForKey:SPORTSWITCHKEY]) {
        int count = [[HKDefaults valueForKey:SPORTSTEPKEY] intValue];
        count = count>88888?88888:count;
        return count;
    }
    %orig;
}
%end
