#import "TestUtility.h"
#import "Url.h"
#define ANOMALY_GREEN 0
#define ANOMALY_ORANGE 1
#define ANOMALY_RED 2

@implementation TestUtility


+ (void)showNotification:(NSString*)name {
    dispatch_async(dispatch_get_main_queue(), ^{
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = [NSDate date];
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.alertBody = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Notification.FinishedRunning", nil), [LocalizationUtility getNameForTest:name]];
        [localNotification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber] + 1];
        [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
    });
}

-(NSString*) getDate {
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    return [dateformatter stringFromDate:[NSDate date]];
}

+ (NSString*)getFileName:(Measurement*)measurement ext:(NSString*)ext{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/%@", documentsDirectory, [measurement getFile:ext]];
    return fileName;
}


-(int)checkAnomaly:(NSDictionary*)test_keys{
    /*
     null => anomal = 1,
     false => anomaly = 0,
     stringa (dns, tcp-ip, http-failure, http-diff) => anomaly = 2
     
     Return values:
     0 == OK,
     1 == orange,
     2 == red
     */
    id element = [test_keys objectForKey:@"blocking"];
    int anomaly = ANOMALY_GREEN;
    if ([test_keys objectForKey:@"blocking"] == [NSNull null]) {
        anomaly = ANOMALY_ORANGE;
    }
    else if (([element isKindOfClass:[NSString class]])) {
        anomaly = ANOMALY_RED;
    }
    return anomaly;
}

+ (NSDictionary*)getTests{
    return @{@"websites": @[@"web_connectivity"], @"instant_messaging": @[@"whatsapp", @"telegram", @"facebook_messenger"], @"middle_boxes": @[@"http_invalid_request_line", @"http_header_field_manipulation"], @"performance": @[@"ndt", @"dash"]};
}

+ (NSArray*)getTestTypes{
    return @[@"websites", @"instant_messaging", @"middle_boxes", @"performance"];
}

+ (NSString*)getCategoryForTest:(NSString*)testName{
    NSDictionary *tests = [self getTests];
    NSArray *keys = [tests allKeys];
    for (NSString *key in keys){
        NSArray *arr = [tests objectForKey:key];
        for (NSString *str in arr)
            if ([str isEqualToString:testName])
                return key;
    }
    return nil;
}

+ (NSArray*)getTestsArray{
    NSMutableArray *returnArr = [[NSMutableArray alloc] init];
    NSDictionary *tests = [self getTests];
    NSArray *keys = [tests allKeys];
    for (NSString *key in keys){
        NSArray *arr = [tests objectForKey:key];
        [returnArr addObjectsFromArray:arr];
    }
    return returnArr;
}

+ (UIColor*)getColorForTest:(NSString*)testName{
    if ([testName isEqualToString:@"websites"]){
        return [UIColor colorWithRGBHexString:color_indigo6 alpha:1.0f];
    }
    else if ([testName isEqualToString:@"performance"]){
        return [UIColor colorWithRGBHexString:color_fuchsia6 alpha:1.0f];
    }
    else if ([testName isEqualToString:@"middle_boxes"]){
        return [UIColor colorWithRGBHexString:color_violet8 alpha:1.0f];
    }
    else if ([testName isEqualToString:@"instant_messaging"]){
        return [UIColor colorWithRGBHexString:color_cyan6 alpha:1.0f];
    }
    return [UIColor colorWithRGBHexString:color_blue5 alpha:1.0f];
}

+ (UIColor*)getColorForTest:(NSString*)testName alpha:(CGFloat)alpha{
    if ([testName isEqualToString:@"websites"]){
        return [UIColor colorWithRGBHexString:color_indigo6 alpha:alpha];
    }
    else if ([testName isEqualToString:@"performance"]){
        return [UIColor colorWithRGBHexString:color_fuchsia6 alpha:alpha];
    }
    else if ([testName isEqualToString:@"middle_boxes"]){
        return [UIColor colorWithRGBHexString:color_violet8 alpha:alpha];
    }
    else if ([testName isEqualToString:@"instant_messaging"]){
        return [UIColor colorWithRGBHexString:color_cyan6 alpha:alpha];
    }
    return [UIColor colorWithRGBHexString:color_blue5 alpha:alpha];
}


+ (NSArray*)getUrlsTest{
    NSArray *urlsArray =  @[@{@"categoryCode":@"NEWS",@"url":@"http://www.foxnews.com",@"country_code":@"XX"},@{@"categoryCode":@"HOST",@"url":@"https://www.1and1.com/",@"country_code":@"XX"},@{@"categoryCode":@"ANON",@"url":@"http://www.anonymsurfen.com",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"http://www.bearshare.com",@"country_code":@"XX"},@{@"categoryCode":@"REL",@"url":@"http://www.themwl.org",@"country_code":@"XX"},@{@"categoryCode":@"REL",@"url":@"http://www.muhammadanism.com",@"country_code":@"XX"},@{@"categoryCode":@"GAME",@"url":@"http://www.counter-strike.net",@"country_code":@"XX"},@{@"categoryCode":@"GRP",@"url":@"http://craigslist.org",@"country_code":@"XX"},@{@"categoryCode":@"GRP",@"url":@"http://www.4chan.org",@"country_code":@"XX"},@{@"categoryCode":@"COMT",@"url":@"http://www.mywebcalls.com",@"country_code":@"XX"},@{@"categoryCode":@"HUMR",@"url":@"http://www.upci.org",@"country_code":@"XX"},@{@"categoryCode":@"HATE",@"url":@"http://godhatesfags.com",@"country_code":@"XX"},@{@"categoryCode":@"ANON",@"url":@"https://www.torproject.org",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"http://www.kcna.kp",@"country_code":@"XX"},@{@"categoryCode":@"HOST",@"url":@"http://www.livejournal.com",@"country_code":@"XX"},@{@"categoryCode":@"XED",@"url":@"https://www.plannedparenthood.org/",@"country_code":@"XX"},@{@"categoryCode":@"ALDR",@"url":@"http://marijuana.nl",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"http://www.download.com",@"country_code":@"XX"},@{@"categoryCode":@"GRP",@"url":@"https://mixi.jp/",@"country_code":@"XX"},@{@"categoryCode":@"PUBH",@"url":@"http://www.circumcision.org",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"https://cyber.harvard.edu/",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"http://www.irna.ir",@"country_code":@"XX"},@{@"categoryCode":@"REL",@"url":@"http://www.csmonitor.com",@"country_code":@"XX"},@{@"categoryCode":@"PORN",@"url":@"http://beeg.com",@"country_code":@"XX"},@{@"categoryCode":@"COMT",@"url":@"https://outlook.live.com/",@"country_code":@"XX"},@{@"categoryCode":@"HACK",@"url":@"http://www.securitytracker.com",@"country_code":@"XX"},@{@"categoryCode":@"COMT",@"url":@"http://voice.yahoo.jajah.com",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"http://www.utorrent.com",@"country_code":@"XX"},@{@"categoryCode":@"ECON",@"url":@"http://wkkf.org/",@"country_code":@"XX"},@{@"categoryCode":@"ECON",@"url":@"http://www.imf.org",@"country_code":@"XX"},@{@"categoryCode":@"HUMR",@"url":@"http://www.isiswomen.org",@"country_code":@"XX"},@{@"categoryCode":@"GOVT",@"url":@"http://www.opec.org",@"country_code":@"XX"},@{@"categoryCode":@"XED",@"url":@"http://sfsi.org/",@"country_code":@"XX"},@{@"categoryCode":@"ANON",@"url":@"https://psiphon.ca/",@"country_code":@"XX"},@{@"categoryCode":@"PORN",@"url":@"http://www.playboy.com",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"http://www.kazaa.com",@"country_code":@"XX"},@{@"categoryCode":@"LGBT",@"url":@"http://www.gayegypt.com",@"country_code":@"XX"},@{@"categoryCode":@"GRP",@"url":@"http://www.linkedin.com/",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"https://ipi.media/",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"https://www.netflix.com/",@"country_code":@"XX"},@{@"categoryCode":@"LGBT",@"url":@"http://transsexual.org",@"country_code":@"XX"},@{@"categoryCode":@"ANON",@"url":@"http://anonym.to",@"country_code":@"XX"},@{@"categoryCode":@"HOST",@"url":@"https://www.blogger.com/",@"country_code":@"XX"},@{@"categoryCode":@"HUMR",@"url":@"http://www.khrp.org",@"country_code":@"XX"},@{@"categoryCode":@"REL",@"url":@"https://www.om.org/",@"country_code":@"XX"},@{@"categoryCode":@"GRP",@"url":@"http://twitter.com/anonops",@"country_code":@"XX"},@{@"categoryCode":@"HUMR",@"url":@"http://www.ifj.org",@"country_code":@"XX"},@{@"categoryCode":@"HUMR",@"url":@"http://www.ucc.org",@"country_code":@"XX"},@{@"categoryCode":@"PUBH",@"url":@"http://www.implantinfo.com",@"country_code":@"XX"},@{@"categoryCode":@"ALDR",@"url":@"http://www.thegooddrugsguide.com",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"http://www.pravda.ru",@"country_code":@"XX"},@{@"categoryCode":@"REL",@"url":@"https://www.csidonline.org/",@"country_code":@"XX"},@{@"categoryCode":@"GAME",@"url":@"http://ddo.com/",@"country_code":@"XX"},@{@"categoryCode":@"ALDR",@"url":@"http://www.rxmarijuana.com",@"country_code":@"XX"},@{@"categoryCode":@"ANON",@"url":@"http://peacefire.org/",@"country_code":@"XX"},@{@"categoryCode":@"GOVT",@"url":@"http://www.dia.mil",@"country_code":@"XX"},@{@"categoryCode":@"GAME",@"url":@"http://company.wizards.com/",@"country_code":@"XX"},@{@"categoryCode":@"ANON",@"url":@"http://www.jmarshall.com/tools/cgiproxy/",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"http://www.dailymotion.com",@"country_code":@"XX"},@{@"categoryCode":@"GMB",@"url":@"http://www.spinpalace.com",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"https://twitpic.com/",@"country_code":@"XX"},@{@"categoryCode":@"SRCH",@"url":@"https://kids.yahoo.com",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"http://www.theepochtimes.com",@"country_code":@"XX"},@{@"categoryCode":@"HUMR",@"url":@"http://www.oneworld.net",@"country_code":@"XX"},@{@"categoryCode":@"REL",@"url":@"http://www.scientology.org",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"https://video.google.com",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"http://mp3.com/",@"country_code":@"XX"},@{@"categoryCode":@"COMT",@"url":@"http://www.foreignword.com",@"country_code":@"XX"},@{@"categoryCode":@"SRCH",@"url":@"http://www.google.com/search?q=lesbian",@"country_code":@"XX"},@{@"categoryCode":@"ALDR",@"url":@"http://www.marijuana.com",@"country_code":@"XX"},@{@"categoryCode":@"MILX",@"url":@"http://www.aleph.to",@"country_code":@"XX"},@{@"categoryCode":@"PROV",@"url":@"https://trashy.com/",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"http://www.fring.com",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"http://imesh.com/",@"country_code":@"XX"},@{@"categoryCode":@"ECON",@"url":@"http://care.org",@"country_code":@"XX"},@{@"categoryCode":@"GAME",@"url":@"http://www.ghostrecon.com",@"country_code":@"XX"},@{@"categoryCode":@"XED",@"url":@"http://www.sexandu.ca/",@"country_code":@"XX"},@{@"categoryCode":@"LGBT",@"url":@"http://www.grindr.com/",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"https://extratorrent.cc",@"country_code":@"XX"},@{@"categoryCode":@"HOST",@"url":@"http://www.webspawner.com",@"country_code":@"XX"},@{@"categoryCode":@"HOST",@"url":@"https://noblogs.org",@"country_code":@"XX"},@{@"categoryCode":@"PUBH",@"url":@"http://www.hivandhepatitis.com",@"country_code":@"XX"},@{@"categoryCode":@"ALDR",@"url":@"https://www.buydutchseeds.com/",@"country_code":@"XX"},@{@"categoryCode":@"MILX",@"url":@"http://www.arabrenewal.com",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"http://www.pandora.com",@"country_code":@"XX"},@{@"categoryCode":@"NEWS",@"url":@"http://www.arabtimes.com",@"country_code":@"XX"},@{@"categoryCode":@"SRCH",@"url":@"http://www.maven.co.il",@"country_code":@"XX"},@{@"categoryCode":@"ALDR",@"url":@"http://www.cannabis.info",@"country_code":@"XX"},@{@"categoryCode":@"PROV",@"url":@"http://blueskyswimwear.com",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"https://thepiratebay.se",@"country_code":@"XX"},@{@"categoryCode":@"POLR",@"url":@"http://www.piratpartiet.se",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"https://www.liveleak.com/",@"country_code":@"XX"},@{@"categoryCode":@"HUMR",@"url":@"http://www.actionaid.org",@"country_code":@"XX"},@{@"categoryCode":@"COMT",@"url":@"https://login.live.com/",@"country_code":@"XX"},@{@"categoryCode":@"MMED",@"url":@"http://delicious.com",@"country_code":@"XX"},@{@"categoryCode":@"PROV",@"url":@"https://www.3wishes.com/",@"country_code":@"XX"},@{@"categoryCode":@"ENV",@"url":@"https://www.epa.gov/",@"country_code":@"XX"},@{@"categoryCode":@"POLR",@"url":@"http://www.fondationdefrance.org/",@"country_code":@"XX"},@{@"categoryCode":@"REL",@"url":@"http://www.wiesenthal.com",@"country_code":@"XX"},@{@"categoryCode":@"FILE",@"url":@"https://addons.mozilla.org",@"country_code":@"XX"}];
    NSMutableArray *urls = [[NSMutableArray alloc] init];
    for (NSDictionary* current in urlsArray){
        Url *currentUrl = [[Url alloc] initWithUrl:[current objectForKey:@"url"] category:[current objectForKey:@"categoryCode"]];
        [urls addObject:currentUrl];
    }
    return urls;
}

+ (NSString*)getCategoryForUrl:(NSString*)url{
    for (Url* current in [self getUrlsTest]){
        if ([current.url isEqualToString:url])
            return current.category_code;
    }
    return @"";
}

+ (void)removeFile:(NSString*)fileName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    if (success) {
        NSLog(@"File %@ deleted", fileName);
    }
    else
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
    }
}

@end
