abstract class NewsRepo{
  Future getNewsHeadline();
  Future getSearchNews(String query);
}