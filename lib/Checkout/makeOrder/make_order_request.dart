class MakeOrderRequest {
  final String userId;
  final List<int> itemIds;

  MakeOrderRequest({required this.userId, required this.itemIds});

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "itemIds": itemIds,
  };

  factory MakeOrderRequest.fromJson(Map<String, dynamic> json) {
    return MakeOrderRequest(
      userId: json['userId'],
      itemIds: List<int>.from(json['itemIds']),
    );
  }
}