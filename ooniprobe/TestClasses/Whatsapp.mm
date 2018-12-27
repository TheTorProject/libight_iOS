#import "Whatsapp.h"

@implementation Whatsapp : MKNetworkTest

-(id) init {
    self = [super init];
    if (self) {
        self.name = @"whatsapp";
        self.settings.name = [LocalizationUtility getMKNameForTest:self.name];
        if ([SettingsUtility getSettingWithName:@"test_whatsapp_extensive"]){
            self.settings.options.all_endpoints = [NSNumber numberWithBool:YES];
        }
    }
    return self;
}

-(void) runTest {
    [super runTest];
}

-(void)onEntry:(JsonResult*)json obj:(Measurement*)measurement{
    /*
     if "whatsapp_endpoints_status", "whatsapp_web_status", "registration_server" are null => failed
     if "whatsapp_endpoints_status" or "whatsapp_web_status" or "registration_server_status" are "blocked" => anomalous
     */
    if (json.test_keys.whatsapp_endpoints_status == NULL || json.test_keys.whatsapp_web_status == NULL || json.test_keys.registration_server_status == NULL)
        [measurement setIs_failed:true];
    else
        measurement.is_anomaly = [json.test_keys.whatsapp_endpoints_status isEqualToString:@"blocked"] || [json.test_keys.whatsapp_web_status isEqualToString:@"blocked"] || [json.test_keys.registration_server_status isEqualToString:@"blocked"];
    [super onEntry:json obj:measurement];
}

-(int)getRuntime{
    return 10;
}

@end
