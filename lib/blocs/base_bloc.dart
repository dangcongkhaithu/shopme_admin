import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopme_admin/core/common/exceptions.dart';

abstract class BaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializedState extends BaseState {}

class InProgressState extends BaseState {}

class SuccessState<T> extends BaseState {
  final T data;

  SuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends BaseState {
  final BaseException exception;

  ErrorState(this.exception);
}

abstract class BaseBloc extends Cubit<BaseState> {
  BaseBloc() : super(InitializedState());
}

mixin SingleBlocMixin on BaseBloc {
  void single<T>(
    Future<T> Function() action, {
    required BaseState Function(T data) onSuccess,
    VoidCallback? onError,
  }) async {
    emit(InProgressState());
    try {
      T data = await action();
      emit(onSuccess(data));
    } on BaseException catch (exception) {
      emit(ErrorState(exception));
      onError?.call();
    } catch (error) {
      emit(ErrorState(LocalException(message: error.toString())));
      onError?.call();
    }
  }

  Future<T?> callSafety<T>(Future<T> Function() callable) async {
    try {
      return await callable();
    } catch (_) {
      return null;
    }
  }
}
