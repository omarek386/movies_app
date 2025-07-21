class AiPramsModel {
  final int isRainy;
  final int isSunny;
  final int isHot;
  final int isMild;
  final int isNormal;

  AiPramsModel({
    required this.isRainy,
    required this.isSunny,
    required this.isHot,
    required this.isMild,
    required this.isNormal,
  });

  Map<String, dynamic> toJson() {
    return {
      'isRainy': isRainy,
      'isSunny': isSunny,
      'isHot': isHot,
      'isMild': isMild,
      'isNormal': isNormal,
    };
  }

  List<int> toList() {
    return [
      isRainy,
      isSunny,
      isHot,
      isMild,
      isNormal,
    ];
  }
}
