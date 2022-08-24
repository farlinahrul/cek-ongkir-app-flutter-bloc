import 'package:equatable/equatable.dart';
import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/models/city.dart';

abstract class FetchCityState extends Equatable {
  const FetchCityState();

  @override
  List<Object> get props => [];
}

class FetchCityInitial extends FetchCityState {}

class FetchCityLoading extends FetchCityState {}

class FetchCitySuccess extends FetchCityState {
  final List<City> listCity;

  const FetchCitySuccess({required this.listCity});
}

class FetchCityFailure extends FetchCityState {
  final ErrorType type;
  final String message;

  const FetchCityFailure({this.type = ErrorType.general, this.message = ""});

  const FetchCityFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const FetchCityFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
