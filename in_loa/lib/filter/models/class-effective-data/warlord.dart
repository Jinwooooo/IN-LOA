import '../struct_class_data.dart';

final CharacterClass warlord = CharacterClass(
  name: "워로드",
  specializations: [
    Specialization(
      name: "고독한 기사",
      attributes: Attributes(
        engravings: ["원한", "슈퍼 차지", "저주받은 인형", "결투의 대가"],
        combatStats: ["치명", "신속"],
      ),
    ),
    Specialization(
      name: "전투 태세",
      attributes: Attributes(
        engravings: ["원한", "바리게이트", "안정된 상태", "저주받은 인형", "아드레날린"],
        combatStats: ["특화", "치명", "신속"],
      ),
    ),
  ],
);