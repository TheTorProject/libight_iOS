platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

target 'ooniprobe' do
    pod "libcrypto", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libcrypto.podspec"
    pod "libevent", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libevent.podspec"
    pod "libssl", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libssl.podspec"
    pod "libtor", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libtor.podspec"
    pod "libz", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libz.podspec"
    pod "oonimkall", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/oonimkall.podspec"
    pod 'Toast', '~> 4.0.0'
    pod 'MBProgressHUD'
    pod 'DZNEmptyDataSet'
    pod 'lottie-ios', '2.5.3'
    pod 'SharkORM', :git => 'https://github.com/sharksync/sharkorm', :tag => 'v2.3.67'
    pod 'MKDropdownMenu'
    pod 'RHMarkdownLabel'
    pod 'DateTools'
    pod 'OCMapper', '2.0' # 2.1 can't be used because it doesnt support optional camel case conversion. see https://github.com/aryaxt/OCMapper/issues/62
    pod 'Countly'
    pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => '6.1.4'
    pod 'Harpy'
end

target 'OONIProbeUnitTests' do
    pod "libcrypto", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libcrypto.podspec"
    pod "libevent", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libevent.podspec"
    pod "libssl", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libssl.podspec"
    pod "libtor", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libtor.podspec"
    pod "libz", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/libz.podspec"
    pod "oonimkall", :podspec => "https://github.com/ooni/probe-cli/releases/download/v3.19.0/oonimkall.podspec"
    pod 'SharkORM', :git => 'https://github.com/sharksync/sharkorm', :tag => 'v2.3.67'
    pod 'OCMapper', '2.0'
end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
            end
        end
    end
end
