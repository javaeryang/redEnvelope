#line 1 "/Users/hibo/Documents/逆向/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"

#import"WeChatHeader.h"
#import "WeChatRedEnvelopParamQueue.h"


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

@class MMContext; @class MMMsgLogicManager; @class WCRedEnvelopesReceiveControlLogic; @class NSMutableDictionary; @class CContactMgr; @class WCBizUtil; @class CMessageMgr; @class WCRedEnvelopesReceiveHomeView; @class WCPayLogicMgr; @class WCRedEnvelopesLogicMgr; 
static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSMutableDictionary(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSMutableDictionary"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMContext(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMContext"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCBizUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCBizUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMMsgLogicManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMMsgLogicManager"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCPayLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCPayLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCRedEnvelopesLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCRedEnvelopesLogicMgr"); } return _klass; }
#line 5 "/Users/hibo/Documents/逆向/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"

static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveHomeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    NSLog(@"%s----->>>>>来了",__func__);
    
    NSDictionary * dict = MSHookIvar<NSDictionary *>(self,"m_dicBaseInfo");
    NSArray * arr = [dict allKeys];
    for(int i = 0;i < arr.count; i++){
        NSLog(@"%@ : %@",arr[i],[dict objectForKey:arr[i]]);
    }
    
    WCRedEnvelopesReceiveControlLogic * delegate = MSHookIvar<id>(self,"m_delegate");
    
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes(self, _cmd);
}



static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, HongBaoRes * arg1, id arg2) {
    NSLog(@"%s----->>>>>来了",__func__);
    
    
    NSLog(@"---->arg1:%@  arg2:%@",arg1,arg2);
    
    
    
    NSError * err;
    NSDictionary * responseDict = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"responseDict:%@",responseDict);
    
    if(arg1 != nil && arg2 != nil && arg1.cgiCmdid == 3 &&[responseDict[@"receiveStatus"] integerValue] == 0 ) {
        NSString * timingIdentifier = responseDict[@"timingIdentifier"];
        NSLog(@"timingIdentifier :%@",timingIdentifier);
        NSMutableDictionary * param = [[WeChatRedEnvelopParamQueue sharadQueue] dequeue];
        if(param && timingIdentifier && param[@"timingIdentifier"]){
            param[@"timingIdentifier"] = timingIdentifier;
            
            MMServiceCenter *serviceCenter = (MMServiceCenter *)[_logos_static_class_lookup$MMContext() currentContext];
            WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
            if(redEvenlopsLogicMgr) {
                NSString *redTime = [HKDefaults valueForKey:REDTIMEKEY];
                float _redTime = [redTime floatValue];
                _redTime = _redTime<=0?1.0:_redTime;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)_redTime * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    
                    [redEvenlopsLogicMgr OpenRedEnvelopesRequest:param];
                });
            }
        }
    } else {
        
    }
    _logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(self, _cmd, arg1, arg2);
}







static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * msgWrap) {
    NSLog(@"%s----->>>>>来了",__func__);
    NSLog(@"msgWrap:%@",msgWrap);
    
    if(MSHookIvar <unsigned int>(msgWrap,"m_uiMessageType") == 49 && [HKDefaults boolForKey:REDSWITCHKEY]) {
        NSLog(@"====准备抢红包====");
        NSString *c2cNativeUrl = [[msgWrap m_oWCPayInfoItem] m_c2cNativeUrl];
        NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
        NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
        NSDictionary* url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
        
        NSMutableDictionary* mutable_dic =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
        mutable_dic[@"msgType"] = @"1";
        mutable_dic[@"sendid"] = url_dic[@"sendid"];
        mutable_dic[@"channelid"] = url_dic[@"channelid"];
        if(msgWrap) {
            mutable_dic[@"nativeUrl"] = c2cNativeUrl;
        }
        
        NSString * nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
        if ( nsUsrName ){
            mutable_dic[@"sessionUserName"] = nsUsrName;
        }
        mutable_dic[@"timingIdentifier"] = @1;
    
        
        MMServiceCenter *serviceCenter = (MMServiceCenter*)[_logos_static_class_lookup$MMContext() currentContext];
        CContactMgr* contactMgr = [serviceCenter getService:[_logos_static_class_lookup$CContactMgr() class]];
        
        CContact * selfContact = [contactMgr getSelfContact];
        mutable_dic[@"nickName"] = [selfContact getContactDisplayName];
        mutable_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
        
        
        WeChatRedEnvelopParamQueue * paramQueue = [WeChatRedEnvelopParamQueue sharadQueue];
        [paramQueue enqueue:mutable_dic];
        
        
        BOOL (^isGroupReceiver)() = ^BOOL() {
            return [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
        };
        
        
        NSMutableDictionary* params =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
        params[@"agreeDuty"] = @"0";
        params[@"inWay"] = isGroupReceiver()?@"0":@"1";
        params[@"channelid"] = url_dic[@"channelid"];
        params[@"msgType"] = @"1";
        params[@"nativeUrl"] = c2cNativeUrl;
        params[@"sendId"] = url_dic[@"sendid"];
        
        WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        NSLog(@"====红包参数拼接====：%@",mutable_dic);
        
        [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    } else {
        NSLog(@"手动抢红包");
    }
    _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
}




static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"%s----->>>>>来了",__func__);
    
    
    
    
    
    
    
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self,"m_data");
    CMessageWrap *msgWrap = [m_data m_oSelectedMessageWrap];
    NSLog(@"msgWrap:%@",msgWrap);
    
    
    WCPayInfoItem * payInfoItem  = [msgWrap m_oWCPayInfoItem];
    NSString * c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString * c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary * url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];
    NSMutableDictionary * mutalbe_dic = [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    mutalbe_dic[@"msgType"] = @"1";
    mutalbe_dic[@"sendId"] = url_dic[@"sendid"];
    mutalbe_dic[@"channelId"] = url_dic[@"channelid"];
    
    
    MMServiceCenter * serviceCenter = (MMServiceCenter *)[_logos_static_class_lookup$MMContext() currentContext];
    Class ccmgr = [_logos_static_class_lookup$CContactMgr() class];
    CContactMgr * contactMgr = [serviceCenter getService:ccmgr];
    CContact * selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    mutalbe_dic[@"nickName"] = displayName;
    mutalbe_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    if (msgWrap) {
        mutalbe_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    
    MMMsgLogicManager * redEvenlopsLogicMgr = [serviceCenter getService:[_logos_static_class_lookup$MMMsgLogicManager() class]];
    WeixinContentLogicController * currentLogicContoller  = [redEvenlopsLogicMgr GetCurrentLogicController];
    if ( currentLogicContoller ) {
        CBaseContact * m_contact = [currentLogicContoller m_contact];
        if ( m_contact ) {
            CBaseContact * contact = [currentLogicContoller m_contact];
            NSString * nsUsrName = [contact m_nsUsrName];
            NSLog(@"nsUsrName:%@",nsUsrName);
            if (nsUsrName) {
                mutalbe_dic[@"sessionUserName"] = nsUsrName;
            }
        }
    }
    NSLog(@"%@",mutalbe_dic);
    
    
    _logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(self, _cmd);
    
    NSDictionary * m_dicBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString * timingIdentifier = m_dicBaseInfo[@"timingIdentifier"];
    if ([timingIdentifier length]) {
        mutalbe_dic[@"timingIdentifier"] = timingIdentifier;
    }
    NSLog(@"timingIdentifier:%@",timingIdentifier);
    
    WCPayLogicMgr * payLogic = [serviceCenter getService:[_logos_static_class_lookup$WCPayLogicMgr() class]];
    
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    NSLog(@"subScript:%@  subScript.class:%@",subScript,[subScript class]);
    
    
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^() {
        WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        [redEvenlopsLogicMgr OpenRedEnvelopesRequest:mutalbe_dic];
    } denyCallback:^() {
        
    }];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView = objc_getClass("WCRedEnvelopesReceiveHomeView"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView, @selector(OnOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$OnOpenRedEnvelopes);Class _logos_class$_ungrouped$WCRedEnvelopesLogicMgr = objc_getClass("WCRedEnvelopesLogicMgr"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesLogicMgr, @selector(OnWCToHongbaoCommonResponse:Request:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$);Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncAddMessage:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$);Class _logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic = objc_getClass("WCRedEnvelopesReceiveControlLogic"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic, @selector(WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes);} }
#line 207 "/Users/hibo/Documents/逆向/redEnvelope/redEnvelopeDylib/Logos/redEnvelopeDylib.xm"
