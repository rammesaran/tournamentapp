// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      status: json['status'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      exception: json['exception'] as String?,
      resultData: json['resultData'] == null
          ? null
          : LoginResultData.fromJson(
              json['resultData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'exception': instance.exception,
      'resultData': instance.resultData,
    };

_$LoginResultDataImpl _$$LoginResultDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResultDataImpl(
      token: json['token'] as String?,
      userDetails: json['userDetails'] == null
          ? null
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResultDataImplToJson(
        _$LoginResultDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userDetails': instance.userDetails,
    };

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      companyId: json['companyId'] as String?,
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'companyId': instance.companyId,
    };
