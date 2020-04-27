part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();
}

class GetDataEvent extends PhotoEvent {
  @override
  List<Object> get props => [];
}

class RemoveDataEvent extends PhotoEvent {
  final int index;

  RemoveDataEvent({
    @required this.index,
  });
  @override
  List<Object> get props => [index];
}

class SaveDataEvent extends PhotoEvent {
  final String nombre;
  final String descripcion;
  final String imageUrl;

  SaveDataEvent({
    @required this.nombre,
    @required this.descripcion,
    @required this.imageUrl,
  });

  @override
  List<Object> get props => [nombre, descripcion, imageUrl];
}
