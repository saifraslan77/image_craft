
import 'item.dart';

class FetchImagesResponse {
  FetchImagesResponse({
    required this.items,
  });

  final List<Item> items;

  factory FetchImagesResponse.fromJson(Map<String, dynamic> json){
    return FetchImagesResponse(
      items: json["data"] == null ? [] : List<Item>.from(json["data"]!.map((x) => Item.fromJson(x))),
    );
  }

}


