part of 'invite_earn_cubit.dart';

abstract class InviteEarnState extends Equatable {
  const InviteEarnState();

  @override
  List<Object> get props => [];
}

class InviteEarnInitial extends InviteEarnState {}
class InviteEarnLoading extends InviteEarnState{}
class InviteEarnLoaded extends InviteEarnState{}
