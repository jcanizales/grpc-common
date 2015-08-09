#import "AuthSample.pbobjc.h"

#import <ProtoRPC/ProtoService.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>


@protocol AUTHTestService <NSObject>

#pragma mark UnaryCall(Request) returns (Response)

- (void)unaryCallWithRequest:(AUTHRequest *)request handler:(void(^)(AUTHResponse *response, NSError *error))handler;

- (ProtoRPC *)RPCToUnaryCallWithRequest:(AUTHRequest *)request handler:(void(^)(AUTHResponse *response, NSError *error))handler;


@end

// Basic service implementation, over gRPC, that only does marshalling and parsing.
@interface AUTHTestService : ProtoService<AUTHTestService>
- (instancetype)initWithHost:(NSString *)host NS_DESIGNATED_INITIALIZER;
@end
