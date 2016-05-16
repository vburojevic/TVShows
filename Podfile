platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

def shared_pods

    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxOptional'
    pod 'RxBlocking'
    pod 'RxDataSources'
    pod 'Moya/RxSwift'
    pod 'Moya-JASON'
    pod 'Moya-JASON/RxSwift'
    pod 'NSObject+Rx'
    pod 'CoreStore'

end

def app_pods

    pod 'MBProgressHUD'
    pod 'Kingfisher'
    pod 'SnapKit'

end

def testing_pods

    pod 'Quick'
    pod 'Nimble'

end

target 'TVShows' do

    shared_pods
    app_pods

end

target 'TVShowsUnitTests' do
    
    shared_pods
    testing_pods
    
end
