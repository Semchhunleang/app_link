import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/logic/cubit/agent/agent_cubit.dart';

class AgentStateModel extends Equatable {
  final String name;
  final String email;
  final String agentEmail;
  final String subject;
  final String message;
  final AgentState agentState;

  const AgentStateModel({
    this.name = '',
    this.email = '',
    this.agentEmail = '',
    this.subject = '',
    this.message = '',
    this.agentState = const AgentInitial(),
  });

  AgentStateModel copyWith({
    String? name,
    String? email,
    String? agentEmail,
    String? subject,
    String? message,
    AgentState? agentState,
  }) {
    return AgentStateModel(
      name: name ?? this.name,
      email: email ?? this.email,
      agentEmail: agentEmail ?? this.agentEmail,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      agentState: agentState ?? this.agentState,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'agent_email': agentEmail,
      'subject': subject,
      'message': message,
    };
  }

  AgentStateModel clear() {
    return const AgentStateModel(
      name: '',
      email: '',
      agentEmail: '',
      subject: '',
      message: '',
      agentState: AgentInitial(),
    );
  }

  factory AgentStateModel.fromMap(Map<String, dynamic> map) {
    return AgentStateModel(
      name: map['name'] as String,
      email: map['email'] as String,
      agentEmail: map['agentEmail'] as String,
      subject: map['subject'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentStateModel.fromJson(String source) =>
      AgentStateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      email,
      agentEmail,
      subject,
      message,
      agentState,
    ];
  }
}
