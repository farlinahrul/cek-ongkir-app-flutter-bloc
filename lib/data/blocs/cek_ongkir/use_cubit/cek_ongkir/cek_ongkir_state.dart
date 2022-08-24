import 'package:equatable/equatable.dart';
import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/models/city.dart';
import 'package:startercode_project/data/models/ongkir.dart';

abstract class CekOngkirState extends Equatable {
  const CekOngkirState();

  @override
  List<Object> get props => [];
}

class CekOngkirInitial extends CekOngkirState {}

class CekOngkirLoading extends CekOngkirState {}

class CekOngkirFetchCityLoading extends CekOngkirState {}

class CekOngkirPostOngkirLoading extends CekOngkirState {}

class CekOngkirSuccess extends CekOngkirState {}

class CekOngkirFetchCitySuccess extends CekOngkirState {
  final List<City> listCity;

  const CekOngkirFetchCitySuccess({required this.listCity});
}

class CekOngkirPostOngkirSuccess extends CekOngkirState {
  final Ongkir ongkir;

  const CekOngkirPostOngkirSuccess({required this.ongkir});
}

class CekOngkirFailure extends CekOngkirState {
  final ErrorType type;
  final String message;

  const CekOngkirFailure({this.type = ErrorType.general, this.message = ""});

  const CekOngkirFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const CekOngkirFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}

class CekOngkirFetchCityFailure extends CekOngkirState {
  final ErrorType type;
  final String message;

  const CekOngkirFetchCityFailure(
      {this.type = ErrorType.general, this.message = ""});

  const CekOngkirFetchCityFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const CekOngkirFetchCityFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}

class CekOngkirPostOngkirFailure extends CekOngkirState {
  final ErrorType type;
  final String message;

  const CekOngkirPostOngkirFailure(
      {this.type = ErrorType.general, this.message = ""});

  const CekOngkirPostOngkirFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const CekOngkirPostOngkirFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
