// Mocks generated by Mockito 5.1.0 from annotations
// in project_test/test/core/rest_client/dio_rest_client.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:project_test/app/core/rest_client/rest_client.dart' as _i3;
import 'package:project_test/app/core/rest_client/rest_client_response.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeRestClientResponse_0<T> extends _i1.Fake
    implements _i2.RestClientResponse<T> {}

/// A class which mocks [RestClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestClient extends _i1.Mock implements _i3.RestClient {
  MockRestClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.RestClientResponse<T>> post<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue: Future<_i2.RestClientResponse<T>>.value(
                  _FakeRestClientResponse_0<T>()))
          as _i4.Future<_i2.RestClientResponse<T>>);
  @override
  _i4.Future<_i2.RestClientResponse<T>> get<T>(String? path,
          {Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [path],
                  {#queryParameters: queryParameters, #headers: headers}),
              returnValue: Future<_i2.RestClientResponse<T>>.value(
                  _FakeRestClientResponse_0<T>()))
          as _i4.Future<_i2.RestClientResponse<T>>);
  @override
  _i4.Future<_i2.RestClientResponse<T>> put<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue: Future<_i2.RestClientResponse<T>>.value(
                  _FakeRestClientResponse_0<T>()))
          as _i4.Future<_i2.RestClientResponse<T>>);
  @override
  _i4.Future<_i2.RestClientResponse<T>> delete<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue: Future<_i2.RestClientResponse<T>>.value(
                  _FakeRestClientResponse_0<T>()))
          as _i4.Future<_i2.RestClientResponse<T>>);
  @override
  _i4.Future<_i2.RestClientResponse<T>> patch<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue: Future<_i2.RestClientResponse<T>>.value(
                  _FakeRestClientResponse_0<T>()))
          as _i4.Future<_i2.RestClientResponse<T>>);
  @override
  _i4.Future<_i2.RestClientResponse<T>> request<T>(String? path,
          {dynamic data,
          String? method,
          Map<String, dynamic>? queryParameters,
          Map<String, dynamic>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#request, [
                path
              ], {
                #data: data,
                #method: method,
                #queryParameters: queryParameters,
                #headers: headers
              }),
              returnValue: Future<_i2.RestClientResponse<T>>.value(
                  _FakeRestClientResponse_0<T>()))
          as _i4.Future<_i2.RestClientResponse<T>>);
}
