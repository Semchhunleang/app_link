part of 'price_plan_cubit.dart';

abstract class PricePlanState extends Equatable {
  const PricePlanState();

  @override
  List<Object> get props => [];
}

class PricePlanInitial extends PricePlanState {}

class PricePlanLoading extends PricePlanState {}

class PricePlanLoaded extends PricePlanState {
  final List<PricePlan> pricePlan;

  const PricePlanLoaded(this.pricePlan);

  @override
  List<Object> get props => [pricePlan];
}

class PricePlanError extends PricePlanState {
  final String message;
  final int statusCode;

  const PricePlanError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}
