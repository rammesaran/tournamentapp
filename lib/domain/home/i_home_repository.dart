abstract class IHomeRepository {
  Future getplayers();
  Future playerShuffle(List playerName);
  Future reShuffle(List playerName);
  Future saveTournament(List palyerdata);
  Future getPairSet(int companyId);
}
