import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    String? status,
    int? statusCode,
    String? exception,
    LoginResultData? resultData,
  }) = _AppUser;

  // Use the standard fromJson and create a separate factory for parsing
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  // Create a separate factory method for handling string resultData
  factory AppUser.fromJsonWithStringResultData(Map<String, dynamic> json) {
    Map<String, dynamic> modifiedJson = Map<String, dynamic>.from(json);

    if (modifiedJson['resultData'] is String) {
      // Parse the JSON string in resultData
      final resultDataString = modifiedJson['resultData'] as String;
      if (resultDataString.isNotEmpty) {
        try {
          final parsedResultData =
              jsonDecode(resultDataString) as Map<String, dynamic>;

          // Convert the parsed data to match our model structure
          final convertedResultData = <String, dynamic>{
            'token': parsedResultData['Token'],
            'userDetails': parsedResultData['UserDetails'] != null
                ? {
                    'userName': parsedResultData['UserDetails']['UserName'],
                    'password': parsedResultData['UserDetails']['Password'],
                    'companyId': parsedResultData['UserDetails']['CompanyId'],
                  }
                : null,
          };

          modifiedJson['resultData'] = convertedResultData;
        } catch (e) {
          // If parsing fails, keep it as null
          modifiedJson['resultData'] = null;
        }
      }
    }

    return _$AppUserFromJson(modifiedJson);
  }
}

@freezed
class LoginResultData with _$LoginResultData {
  const LoginResultData._();

  const factory LoginResultData({
    String? token,
    UserDetails? userDetails,
  }) = _LoginResultData;

  factory LoginResultData.fromJson(Map<String, dynamic> json) =>
      _$LoginResultDataFromJson(json);
}

@freezed
class UserDetails with _$UserDetails {
  const UserDetails._();

  const factory UserDetails({
    String? userName,
    String? password,
    String? companyId,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}

// Extension methods for convenience
extension AppUserExtensions on AppUser {
  bool get isSuccess => status?.toLowerCase() == 'success';
  bool get hasToken => resultData?.token?.isNotEmpty ?? false;
  String? get token => resultData?.token;
  String? get userName => resultData?.userDetails?.userName;
  String? get companyId => resultData?.userDetails?.companyId;
}
