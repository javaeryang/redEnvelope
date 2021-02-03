
#import"WeChatHeader.h"
#import "WeChatRedEnvelopParamQueue.h"

%hook WCRedEnvelopesReceiveHomeView
- (void)OnOpenRedEnvelopes{
    NSLog(@"%s----->>>>>来了",__func__);
    //MSHookIvar 通过class_getInstanceVariable获取成员变量
    NSDictionary * dict = MSHookIvar<NSDictionary *>(self,"m_dicBaseInfo");
    NSArray * arr = [dict allKeys];
    for(int i = 0;i < arr.count; i++){
        NSLog(@"%@ : %@",arr[i],[dict objectForKey:arr[i]]);
    }
    //拿到代理
    WCRedEnvelopesReceiveControlLogic * delegate = MSHookIvar<id>(self,"m_delegate");
    
    %orig;
}
%end

%hook WCRedEnvelopesLogicMgr
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2 {
    NSLog(@"%s----->>>>>来了",__func__);
    //------调试拦截------
    //%orig;
    NSLog(@"---->arg1:%@  arg2:%@",arg1,arg2);
    //return;
    //------调试拦截------
    
    NSError * err;
    NSDictionary * responseDict = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"responseDict:%@",responseDict);
    //是否为未抢过的红包
    if(arg1 != nil && arg2 != nil && arg1.cgiCmdid == 3 &&[responseDict[@"receiveStatus"] integerValue] == 0 ) {
        NSString * timingIdentifier = responseDict[@"timingIdentifier"];
        NSLog(@"timingIdentifier :%@",timingIdentifier);
        NSMutableDictionary * param = [[WeChatRedEnvelopParamQueue sharadQueue] dequeue];
        if(param && timingIdentifier && param[@"timingIdentifier"]){
            param[@"timingIdentifier"] = timingIdentifier;
            //开始抢红包
            MMServiceCenter *serviceCenter = (MMServiceCenter *)[%c(MMContext) currentContext];
            WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
            if(redEvenlopsLogicMgr) {
                NSString *redTime = [HKDefaults valueForKey:REDTIMEKEY];
                float _redTime = [redTime floatValue];
                _redTime = _redTime<=0?1.0:_redTime;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)_redTime * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    //打开红包
                    [redEvenlopsLogicMgr OpenRedEnvelopesRequest:param];
                });
            }
        }
    } else {
        
    }
    %orig;
}

%end




%hook CMessageMgr
- (void)onNewSyncAddMessage:(CMessageWrap *)msgWrap {
    NSLog(@"%s----->>>>>来了",__func__);
    NSLog(@"msgWrap:%@",msgWrap);
    //将WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes逻辑移植过来
    if(MSHookIvar <unsigned int>(msgWrap,"m_uiMessageType") == 49 && [HKDefaults boolForKey:REDSWITCHKEY]) {
        NSLog(@"====准备抢红包====");
        NSString *c2cNativeUrl = [[msgWrap m_oWCPayInfoItem] m_c2cNativeUrl];
        NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
        NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
        NSDictionary* url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
        //抢红包参数拼接
        NSMutableDictionary* mutable_dic =  [%c(NSMutableDictionary) dictionary];
        mutable_dic[@"msgType"] = @"1";
        mutable_dic[@"sendid"] = url_dic[@"sendid"];
        mutable_dic[@"channelid"] = url_dic[@"channelid"];
        if(msgWrap) {
            mutable_dic[@"nativeUrl"] = c2cNativeUrl;
        }
        //拼接发送方用户名
        NSString * nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
        if ( nsUsrName ){
            mutable_dic[@"sessionUserName"] = nsUsrName;
        }
        mutable_dic[@"timingIdentifier"] = @1;
    
        //接下来
        MMServiceCenter *serviceCenter = (MMServiceCenter*)[%c(MMContext) currentContext];
        CContactMgr* contactMgr = [serviceCenter getService:[%c(CContactMgr) class]];
        
        CContact * selfContact = [contactMgr getSelfContact];
        mutable_dic[@"nickName"] = [selfContact getContactDisplayName];
        mutable_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
        
        //将参数保存
        WeChatRedEnvelopParamQueue * paramQueue = [WeChatRedEnvelopParamQueue sharadQueue];
        [paramQueue enqueue:mutable_dic];
        
        //判断是个人红包还是群红包
        BOOL (^isGroupReceiver)() = ^BOOL() {
            return [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
        };
        
        //拼接参数
        NSMutableDictionary* params =  [%c(NSMutableDictionary) dictionary];
        params[@"agreeDuty"] = @"0";
        params[@"inWay"] = isGroupReceiver()?@"0":@"1";//个人红包、群红包
        params[@"channelid"] = url_dic[@"channelid"];
        params[@"msgType"] = @"1";
        params[@"nativeUrl"] = c2cNativeUrl;
        params[@"sendId"] = url_dic[@"sendid"];
        
        WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
        NSLog(@"====红包参数拼接====：%@",mutable_dic);
        //拆开红包
        [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    } else {
        NSLog(@"手动抢红包");
    }
    %orig;
}

%end

%hook WCRedEnvelopesReceiveControlLogic
-(void)WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes {
    NSLog(@"%s----->>>>>来了",__func__);
    //------调试拦截------
    //%orig;
    //return;
    //------调试拦截------
    
    
    //伪代码
    WCRedEnvelopesControlData *m_data = MSHookIvar<WCRedEnvelopesControlData *>(self,"m_data");
    CMessageWrap *msgWrap = [m_data m_oSelectedMessageWrap];
    NSLog(@"msgWrap:%@",msgWrap);
    
    //1
    WCPayInfoItem * payInfoItem  = [msgWrap m_oWCPayInfoItem];
    NSString * c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString * c2cNativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    NSDictionary * url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:c2cNativeUrl2 separator:@"&"];
    NSMutableDictionary * mutalbe_dic = [%c(NSMutableDictionary) dictionary];
    mutalbe_dic[@"msgType"] = @"1";
    mutalbe_dic[@"sendId"] = url_dic[@"sendid"];
    mutalbe_dic[@"channelId"] = url_dic[@"channelid"];
    
    //2
    MMServiceCenter * serviceCenter = (MMServiceCenter *)[%c(MMContext) currentContext];
    Class ccmgr = [%c(CContactMgr) class];
    CContactMgr * contactMgr = [serviceCenter getService:ccmgr];
    CContact * selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    mutalbe_dic[@"nickName"] = displayName;
    mutalbe_dic[@"headImg"] = [selfContact m_nsHeadImgUrl];
    if (msgWrap) {
        mutalbe_dic[@"nativeUrl"] = c2cNativeUrl;
    }
    
    //3
    MMMsgLogicManager * redEvenlopsLogicMgr = [serviceCenter getService:[%c(MMMsgLogicManager) class]];
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
    
    //执行原始手动调用拆红包逻辑
    %orig;
    
    NSDictionary * m_dicBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString * timingIdentifier = m_dicBaseInfo[@"timingIdentifier"];
    if ([timingIdentifier length]) {
        mutalbe_dic[@"timingIdentifier"] = timingIdentifier;
    }
    NSLog(@"timingIdentifier:%@",timingIdentifier);
    
    WCPayLogicMgr * payLogic = [serviceCenter getService:[%c(WCPayLogicMgr) class]];
    
    [payLogic setRealnameReportScene:(unsigned int)1003];
    id subScript = [m_dicBaseInfo objectForKeyedSubscript:@"agree_duty"];
    NSLog(@"subScript:%@  subScript.class:%@",subScript,[subScript class]);
    
    //真正打开红包的请求
    [payLogic checkHongbaoOpenLicense:subScript acceptCallback:^() {
        WCRedEnvelopesLogicMgr * redEvenlopsLogicMgr  = [serviceCenter getService:[%c(WCRedEnvelopesLogicMgr) class]];
        [redEvenlopsLogicMgr OpenRedEnvelopesRequest:mutalbe_dic];
    } denyCallback:^() {
        
    }];
}

%end
