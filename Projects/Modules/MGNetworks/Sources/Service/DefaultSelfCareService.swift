import UIKit

import RxSwift
import RxCocoa

import RxMoya
import Moya

import DSKit
import Domain
import TokenManager

import MGLogger

public protocol SelfCareService {
    func getMyRoutineData() -> Single<SelfCareMyRoutineModel>
    func getMyRoutineDetailData() -> Single<SelfCareMyRoutineDetailModel>
    func getMyRoutineEditData() -> Single<SelfCareMyRoutineEditModel>
    func getTargetMainData() -> Single<SelfCareTargetMainModel>
    func getTargetDetailData() -> Single<SelfCareTargetDetailModel>
    func getProfileData(accessToken: String, userName: String) -> Single<SelfCareDetailProfileModel>
    func requestProfileModify(accessToken: String, nickName: String, height: Double, weight: Double, gender: String) -> Single<Response>
}

public class DefaultSelfCareService: NSObject {
//    let kakaoProvider = MoyaProvider<KakaoAPI>()
//    let googleProvider = MoyaProvider<GoogleAPI>()
//    let appleProvider = MoyaProvider<AppleAPI>()
//    let authProvider = MoyaProvider<AuthAPI>()
    let provider = MoyaProvider<ProfileAPI>()
    
}

extension DefaultSelfCareService: SelfCareService {

    public func getMyRoutineData() ->
    Single<SelfCareMyRoutineModel> {
        return Single.just(
            SelfCareMyRoutineModel(
                titleTextData:
                    SelfCareMyRoutineTextModel(
                        titleText: "내 루틴",
                        infoText: "나만의 루틴을 구성하여\n규칙적인 운동을 해보세요."
                    ),
                myRoutineData: [
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "평일 루틴",
                        usingState: false,
                        sharingState: false
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                    SelfCareRoutineModel(
                        routineNameText: "주말 루틴",
                        usingState: true,
                        sharingState: true
                    ),
                ]
            )
        )
    }

    public func getMyRoutineDetailData() -> Single<SelfCareMyRoutineDetailModel> {
        return Single.just(
            SelfCareMyRoutineDetailModel(
                routineTitleData: SelfCareRoutineModel(
                    routineNameText: "주말 루틴",
                    usingState: true,
                    sharingState: true),
                routinesData: [
                    SelfCareMyRoutineDetailExerciseModel(
                        exericseImage: DSKitAsset.Assets.pushUp.image,
                        exerciseTitle: "푸쉬업",
                        exerciseCount: 10,
                        exerciseSet: 4
                    ),
                    SelfCareMyRoutineDetailExerciseModel(
                        exericseImage: DSKitAsset.Assets.ratPullDown.image,
                        exerciseTitle: "랫풀다운",
                        exerciseCount: 20,
                        exerciseSet: 4
                    ),
                    SelfCareMyRoutineDetailExerciseModel(
                        exericseImage: DSKitAsset.Assets.babelBackSqt.image,
                        exerciseTitle: "바밸 백스쿼트",
                        exerciseCount: 20,
                        exerciseSet: 3
                    ),
                ]
            )
        )
    }

    public func getMyRoutineEditData() -> Single<SelfCareMyRoutineEditModel> {
        return Single.just(
            SelfCareMyRoutineEditModel(
                textFieldData: MyRoutineEditTextFieldModel(
                    textFieldTitle: "제목", 
                    textFieldText: "주말 루틴",
                    textFieldPlaceholder: "제목을 입력해주세요."), date: [],
                exerciseData: [
                    MyRoutineEditExerciseModel(
                        exerciseImage: DSKitAsset.Assets.pushUp.image,
                        exerciseName: "푸쉬업",
                        textFieldData: [
                            MyRouinteEditExerciseTextFieldModel(
                                textFieldTitle: "횟수",
                                exerciseCount: 10),
                            MyRouinteEditExerciseTextFieldModel(
                                textFieldTitle: "세트",
                                exerciseCount: 4)
                        ]
                    ),
                    MyRoutineEditExerciseModel(
                        exerciseImage: DSKitAsset.Assets.deeps.image,
                        exerciseName: "딥스",
                        textFieldData: [
                            MyRouinteEditExerciseTextFieldModel(
                                textFieldTitle: "횟수",
                                exerciseCount: 10),
                            MyRouinteEditExerciseTextFieldModel(
                                textFieldTitle: "세트",
                                exerciseCount: 3)
                        ]
                    ),
                    MyRoutineEditExerciseModel(
                        exerciseImage: DSKitAsset.Assets.jumpSqt.image,
                        exerciseName: "점프 스쿼트",
                        textFieldData: [
                            MyRouinteEditExerciseTextFieldModel(
                                textFieldTitle: "횟수",
                                exerciseCount: 20),
                            MyRouinteEditExerciseTextFieldModel(
                                textFieldTitle: "세트",
                                exerciseCount: 3)
                        ]
                    )
                ]
            )
        )
    }

    public func getTargetMainData() -> Single<SelfCareTargetMainModel> {
        return Single.just(SelfCareTargetMainModel(
            titleTextData:
                TargetTitleTextModel(
                    titleText: "목표",
                    infoText: "나만의 목표를 세워보세요."
                ),
            targetData: [
                TargetContentModel(
                    targetTitle: "디자인 완성하기",
                    targetStartData: "12월 17일",
                    targetEndData: "12월 18일"),
                TargetContentModel(
                    targetTitle: "공부하기",
                    targetStartData: "12월 17일",
                    targetEndData: "2024년 01월 28일"),
                ]
            )
        )
    }

    public func getTargetDetailData() -> Single<SelfCareTargetDetailModel> {
        return Single.just(SelfCareTargetDetailModel(titleTextData: "공부하기",
                                                     startDateData: "12월 26일 (화) 오전 8:00",
                                                     endDateData: "2024년 01월 01일 (월) 오후 9:00",
                                                     textData: "새해가 다가오기 전까지 열심히 공부하자.\n한 해의 끝도 공부와 함께.")
        )
    }
    
    public func getProfileData(accessToken: String, userName: String) -> Single<SelfCareDetailProfileModel> {
//        return provider.rx.request(.profileCheck(accessToken: accessToken, userName: userName))
        return .create(subscribe: { [weak self] _ in
            self?.provider.rx.request(.profileCheck(accessToken: accessToken, userName: userName))
            return Disposables.create { }
        })
    }
    
    public func requestProfileModify(accessToken: String, nickName: String, height: Double, weight: Double, gender: String) -> Single<Response> {
        return provider.rx.request(.profileInfoModify(accessToken: accessToken, nickName: nickName, height: height, weight: weight, gender: gender))
    }
    
}
