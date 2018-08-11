#import <Foundation/Foundation.h>
#import "Tampering.h"

@interface Simple
@property (nonatomic, strong) NSNumber *upload;
@property (nonatomic, strong) NSNumber *download;
@property (nonatomic, strong) NSNumber *ping;
@end

//TODO check these formats
@interface Advanced
@property (nonatomic, strong) NSString *packet_loss;
@property (nonatomic, strong) NSString *out_of_order;
@property (nonatomic, strong) NSString *avg_rtt;
@property (nonatomic, strong) NSString *max_rtt;
@property (nonatomic, strong) NSString *mss;
@property (nonatomic, strong) NSString *timeouts;
@end

@interface TestKeys : NSObject
@property (nonatomic, strong) NSString *blocking;
@property (nonatomic, strong) NSString *accessible;
@property (nonatomic, strong) NSArray *sent;
@property (nonatomic, strong) NSArray *received;
@property (nonatomic, strong) NSString *failure;
@property (nonatomic, strong) NSString *header_field_name;
@property (nonatomic, strong) NSString *header_field_number;
@property (nonatomic, strong) NSString *header_field_value;
@property (nonatomic, strong) NSString *header_name_capitalization;
@property (nonatomic, strong) NSString *request_line_capitalization;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *server_address;
@property (nonatomic, strong) NSString *server_name;
@property (nonatomic, strong) NSString *server_country;
@property (nonatomic, strong) NSNumber *median_bitrate;
@property (nonatomic, strong) NSNumber *min_playout_delay;
@property (nonatomic, strong) NSString *whatsapp_endpoints_status;
@property (nonatomic, strong) NSString *whatsapp_web_status;
@property (nonatomic, strong) NSString *registration_server_status;
@property (nonatomic, strong) NSNumber *facebook_tcp_blocking;
@property (nonatomic, strong) NSNumber *facebook_dns_blocking;
@property (nonatomic, strong) NSNumber *telegram_http_blocking;
@property (nonatomic, strong) NSNumber *telegram_tcp_blocking;
@property (nonatomic, strong) NSString *telegram_web_status;
@property (nonatomic, strong) Simple *simple;
@property (nonatomic, strong) Advanced *advanced;
@property (nonatomic, strong) Tampering *tampering;

- (NSString*)getJsonStr;

//WEB
- (NSString*)getWebsiteBlocking:(NSString*)input;
    
//WHATSAPP
- (NSString*)getWhatsappEndpointStatus;
- (NSString*)getWhatsappWebStatus;
- (NSString*)getWhatsappRegistrationStatus;
    
//TELEGRAM
- (NSString*)getTelegramEndpointStatus;
- (NSString*)getTelegramWebStatus;
- (NSString*)getTelegramBlocking;
    
//FACEBOOK
- (NSString*)getFacebookMessengerDns;
- (NSString*)getFacebookMessengerTcp;
- (NSString*)getFacebookMessengerBlocking;
    
//NDT
- (NSString*)getUpload;
- (NSString*)getUploadUnit;
- (NSString*)getUploadWithUnit;
- (NSString*)getDownload;
- (NSString*)getDownloadUnit;
- (NSString*)getDownloadWithUnit;
- (NSString*)getPing;
    
- (NSString*)getServer;
- (NSString*)getPacketLoss;
- (NSString*)getOutOfOrder;
- (NSString*)getAveragePing;
- (NSString*)getMaxPing;
- (NSString*)getMSS;
- (NSString*)getTimeouts;
    
//DASH
- (NSString*)getVideoQuality:(BOOL)extended;
- (NSString*)getMedianBitrate;
- (NSString*)getMedianBitrateUnit;
- (NSString*)getPlayoutDelay;
    
//HIRL
//- (NSArray*)getSent;
//- (NSArray*)getReceived;
@end

