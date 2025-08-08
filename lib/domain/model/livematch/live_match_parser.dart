import 'dart:convert';
import 'live_match_response.dart';

class LiveMatchParser {
  /// Parses the API response JSON string and returns a LiveMatchResponse object
  static LiveMatchResponse parseApiResponse(String jsonString) {
    try {
      final Map<String, dynamic> responseData = json.decode(jsonString);

      // Check if the response has the expected structure
      if (responseData.containsKey('status') &&
          responseData.containsKey('resultData')) {
        // Parse the resultData which contains the actual tournament data
        final String resultDataString = responseData['resultData'];
        final Map<String, dynamic> resultData = json.decode(resultDataString);

        return LiveMatchResponse.fromJson(resultData);
      } else {
        // If the JSON is already in the expected format
        return LiveMatchResponse.fromJson(responseData);
      }
    } catch (e) {
      // Return empty response if parsing fails
      return LiveMatchResponse(lstpairset: [], lstmatchscdl: []);
    }
  }

  /// Example usage with the provided JSON response
  // static LiveMatchResponse getExampleData() {
  //   const String exampleJson = '''
  //   {
  //     "status": "Success",
  //     "statusCode": 200,
  //     "exception": null,
  //     "resultData": "{\\"lstpairset\\":[{\\"PairId\\":1164,\\"TournmentId\\":2028,\\"Team\\":\\"Team 1\\",\\"Pair\\":\\"Selvam - Pandi\\",\\"PairDate\\":\\"2025-08-08T00:00:00\\"},{\\"PairId\\":1165,\\"TournmentId\\":2028,\\"Team\\":\\"Team 2\\",\\"Pair\\":\\"Mathan - Chandru\\",\\"PairDate\\":\\"2025-08-08T00:00:00\\"},{\\"PairId\\":1166,\\"TournmentId\\":2028,\\"Team\\":\\"Team 3\\",\\"Pair\\":\\"Ramesh - Sathish\\",\\"PairDate\\":\\"2025-08-08T00:00:00\\"}],\\"lstmatchscdl\\":[{\\"MsTeams\\":null,\\"MsOpponents\\":null,\\"Team\\":\\"Selvam - Pandi\\",\\"Opponent\\":\\"Ramesh - Sathish\\"},{\\"MsTeams\\":null,\\"MsOpponents\\":null,\\"Team\\":\\"Mathan - Chandru\\",\\"Opponent\\":\\"Ramesh - Sathish\\"},{\\"MsTeams\\":null,\\"MsOpponents\\":null,\\"Team\\":\\"Selvam - Pandi\\",\\"Opponent\\":\\"Mathan - Chandru\\"}]}"
  //   }
  //   ''';

  //   return parseApiResponse(exampleJson);
  // }
}
