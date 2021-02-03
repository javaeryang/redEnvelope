#line 1 "/Users/hibo/Documents/逆向/redEnvelope/redEnvelopeDylib/Logos/WeChatSettingCell.xm"
#import <UIKit/UIKit.h>
#import "WeChatHeader.h"


@interface WCTableViewManager
- (long long)numberOfSectionsInTableView:(id)arg1;
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WCTableViewManager; @class WCDeviceStepObject; @class NewSettingViewController; 
static void _logos_method$_ungrouped$WCTableViewManager$textFieldDidChangeValue$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, NSNotification *); static void _logos_method$_ungrouped$WCTableViewManager$switchChang$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UISwitch *); static void (*_logos_orig$_ungrouped$WCTableViewManager$scrollViewWillBeginDragging$)(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$WCTableViewManager$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, id); static double (*_logos_orig$_ungrouped$WCTableViewManager$tableView$heightForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *, id); static double _logos_method$_ungrouped$WCTableViewManager$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *, id); static id (*_logos_orig$_ungrouped$WCTableViewManager$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *, id); static id _logos_method$_ungrouped$WCTableViewManager$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *, id); static long long (*_logos_orig$_ungrouped$WCTableViewManager$tableView$numberOfRowsInSection$)(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *, long long); static long long _logos_method$_ungrouped$WCTableViewManager$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *, long long); static long long (*_logos_orig$_ungrouped$WCTableViewManager$numberOfSectionsInTableView$)(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *); static long long _logos_method$_ungrouped$WCTableViewManager$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST, SEL, UITableView *); static void _logos_method$_ungrouped$NewSettingViewController$keyboardWillShow$(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST, SEL, NSNotification*); static void _logos_method$_ungrouped$NewSettingViewController$keyboardWillhide$(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST, SEL, NSNotification*); static void (*_logos_orig$_ungrouped$NewSettingViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NewSettingViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST, SEL); static int (*_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NewSettingViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NewSettingViewController"); } return _klass; }
#line 9 "/Users/hibo/Documents/逆向/redEnvelope/redEnvelopeDylib/Logos/WeChatSettingCell.xm"


static void _logos_method$_ungrouped$WCTableViewManager$textFieldDidChangeValue$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
    UITextField *sender = (UITextField *)[notification object];
    [HKDefaults setValue:sender.text forKey:sender.tag==2030?REDTIMEKEY:SPORTSTEPKEY];
    [HKDefaults synchronize];
}


static void _logos_method$_ungrouped$WCTableViewManager$switchChang$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UISwitch * switchView) {
    [HKDefaults setBool:switchView.isOn forKey:switchView.tag==2020?REDSWITCHKEY:SPORTSWITCHKEY];
    [HKDefaults synchronize];
    [MSHookIvar <UITableView *>(self,"_tableView") reloadData];
}


static void _logos_method$_ungrouped$WCTableViewManager$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    _logos_orig$_ungrouped$WCTableViewManager$scrollViewWillBeginDragging$(self, _cmd, arg1);
    
    [MSHookIvar <UITableView *>(self,"_tableView") endEditing:YES];
}


static double _logos_method$_ungrouped$WCTableViewManager$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, id indexPath){
    
    if([tableView.nextResponder.nextResponder isKindOfClass:_logos_static_class_lookup$NewSettingViewController()]
       &&([indexPath section] >= [self numberOfSectionsInTableView:tableView] - 2)){
        return 44;
    }
    return _logos_orig$_ungrouped$WCTableViewManager$tableView$heightForRowAtIndexPath$(self, _cmd, tableView, indexPath);
}


static id _logos_method$_ungrouped$WCTableViewManager$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, id indexPath){
    
    if([tableView.nextResponder.nextResponder isKindOfClass:_logos_static_class_lookup$NewSettingViewController()]
       &&([indexPath section] >= [self numberOfSectionsInTableView:tableView] - 2)){
        
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
        cell.backgroundColor = [UIColor whiteColor];
        BOOL isRed = [indexPath section] == [self numberOfSectionsInTableView:tableView]-2;
        
        if([indexPath row] == 0){
            cell.textLabel.text = isRed?@"自动抢红包":@"修改微信步数";
            UISwitch * switchView = [[UISwitch alloc] init];
            switchView.tag = isRed?2020:2021;
            switchView.on = [HKDefaults boolForKey:isRed?REDSWITCHKEY:SPORTSWITCHKEY];
            
            [switchView addTarget:self action:@selector(switchChang:) forControlEvents:(UIControlEventValueChanged)];
            cell.accessoryView = switchView;
        } else if([indexPath row] == 1){
            cell.textLabel.text = isRed?@"等待的时间(秒)":@"运动步数";
            UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 5, 100, 30)];
            textField.tag = isRed?2030:2031;
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChangeValue:) name:UITextFieldTextDidChangeNotification object:textField];
            textField.text = [HKDefaults valueForKey:isRed?REDTIMEKEY:SPORTSTEPKEY];
            textField.borderStyle = UITextBorderStyleRoundedRect;
            cell.accessoryView = textField;
        }
        
        return cell;
    }
    return _logos_orig$_ungrouped$WCTableViewManager$tableView$cellForRowAtIndexPath$(self, _cmd, tableView, indexPath);
}


static long long _logos_method$_ungrouped$WCTableViewManager$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView, long long section){
    
    if([tableView.nextResponder.nextResponder isKindOfClass:_logos_static_class_lookup$NewSettingViewController()]){
        
        if(section >= [self numberOfSectionsInTableView:tableView] - 2) {
            return 2;
        }
    }
    return _logos_orig$_ungrouped$WCTableViewManager$tableView$numberOfRowsInSection$(self, _cmd, tableView, section);
}


static long long _logos_method$_ungrouped$WCTableViewManager$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL WCTableViewManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * tableView){
    
    if([tableView.nextResponder.nextResponder isKindOfClass:_logos_static_class_lookup$NewSettingViewController()]){
        
        return _logos_orig$_ungrouped$WCTableViewManager$numberOfSectionsInTableView$(self, _cmd, tableView)+2;
    }
    return _logos_orig$_ungrouped$WCTableViewManager$numberOfSectionsInTableView$(self, _cmd, tableView);
}



@interface NewSettingViewController : UIViewController

@end




static void _logos_method$_ungrouped$NewSettingViewController$keyboardWillShow$(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification* note){
    UIView * view = self.view;
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    view.frame = CGRectMake(0, -keyBoardRect.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height );
}


static void _logos_method$_ungrouped$NewSettingViewController$keyboardWillhide$(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification* note){
    UIView * view = self.view;
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
}

static void _logos_method$_ungrouped$NewSettingViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillhide:) name:UIKeyboardWillHideNotification object:nil];
    _logos_orig$_ungrouped$NewSettingViewController$viewDidLoad(self, _cmd);
}




static int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if([HKDefaults boolForKey:SPORTSWITCHKEY]) {
        int count = [[HKDefaults valueForKey:SPORTSTEPKEY] intValue];
        count = count>88888?88888:count;
        return count;
    }
    _logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount(self, _cmd);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WCTableViewManager = objc_getClass("WCTableViewManager"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WCTableViewManager, @selector(textFieldDidChangeValue:), (IMP)&_logos_method$_ungrouped$WCTableViewManager$textFieldDidChangeValue$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UISwitch *), strlen(@encode(UISwitch *))); i += strlen(@encode(UISwitch *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WCTableViewManager, @selector(switchChang:), (IMP)&_logos_method$_ungrouped$WCTableViewManager$switchChang$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$WCTableViewManager, @selector(scrollViewWillBeginDragging:), (IMP)&_logos_method$_ungrouped$WCTableViewManager$scrollViewWillBeginDragging$, (IMP*)&_logos_orig$_ungrouped$WCTableViewManager$scrollViewWillBeginDragging$);MSHookMessageEx(_logos_class$_ungrouped$WCTableViewManager, @selector(tableView:heightForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$WCTableViewManager$tableView$heightForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$WCTableViewManager$tableView$heightForRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$WCTableViewManager, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$WCTableViewManager$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$WCTableViewManager$tableView$cellForRowAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$WCTableViewManager, @selector(tableView:numberOfRowsInSection:), (IMP)&_logos_method$_ungrouped$WCTableViewManager$tableView$numberOfRowsInSection$, (IMP*)&_logos_orig$_ungrouped$WCTableViewManager$tableView$numberOfRowsInSection$);MSHookMessageEx(_logos_class$_ungrouped$WCTableViewManager, @selector(numberOfSectionsInTableView:), (IMP)&_logos_method$_ungrouped$WCTableViewManager$numberOfSectionsInTableView$, (IMP*)&_logos_orig$_ungrouped$WCTableViewManager$numberOfSectionsInTableView$);Class _logos_class$_ungrouped$NewSettingViewController = objc_getClass("NewSettingViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification*), strlen(@encode(NSNotification*))); i += strlen(@encode(NSNotification*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$NewSettingViewController, @selector(keyboardWillShow:), (IMP)&_logos_method$_ungrouped$NewSettingViewController$keyboardWillShow$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification*), strlen(@encode(NSNotification*))); i += strlen(@encode(NSNotification*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$NewSettingViewController, @selector(keyboardWillhide:), (IMP)&_logos_method$_ungrouped$NewSettingViewController$keyboardWillhide$, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$NewSettingViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$NewSettingViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$NewSettingViewController$viewDidLoad);Class _logos_class$_ungrouped$WCDeviceStepObject = objc_getClass("WCDeviceStepObject"); MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(m7StepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$m7StepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount);} }
#line 138 "/Users/hibo/Documents/逆向/redEnvelope/redEnvelopeDylib/Logos/WeChatSettingCell.xm"
