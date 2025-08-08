import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_player.freezed.dart';
part 'get_player.g.dart';

@freezed
class GetPlayer with _$GetPlayer {
  const GetPlayer._();

  factory GetPlayer({
    String? initial,
    String? fullName,
    String? shortName,
    String? email,
    String? mobileNo,
    String? address,
    String? about,
    String? createdBy,
  }) = _GetPlayer;

  factory GetPlayer.fromJson(Map<String, dynamic> json) =>
      _$GetPlayerFromJson(json);

  // Create a separate factory method for handling string resultData
  factory GetPlayer.fromJsonWithStringResultData(Map<String, dynamic> json) {
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
            'lstregplayer': parsedResultData['lstregplayer'] != null
                ? {
                    for (int i = 0;
                        i < parsedResultData["lstregplayer"].length;
                        i++)
                      {
                        'initial': parsedResultData["lstregplayer"][i]
                            ['Initial'],
                        'fullName': parsedResultData['FullName'],
                        'shortName': parsedResultData['ShortName'],
                        'email': parsedResultData['Email'],
                        'mobileNo': parsedResultData['MobileNo'],
                        'address': parsedResultData['Address'],
                        'about': parsedResultData['About'],
                        'createdBy': parsedResultData['CreatedBy'],
                      }
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

    return _$GetPlayerFromJson(modifiedJson);
  }
}
