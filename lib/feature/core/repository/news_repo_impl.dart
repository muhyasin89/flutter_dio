import 'package:dio_rest_api/feature/core/repository';

class NewsRepoImpl implements NewsRepo {
  @override
  Future getNewsHeadline(){
    throw UnimplementedError();
  }

  @override
  Future getSearchNews(String query){
    throw UnimplementedError();
  }
}