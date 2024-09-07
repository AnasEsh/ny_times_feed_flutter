class Article {
  String? uri;
  String url;
  int? id;
  int? assetId;
  String? source;
  DateTime publishedDate;
  DateTime? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  String? column;
  String byline;
  String? type;
  String? imageUrl;
  String title;
  String abstract;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  int? etaId;

  Article({
    this.uri,
    required this.url,
    this.id,
    this.assetId,
    this.source,
    required this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    required this.byline,
    this.type,
    this.imageUrl,
    required this.title,
    required this.abstract,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.etaId,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    final List? media =
        (json["media"] as List?)?.firstOrNull?['media-metadata'];
    final url = media?.lastOrNull?['url'];
    return Article(
      uri: json['uri'],
      url: json['url'],
      id: json['id'],
      assetId: json['asset_id'],
      source: json['source'],
      publishedDate: DateTime.parse(json['published_date']),
      updated: DateTime.parse(json['updated']),
      section: json['section'],
      subsection: json['subsection'],
      nytdsection: json['nytdsection'],
      adxKeywords: json['adx_keywords'],
      column: json['column'],
      byline: json['byline'],
      type: json['type'],
      imageUrl: url,
      title: json['title'],
      abstract: json['abstract'],
      desFacet: List<String>.from(json['des_facet'] ?? []),
      orgFacet: List<String>.from(json['org_facet'] ?? []),
      perFacet: List<String>.from(json['per_facet'] ?? []),
      geoFacet: List<String>.from(json['geo_facet'] ?? []),
      etaId: json['eta_id'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is Article) return other.id == this.id;

    return super == other;
  }
}
