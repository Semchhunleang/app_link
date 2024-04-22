import 'dart:convert';

class DetailApierByFilterModel {
    List<dynamic>? data;
    Links? links;
    Meta? meta;
    int? totalInvite;
    int? totalAmount;
    String? totalAmountFormat;

    DetailApierByFilterModel({
        this.data,
        this.links,
        this.meta,
        this.totalInvite,
        this.totalAmount,
        this.totalAmountFormat,
    });

    factory DetailApierByFilterModel.fromRawJson(String str) => DetailApierByFilterModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailApierByFilterModel.fromJson(Map<String, dynamic> json) => DetailApierByFilterModel(
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        totalInvite: json["total_invite"],
        totalAmount: json["total_amount"],
        totalAmountFormat: json["total_amount_format"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
        "total_invite": totalInvite,
        "total_amount": totalAmount,
        "total_amount_format": totalAmountFormat,
    };
}

class Links {
    String? first;
    String? last;
    dynamic prev;
    dynamic next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    int? currentPage;
    dynamic from;
    int? lastPage;
    List<Link>? links;
    String? path;
    int? perPage;
    dynamic to;
    int? total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
