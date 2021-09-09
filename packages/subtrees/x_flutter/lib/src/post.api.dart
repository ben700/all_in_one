import 'package:x_flutter/x_flutter.dart';

class PostApi extends ForumApi {
  static PostApi? _instance;
  static PostApi get instance {
    if (_instance == null) {
      _instance = PostApi();
    }
    return _instance!;
  }

  /// 백엔드로 부터 글 1개를 가져와서 리턴한다.
  ///
  /// [idx] 는 글 번호 또는 글 path 이다.
  ///
  /// ```dart
  /// final c = await api.post.get('path');
  /// print(c);
  /// ```
  Future<PostModel> get(dynamic idx) async {
    assert(idx is int || idx is String, '글 idx 또는 path 를 입력하셔야합니다.');
    final Map<String, dynamic> data = {};
    if (idx is int) {
      data['idx'] = idx;
    } else if (idx is String) {
      data['path'] = idx;
    }
    final res = await api.request('post.get', data);
    return PostModel.fromJson(res);
  }

  /// 글 검색
  ///
  /// [data] 는 백엔드 컨트롤러 참고
  /// ```dart
  /// final res = await api.post.search({});
  /// for (final p in res) print(p);
  /// ```
  Future<List<PostModel>> search({
    int? categoryIdx,
    String? categoryId,
    String? ids,
    String? subcategory,
    String? code,
    String files = '',
    String? fields,
    String? countryCode,
    String? searchKey,
    int? userIdx,
    String? order,
    String? by,
    int page = 1,
    int limit = 10,
    int? comments,
    bool minimize = false,
    String fulltextSearch = '',
    int? within,
    int? betweenFrom,
    int? betweenTo,
  }) async {
    final Map<String, dynamic> data = {
      if (categoryIdx != null) 'categoryIdx': categoryIdx,
      if (categoryId != null) 'categoryId': categoryId,
      if (ids != null) 'ids': ids,
      if (subcategory != null) 'subcategory': subcategory,
      if (code != null) 'code': code,
      if (fields != null) 'fields': fields,
      if (countryCode != null) 'countryCode': countryCode,
      if (searchKey != null) 'searchKey': searchKey,
      if (userIdx != null) 'userIdx': userIdx,
      if (order != null) 'order': order,
      if (by != null) 'by': by,
      if (comments != null) 'comments': comments,
      if (within != null) 'within': within,
      if (betweenFrom != null) 'betweenFrom': betweenFrom,
      if (betweenTo != null) 'betweenTo': betweenTo,
      'limit': limit,
      'page': page,
      'files': files,
      'minimize': minimize ? 'Y' : '',
      'fulltextSearch': fulltextSearch,
    };
    final res = await api.request('post.search', data);
    List<PostModel> posts = [];
    for (final j in res) {
      /// 게시글을 배열로 가져올 때에는 각 글에 읽기 포인트 등, 글 읽기 제한이 있는 경우, error_not_logged_in 또는 permission 에러가 있을 수 있다.
      if (j is String) throw j;
      posts.add(PostModel.fromJson(j));
    }
    return posts;
  }

  ///
  Future<PostModel> edit(Map<String, dynamic> data) async {
    String route;
    if (data['idx'] == null)
      route = 'post.create';
    else
      route = 'post.update';

    final json = await api.request(route, data);
    return PostModel.fromJson(json);
  }

  /// Deletes a post.
  ///
  Future<PostModel> delete(int idx) async {
    final res = await api.request('post.delete', {
      'idx': idx,
    });

    return PostModel.fromJson(res);
  }
}
