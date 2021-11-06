// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LinkCreateResponse> createLink(link) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(link.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<LinkCreateResponse>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'linkmanager/create', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LinkCreateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteLink(key) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = key;
    await _dio.fetch<void>(_setStreamType<void>(Options(method: 'DELETE', headers: _headers, extra: _extra)
        .compose(_dio.options, 'linkmanager/delete', queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<String> checkAccess(linkAccessRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(linkAccessRequest.toJson());
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(method: 'POST', headers: _headers, extra: _extra)
        .compose(_dio.options, 'link/access', queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
