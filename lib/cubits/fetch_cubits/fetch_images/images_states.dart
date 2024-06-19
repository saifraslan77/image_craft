import '../../../models/images_models/fetch_images/item.dart';

abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<Item> items;

  ItemLoaded(this.items);
}

class ItemError extends ItemState {
  final String message;

  ItemError(this.message);
}

class LikeItemLoading extends ItemState {}

class LikeItemLoaded extends ItemState {

}

class LikeItemError extends ItemState {
  final String message;

  LikeItemError(this.message);
}