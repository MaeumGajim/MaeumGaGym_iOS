import UIKit

import RxSwift

import Domain
import DSKit

public class PostureService {
    public func requestRecommandData() ->
    Single<[PostureRecommandModel]> {
        let postureRecommandData: [PostureRecommandModel] = [
            PostureRecommandModel(
                titleImage: DSKitAsset.Assets.postureArmLogo.image,
                titleText: "맨몸 운동",
                exerciseData: [
                    PostureRecommandExerciseModel(image: DSKitAsset.Assets.pushUp.image, name: "푸시업", part: "가슴"),
                    PostureRecommandExerciseModel(image: DSKitAsset.Assets.bodySplitSqt.image, name: "맨몸 스플릿 스쿼트", part: "하체"),
                    PostureRecommandExerciseModel(image: DSKitAsset.Assets.backExtension.image, name: "백 익스텐션", part: "등")
                ]
            ),
            PostureRecommandModel(
                titleImage: DSKitAsset.Assets.postureDumbelLogo.image,
                titleText: "기구 운동",
                exerciseData: [
                    PostureRecommandExerciseModel(image: DSKitAsset.Assets.deeps.image, name: "딥스", part: "가슴"),
                    PostureRecommandExerciseModel(image: DSKitAsset.Assets.benchPress.image, name: "벤치프레스", part: "가슴"),
                    PostureRecommandExerciseModel(image: DSKitAsset.Assets.runge.image, name: "런지", part: "팔")
                ]
            )
        ]
        return Single.just(postureRecommandData)
    }

    public func requestPartData(type: PosturePartType) ->
    Single<PosturePartModel> {
        switch type {
        case .chest:
            return requestChestData()
        case .back:
            return requestBackData()
        }
    }

    public func requestDetailData(type: PostureDetailType) -> Single<PostureDetailModel> {
        switch type {
        case .pushUp:
            return requestPushUpData()
        }
    }

    public init() {

    }
}

private extension PostureService {
    func requestChestData() ->
    Single<PosturePartModel> {
        return Single.just(
            PosturePartModel(
                exerciseType: [
                    PosturePartExerciseTypeModel(exerciseName: "맨몸"),
                    PosturePartExerciseTypeModel(exerciseName: "기구")
                ],
                allExerciseData: [
                    PosturePartExerciseModel(image: DSKitAsset.Assets.benchPress.image, name: "벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.deeps.image, name: "딥스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.inclineBenchPress.image, name: "인클라인 벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.pushUp.image, name: "푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.dumbelBenchPress.image, name: "덤벨 벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.hinduPushUp.image, name: "힌두 푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.weightDeeps.image, name: "중량 딥스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.archPushUp.image, name: "아치 푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.inclineDumbelBenchPress.image, name: "인클라인 덤벨 벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.closeGripPushUp.image, name: "클로즈그립 푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.dumbelSqzPress.image, name: "덤벨 스퀴즈 프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.clapPushUp.image, name: "클랩 푸시업"),
                ],
                bodyExerciseData: [
                    PosturePartExerciseModel(image: DSKitAsset.Assets.deeps.image, name: "딥스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.pushUp.image, name: "푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.hinduPushUp.image, name: "힌두 푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.archPushUp.image, name: "아치 푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.closeGripPushUp.image, name: "클로즈그립 푸시업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.clapPushUp.image, name: "클랩 푸시업"),
                ],
                machineExerciseData: [
                    PosturePartExerciseModel(image: DSKitAsset.Assets.benchPress.image, name: "벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.inclineBenchPress.image, name: "인클라인 벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.dumbelBenchPress.image, name: "덤벨 벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.weightDeeps.image, name: "중량 딥스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.inclineDumbelBenchPress.image, name: "인클라인 덤벨 벤치프레스"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.dumbelSqzPress.image, name: "덤벨 스퀴즈 프레스"),
                ]
            )
        )
    }

    func requestBackData() ->
    Single<PosturePartModel> {
        return Single.just(
            PosturePartModel(
                exerciseType: [
                    PosturePartExerciseTypeModel(exerciseName: "맨몸"),
                    PosturePartExerciseTypeModel(exerciseName: "기구")
                ],
                allExerciseData: [
                    PosturePartExerciseModel(image: DSKitAsset.Assets.goodMorningExercise.image, name: "굿모닝 엑서사이즈"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.pullUp.image, name: "풀업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.babelLow.image, name: "바벨 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.invertedLow.image, name: "인버티드 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.inclineDumbelLow.image, name: "인클라인 덤벨 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.hyperExtension.image, name: "하이퍼 익스텐션"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.dumbelLow.image, name: "덤벨 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.backExtension.image, name: "백 익스텐션"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.ratPullDown.image, name: "랫풀다운")
                ],
                bodyExerciseData: [
                    PosturePartExerciseModel(image: DSKitAsset.Assets.pullUp.image, name: "풀업"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.invertedLow.image, name: "인버티드 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.hyperExtension.image, name: "하이퍼 익스텐션"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.backExtension.image, name: "백 익스텐션")
                ],
                machineExerciseData: [
                    PosturePartExerciseModel(image: DSKitAsset.Assets.goodMorningExercise.image, name: "굿모닝 엑서사이즈"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.babelLow.image, name: "바벨 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.inclineDumbelLow.image, name: "인클라인 덤벨 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.dumbelLow.image, name: "덤벨 로우"),
                    PosturePartExerciseModel(image: DSKitAsset.Assets.ratPullDown.image, name: "랫풀다운"),
                ]
            )
        )
    }
}

private extension PostureService {
    func requestPushUpData() -> Single<PostureDetailModel>{
        return Single.just(
            PostureDetailModel(
                detailImage: DSKitAsset.Assets.pushUpDetail.image,
                titleTextData: PostureDetailTitleTextModel(englishName: "푸쉬업", koreanName: "팔굽혀펴기"),
                exerciseKindData: [PostureDetailExerciseKindModel(exerciseTag: "맨몸"),
                                   PostureDetailExerciseKindModel(exerciseTag: "가슴")],
                exerciseWayData:
                    PostureDetailInfoModel(titleText: "운동 방법", informationText: [
                        PostureDetailInfoTextModel(text: "양팔을 가슴 옆에 두고 바닥에 엎드립니다."),
                        PostureDetailInfoTextModel(text: "복근과 둔근에 힘을 준 상태로 팔꿈치를 피며\n올라옵니다."),
                        PostureDetailInfoTextModel(text: "천천히 팔꿈치를 굽히며 시작 자세로 돌아갑니다.")
                    ]),
                exerciseCautionData:
                    PostureDetailInfoModel(titleText: "주의 사항", informationText: [
                        PostureDetailInfoTextModel(text: "양팔을 가슴 옆에 두고 바닥에 엎드립니다."),
                        PostureDetailInfoTextModel(text: "복근과 둔근에 힘을 준 상태로 팔꿈치를 피며\n올라옵니다.")
                    ]),
                relatedPickleData:
                    PostureDetailPickleModel(titleText: "관련 피클", pickleImage: [
                        PostureDetailPickleImageModel(image: DSKitAsset.Assets.posturePickleTest1.image),
                        PostureDetailPickleImageModel(image: DSKitAsset.Assets.posturePickleTest2.image),
                        PostureDetailPickleImageModel(image: DSKitAsset.Assets.posturePickleTest3.image),
                        PostureDetailPickleImageModel(image: DSKitAsset.Assets.posturePickleTest4.image),
                    ])
            )
        )
    }
}