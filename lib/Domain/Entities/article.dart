class Article {
  String? uri;
  String? url;
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
  String title;
  String? abstractText;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  int? etaId;

  Article({
    this.uri,
    this.url,
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
    required this.title,
    this.abstractText,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.etaId,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
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
      title: json['title'],
      abstractText: json['abstract'],
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
