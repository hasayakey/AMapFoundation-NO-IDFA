Pod::Spec.new do |s|
  s.name              = 'AMapFoundation-NO-IDFA'
  s.version           = '1.4.0'
  s.summary           = 'AMapFoundationKit for iOS.'
  s.description       = <<-DESC
                         AMapSearch SDK for iOS by Autonavi.
                        DESC
  s.homepage          = 'http://lbs.amap.com/api/ios-sdk/summary/'
  s.license           = { :type => 'Copyright', :text => 'Copyright © 2014 AutoNavi. All Rights Reserved.\n' }
  s.author            = 'lbs.amap.com'
  s.social_media_url  = 'http://lbsbbs.amap.com/forum.php?mod=forumdisplay&fid=38'
  s.documentation_url = 'http://lbs.amap.com/api/ios-sdk/reference/'
  
  s.ios.deployment_target = '8.0'

  s.framework           = [ "SystemConfiguration", "CoreTelephony", "Security", "CoreLocation", "JavaScriptCore" ]
  s.libraries           = "z"
  s.xcconfig            = { "ARCHS": "$(ARCHS_STANDARD)", "LIBRARY_SEARCH_PATHS": "\"$(PODS_ROOT)/AMapFoundation-NO-IDFA/**\"" }

  s.source              = { :http => 'http://a.amap.com/lbs/static/zip/AMap_iOS_Foundation_NO_IDFA_Lib_V1.4.0.zip' }
  s.source_files        = 'AMapFoundationKit.framework/**/*.{h}'
  s.vendored_frameworks = 'AMapFoundationKit.framework'
  s.public_header_files = "AMapFoundationKit.framework/Headers/*.h"

  s.prepare_command     = <<-EOF
  mkdir AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules
  touch AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules/module.modulemap
  cat <<-EOF > AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules/module.modulemap
  framework module AMapFoundationKit {
      header "AMapFoundationVersion.h"
      header "AMapServices.h"
      header "AMapURLSearchConfig.h"
      header "AMapURLSearchType.h"
      header "AMapURLSearch.h"
      header "AMapUtility.h"
      export *
      link "z"
  }
  \EOF
  EOF

end