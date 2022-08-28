// To parse this JSON data, do
//
//     final newArrivalsResponse = newArrivalsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:moltaqa_task/features/new_arrivals/domain/entities/new_arrivals.dart';

NewArrivalsResponse newArrivalsResponseFromJson(String str) =>
    NewArrivalsResponse.fromJson(json.decode(str));
String newArrivalsResponseToJson(NewArrivalsResponse data) =>
    json.encode(data.toJson());

class NewArrivalsResponse {
  final bool status;
  final String message;
  final Data data;
  NewArrivalsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  NewArrivalsResponse copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return NewArrivalsResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data.toMap(),
    };
  }

  factory NewArrivalsResponse.fromMap(Map<String, dynamic> map) {
    return NewArrivalsResponse(
      status: map['status'] ?? false,
      message: map['message'] ?? '',
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewArrivalsResponse.fromJson(String source) =>
      NewArrivalsResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewArrivalsResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewArrivalsResponse &&
        other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class Data {
  final int currentPage;
  final List<NewArrival> newArrivals;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;
  Data({
    required this.currentPage,
    required this.newArrivals,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  Data copyWith({
    int? currentPage,
    List<NewArrival>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) {
    return Data(
      currentPage: currentPage ?? this.currentPage,
      newArrivals: data ?? newArrivals,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentPage,
      'data': newArrivals.map((x) => x.toMap()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links.map((x) => x.toMap()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      currentPage: map['current_page']?.toInt() ?? 0,
      newArrivals:
          List<NewArrival>.from(map['data']?.map((x) => NewArrival.fromMap(x))),
      firstPageUrl: map['first_page_url'] ?? '',
      from: map['from']?.toInt() ?? 0,
      lastPage: map['last_page']?.toInt() ?? 0,
      lastPageUrl: map['last_page_url'] ?? '',
      links: List<Link>.from(map['links']?.map((x) => Link.fromMap(x))),
      nextPageUrl: map['next_page_url'],
      path: map['path'] ?? '',
      perPage: map['per_page']?.toInt() ?? 0,
      prevPageUrl: map['prev_page_url'],
      to: map['to']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }
  bool checkIfMore() => nextPageUrl != null;
  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(currentPage: $currentPage, data: $newArrivals, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, links: $links, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.currentPage == currentPage &&
        listEquals(other.newArrivals, newArrivals) &&
        other.firstPageUrl == firstPageUrl &&
        other.from == from &&
        other.lastPage == lastPage &&
        other.lastPageUrl == lastPageUrl &&
        listEquals(other.links, links) &&
        other.nextPageUrl == nextPageUrl &&
        other.path == path &&
        other.perPage == perPage &&
        other.prevPageUrl == prevPageUrl &&
        other.to == to &&
        other.total == total;
  }

  @override
  int get hashCode {
    return currentPage.hashCode ^
        newArrivals.hashCode ^
        firstPageUrl.hashCode ^
        from.hashCode ^
        lastPage.hashCode ^
        lastPageUrl.hashCode ^
        links.hashCode ^
        nextPageUrl.hashCode ^
        path.hashCode ^
        perPage.hashCode ^
        prevPageUrl.hashCode ^
        to.hashCode ^
        total.hashCode;
  }
}

class Link {
  final String url;
  final String label;
  final bool active;
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return Link(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      url: map['url'] ?? '',
      label: map['label'] ?? '',
      active: map['active'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Link.fromJson(String source) => Link.fromMap(json.decode(source));

  @override
  String toString() => 'Link(url: $url, label: $label, active: $active)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Link &&
        other.url == url &&
        other.label == label &&
        other.active == active;
  }

  @override
  int get hashCode => url.hashCode ^ label.hashCode ^ active.hashCode;
}
