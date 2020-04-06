part of 'snacks_bloc.dart';

abstract class SnacksEvent extends Equatable {
  const SnacksEvent();
}

class GetDataEvent extends SnacksEvent {
  @override
  List<Object> get props => [];
}

class RemoveDataEvent extends SnacksEvent {
  final int index;

  RemoveDataEvent({
    @required this.index,
  });
  @override
  List<Object> get props => [index];
}

class SaveDataEvent extends SnacksEvent {
  final String productTitle;
  final String productDescription;
  final String productImage;
  final int productPrice;
  final int productAmount;
  final bool available;

  SaveDataEvent({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productPrice,
    @required this.productAmount,
    @required this.available,
  });

  @override
  List<Object> get props => [productTitle, productDescription, productImage, productPrice, productAmount, available];
}
