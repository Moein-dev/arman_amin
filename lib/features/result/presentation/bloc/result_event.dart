part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {}

class GetUsersEvent extends ResultEvent {
  @override
  List<Object?> get props => [];
}

class GetUserEventInitial extends ResultEvent{
  @override
  List<Object?> get props => [];

}