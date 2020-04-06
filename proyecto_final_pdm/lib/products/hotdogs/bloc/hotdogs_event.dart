part of 'hotdogs_bloc.dart';

abstract class HotdogsEvent extends Equatable {
  const HotdogsEvent();
}

class GetDataEvent extends HotdogsEvent{
  @override
  List<Object> get props => [];
}

class RemoveDataEvent extends HotdogsEvent {
  final int index;

  RemoveDataEvent({
    @required this.index,
  });
  @override
  List<Object> get props => [index];
}

class SaveDataEvent extends HotdogsEvent {
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
