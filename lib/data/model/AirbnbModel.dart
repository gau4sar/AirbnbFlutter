class AirbnbModel {
  num? nhits;
  Parameters? parameters;
  List<Records>? records;
  List<FacetGroups>? facetGroups;

  AirbnbModel({this.nhits, this.parameters, this.records, this.facetGroups});

  AirbnbModel.fromJson(Map<String, dynamic> json) {
    nhits = json['nhits'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    if (json['facet_groups'] != null) {
      facetGroups = <FacetGroups>[];
      json['facet_groups'].forEach((v) {
        facetGroups!.add(new FacetGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nhits'] = this.nhits;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.toJson();
    }
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    if (this.facetGroups != null) {
      data['facet_groups'] = this.facetGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? dataset;
  num? rows;
  num? start;
  List<String>? facet;
  String? format;
  String? timezone;

  Parameters(
      {this.dataset,
        this.rows,
        this.start,
        this.facet,
        this.format,
        this.timezone});

  Parameters.fromJson(Map<String, dynamic> json) {
    dataset = json['dataset'];
    rows = json['rows'];
    start = json['start'];
    facet = json['facet'].cast<String>();
    format = json['format'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataset'] = this.dataset;
    data['rows'] = this.rows;
    data['start'] = this.start;
    data['facet'] = this.facet;
    data['format'] = this.format;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Records {
  String? datasetid;
  String? recordid;
  Fields? fields;
  Geometry? geometry;
  String? recordTimestamp;

  Records(
      {this.datasetid,
        this.recordid,
        this.fields,
        this.geometry,
        this.recordTimestamp});

  Records.fromJson(Map<String, dynamic> json) {
    datasetid = json['datasetid'];
    recordid = json['recordid'];
    fields =
    json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    recordTimestamp = json['record_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datasetid'] = this.datasetid;
    data['recordid'] = this.recordid;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    data['record_timestamp'] = this.recordTimestamp;
    return data;
  }
}

class Fields {
  List<double>? geolocation;
  String? hostVerifications;
  num? reviewScoresCommunication;
  String? jurisdictionNames;
  num? availability90;
  String? scrapeId;
  String? city;
  num? numberOfReviews;
  num? bathrooms;
  String? description;
  num? reviewScoresLocation;
  num? accommodates;
  String? summary;
  String? propertyType;
  num? bedrooms;
  String? street;
  String? access;
  String? cancellationPolicy;
  String? xlPictureUrl;
  String? id;
  num? price;
  String? neighbourhoodCleansed;
  double? reviewsPerMonth;
  String? transit;
  num? reviewScoresRating;
  String? smartLocation;
  String? hostLocation;
  num? beds;
  String? features;
  String? space;
  String? hostId;
  String? lastScraped;
  String? latitude;
  String? countryCode;
  String? country;
  String? market;
  num? reviewScoresCleanliness;
  String? state;
  String? hostSince;
  num? availability60;
  num? minimumNights;
  String? mediumUrl;
  String? hostUrl;
  String? thumbnailUrl;
  String? firstReview;
  String? name;
  String? neighborhoodOverview;
  num? calculatedHostListingsCount;
  String? calendarLastScraped;
  String? hostPictureUrl;
  num? hostTotalListingsCount;
  PictureUrl? pictureUrl;
  num? extraPeople;
  String? roomType;
  String? amenities;
  String? listingUrl;
  num? reviewScoresAccuracy;
  String? calendarUpdated;
  String? hostThumbnailUrl;
  num? hostListingsCount;
  String? hostName;
  num? reviewScoresCheckin;
  num? availability365;
  String? lastReview;
  String? bedType;
  num? reviewScoresValue;
  String? zipcode;
  String? longitude;
  num? maximumNights;
  num? availability30;
  String? experiencesOffered;
  num? guestsIncluded;
  String? hostNeighbourhood;
  String? houseRules;
  num? hostResponseRate;
  String? neighbourhood;
  num? cleaningFee;
  String? hostResponseTime;
  String? hostAbout;
  num? squareFeet;
  num? securityDeposit;
  String? numeraction;
  num? monthlyPrice;
  num? weeklyPrice;

  Fields(
      {this.geolocation,
        this.hostVerifications,
        this.reviewScoresCommunication,
        this.jurisdictionNames,
        this.availability90,
        this.scrapeId,
        this.city,
        this.numberOfReviews,
        this.bathrooms,
        this.description,
        this.reviewScoresLocation,
        this.accommodates,
        this.summary,
        this.propertyType,
        this.bedrooms,
        this.street,
        this.access,
        this.cancellationPolicy,
        this.xlPictureUrl,
        this.id,
        this.price,
        this.neighbourhoodCleansed,
        this.reviewsPerMonth,
        this.transit,
        this.reviewScoresRating,
        this.smartLocation,
        this.hostLocation,
        this.beds,
        this.features,
        this.space,
        this.hostId,
        this.lastScraped,
        this.latitude,
        this.countryCode,
        this.country,
        this.market,
        this.reviewScoresCleanliness,
        this.state,
        this.hostSince,
        this.availability60,
        this.minimumNights,
        this.mediumUrl,
        this.hostUrl,
        this.thumbnailUrl,
        this.firstReview,
        this.name,
        this.neighborhoodOverview,
        this.calculatedHostListingsCount,
        this.calendarLastScraped,
        this.hostPictureUrl,
        this.hostTotalListingsCount,
        this.pictureUrl,
        this.extraPeople,
        this.roomType,
        this.amenities,
        this.listingUrl,
        this.reviewScoresAccuracy,
        this.calendarUpdated,
        this.hostThumbnailUrl,
        this.hostListingsCount,
        this.hostName,
        this.reviewScoresCheckin,
        this.availability365,
        this.lastReview,
        this.bedType,
        this.reviewScoresValue,
        this.zipcode,
        this.longitude,
        this.maximumNights,
        this.availability30,
        this.experiencesOffered,
        this.guestsIncluded,
        this.hostNeighbourhood,
        this.houseRules,
        this.hostResponseRate,
        this.neighbourhood,
        this.cleaningFee,
        this.hostResponseTime,
        this.hostAbout,
        this.squareFeet,
        this.securityDeposit,
        this.numeraction,
        this.monthlyPrice,
        this.weeklyPrice});

  Fields.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'].cast<double>();
    hostVerifications = json['host_verifications'];
    reviewScoresCommunication = json['review_scores_communication'];
    jurisdictionNames = json['jurisdiction_names'];
    availability90 = json['availability_90'];
    scrapeId = json['scrape_id'];
    city = json['city'];
    numberOfReviews = json['number_of_reviews'];
    bathrooms = json['bathrooms'];
    description = json['description'];
    reviewScoresLocation = json['review_scores_location'];
    accommodates = json['accommodates'];
    summary = json['summary'];
    propertyType = json['property_type'];
    bedrooms = json['bedrooms'];
    street = json['street'];
    access = json['access'];
    cancellationPolicy = json['cancellation_policy'];
    xlPictureUrl = json['xl_picture_url'];
    id = json['id'];
    price = json['price'];
    neighbourhoodCleansed = json['neighbourhood_cleansed'];
    reviewsPerMonth = json['reviews_per_month'];
    transit = json['transit'];
    reviewScoresRating = json['review_scores_rating'];
    smartLocation = json['smart_location'];
    hostLocation = json['host_location'];
    beds = json['beds'];
    features = json['features'];
    space = json['space'];
    hostId = json['host_id'];
    lastScraped = json['last_scraped'];
    latitude = json['latitude'];
    countryCode = json['country_code'];
    country = json['country'];
    market = json['market'];
    reviewScoresCleanliness = json['review_scores_cleanliness'];
    state = json['state'];
    hostSince = json['host_since'];
    availability60 = json['availability_60'];
    minimumNights = json['minimum_nights'];
    mediumUrl = json['medium_url'];
    hostUrl = json['host_url'];
    thumbnailUrl = json['thumbnail_url'];
    firstReview = json['first_review'];
    name = json['name'];
    neighborhoodOverview = json['neighborhood_overview'];
    calculatedHostListingsCount = json['calculated_host_listings_count'];
    calendarLastScraped = json['calendar_last_scraped'];
    hostPictureUrl = json['host_picture_url'];
    hostTotalListingsCount = json['host_total_listings_count'];
    pictureUrl = json['picture_url'] != null
        ? new PictureUrl.fromJson(json['picture_url'])
        : null;
    extraPeople = json['extra_people'];
    roomType = json['room_type'];
    amenities = json['amenities'];
    listingUrl = json['listing_url'];
    reviewScoresAccuracy = json['review_scores_accuracy'];
    calendarUpdated = json['calendar_updated'];
    hostThumbnailUrl = json['host_thumbnail_url'];
    hostListingsCount = json['host_listings_count'];
    hostName = json['host_name'];
    reviewScoresCheckin = json['review_scores_checkin'];
    availability365 = json['availability_365'];
    lastReview = json['last_review'];
    bedType = json['bed_type'];
    reviewScoresValue = json['review_scores_value'];
    zipcode = json['zipcode'];
    longitude = json['longitude'];
    maximumNights = json['maximum_nights'];
    availability30 = json['availability_30'];
    experiencesOffered = json['experiences_offered'];
    guestsIncluded = json['guests_included'];
    hostNeighbourhood = json['host_neighbourhood'];
    houseRules = json['house_rules'];
    hostResponseRate = json['host_response_rate'];
    neighbourhood = json['neighbourhood'];
    cleaningFee = json['cleaning_fee'];
    hostResponseTime = json['host_response_time'];
    hostAbout = json['host_about'];
    squareFeet = json['square_feet'];
    securityDeposit = json['security_deposit'];
    numeraction = json['numeraction'];
    monthlyPrice = json['monthly_price'];
    weeklyPrice = json['weekly_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geolocation'] = this.geolocation;
    data['host_verifications'] = this.hostVerifications;
    data['review_scores_communication'] = this.reviewScoresCommunication;
    data['jurisdiction_names'] = this.jurisdictionNames;
    data['availability_90'] = this.availability90;
    data['scrape_id'] = this.scrapeId;
    data['city'] = this.city;
    data['number_of_reviews'] = this.numberOfReviews;
    data['bathrooms'] = this.bathrooms;
    data['description'] = this.description;
    data['review_scores_location'] = this.reviewScoresLocation;
    data['accommodates'] = this.accommodates;
    data['summary'] = this.summary;
    data['property_type'] = this.propertyType;
    data['bedrooms'] = this.bedrooms;
    data['street'] = this.street;
    data['access'] = this.access;
    data['cancellation_policy'] = this.cancellationPolicy;
    data['xl_picture_url'] = this.xlPictureUrl;
    data['id'] = this.id;
    data['price'] = this.price;
    data['neighbourhood_cleansed'] = this.neighbourhoodCleansed;
    data['reviews_per_month'] = this.reviewsPerMonth;
    data['transit'] = this.transit;
    data['review_scores_rating'] = this.reviewScoresRating;
    data['smart_location'] = this.smartLocation;
    data['host_location'] = this.hostLocation;
    data['beds'] = this.beds;
    data['features'] = this.features;
    data['space'] = this.space;
    data['host_id'] = this.hostId;
    data['last_scraped'] = this.lastScraped;
    data['latitude'] = this.latitude;
    data['country_code'] = this.countryCode;
    data['country'] = this.country;
    data['market'] = this.market;
    data['review_scores_cleanliness'] = this.reviewScoresCleanliness;
    data['state'] = this.state;
    data['host_since'] = this.hostSince;
    data['availability_60'] = this.availability60;
    data['minimum_nights'] = this.minimumNights;
    data['medium_url'] = this.mediumUrl;
    data['host_url'] = this.hostUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['first_review'] = this.firstReview;
    data['name'] = this.name;
    data['neighborhood_overview'] = this.neighborhoodOverview;
    data['calculated_host_listings_count'] = this.calculatedHostListingsCount;
    data['calendar_last_scraped'] = this.calendarLastScraped;
    data['host_picture_url'] = this.hostPictureUrl;
    data['host_total_listings_count'] = this.hostTotalListingsCount;
    if (this.pictureUrl != null) {
      data['picture_url'] = this.pictureUrl!.toJson();
    }
    data['extra_people'] = this.extraPeople;
    data['room_type'] = this.roomType;
    data['amenities'] = this.amenities;
    data['listing_url'] = this.listingUrl;
    data['review_scores_accuracy'] = this.reviewScoresAccuracy;
    data['calendar_updated'] = this.calendarUpdated;
    data['host_thumbnail_url'] = this.hostThumbnailUrl;
    data['host_listings_count'] = this.hostListingsCount;
    data['host_name'] = this.hostName;
    data['review_scores_checkin'] = this.reviewScoresCheckin;
    data['availability_365'] = this.availability365;
    data['last_review'] = this.lastReview;
    data['bed_type'] = this.bedType;
    data['review_scores_value'] = this.reviewScoresValue;
    data['zipcode'] = this.zipcode;
    data['longitude'] = this.longitude;
    data['maximum_nights'] = this.maximumNights;
    data['availability_30'] = this.availability30;
    data['experiences_offered'] = this.experiencesOffered;
    data['guests_included'] = this.guestsIncluded;
    data['host_neighbourhood'] = this.hostNeighbourhood;
    data['house_rules'] = this.houseRules;
    data['host_response_rate'] = this.hostResponseRate;
    data['neighbourhood'] = this.neighbourhood;
    data['cleaning_fee'] = this.cleaningFee;
    data['host_response_time'] = this.hostResponseTime;
    data['host_about'] = this.hostAbout;
    data['square_feet'] = this.squareFeet;
    data['security_deposit'] = this.securityDeposit;
    data['numeraction'] = this.numeraction;
    data['monthly_price'] = this.monthlyPrice;
    data['weekly_price'] = this.weeklyPrice;
    return data;
  }
}

class PictureUrl {
  String? id;
  String? mimetype;
  num? height;
  num? width;
  String? filename;
  bool? thumbnail;
  String? format;
  List<String>? colorSummary;

  PictureUrl(
      {this.id,
        this.mimetype,
        this.height,
        this.width,
        this.filename,
        this.thumbnail,
        this.format,
        this.colorSummary});

  PictureUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mimetype = json['mimetype'];
    height = json['height'];
    width = json['width'];
    filename = json['filename'];
    thumbnail = json['thumbnail'];
    format = json['format'];
    colorSummary = json['color_summary'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mimetype'] = this.mimetype;
    data['height'] = this.height;
    data['width'] = this.width;
    data['filename'] = this.filename;
    data['thumbnail'] = this.thumbnail;
    data['format'] = this.format;
    data['color_summary'] = this.colorSummary;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class FacetGroups {
  String? name;
  List<Facets>? facets;

  FacetGroups({this.name, this.facets});

  FacetGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['facets'] != null) {
      facets = <Facets>[];
      json['facets'].forEach((v) {
        facets!.add(new Facets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.facets != null) {
      data['facets'] = this.facets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facets {
  String? name;
  num? count;
  String? state;
  String? path;

  Facets({this.name, this.count, this.state, this.path});

  Facets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
    state = json['state'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['count'] = this.count;
    data['state'] = this.state;
    data['path'] = this.path;
    return data;
  }
}