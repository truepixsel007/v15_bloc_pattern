

import 'package:equatable/equatable.dart';

abstract class MoiviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MoviesFetched extends MoiviesEvent {}