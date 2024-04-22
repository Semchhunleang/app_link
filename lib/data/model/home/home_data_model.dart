import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../category/home_category_model.dart';
import '../product/property_item_model.dart';
import 'agents_model.dart';
import 'counter_model.dart';
// import 'fileter_prices.dart';
import 'home_property_model.dart';
import 'location_model.dart';

class HomeDataModel extends Equatable {
  final LocationModel location;
  final HomeCategory category;
  final AgentsModel agent;
  final CounterModel counter;
  // final List<FilterPriceItem> filterPrices;  {have error of model int is not a type of double}
  final HomePropertyModel? featuredProperty;
  final HomePropertyModel? urgentProperty;
  final List<PropertyItemModel>? sliderProperty;

  const HomeDataModel({
    required this.location,
    required this.category,
    required this.agent,
    required this.counter,
    //   required this.filterPrices,
    required this.featuredProperty,
    required this.sliderProperty,
    required this.urgentProperty,
  });

  HomeDataModel copyWith({
    LocationModel? location,
    HomeCategory? category,
    AgentsModel? agent,
    CounterModel? counter,
    // List<FilterPriceItem>? filterPrices,
    HomePropertyModel? featuredProperty,
    HomePropertyModel? urgentProperty,
    List<PropertyItemModel>? sliderProperty,
  }) {
    return HomeDataModel(
      location: location ?? this.location,
      category: category ?? this.category,
      agent: agent ?? this.agent,
      counter: counter ?? this.counter,
      //  filterPrices: filterPrices ?? this.filterPrices,
      featuredProperty: featuredProperty ?? this.featuredProperty,
      urgentProperty: urgentProperty ?? this.urgentProperty,
      sliderProperty: sliderProperty ?? this.sliderProperty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location.toMap(),
      'category': category.toMap(),
      'agent': agent.toMap(),
      'counter': counter.toMap(),
      //'filter_prices': filterPrices.map((x) => x.toMap()).toList(),
      'featured_property': featuredProperty!.toMap(),
      'urgent_property': urgentProperty!.toMap(),
      'intro_content': sliderProperty!.map((e) => e.toMap()).toList(),
    };
  }

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    return HomeDataModel(
      location: LocationModel.fromMap(map['location'] as Map<String, dynamic>),
      category: HomeCategory.fromMap(map['category'] as Map<String, dynamic>),
      agent: AgentsModel.fromMap(map['agent'] as Map<String, dynamic>),
      counter: CounterModel.fromMap(map['counter'] as Map<String, dynamic>),
      // filterPrices: List<FilterPriceItem>.from(
      //   (map['filter_prices'] as List<dynamic>).map<FilterPriceItem>(
      //     (x) => FilterPriceItem.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
      sliderProperty:
          map['intro_content']['home1_intro']['slider_properties'] != null
              ? List<PropertyItemModel>.from(
                  (map['intro_content']['home1_intro']['slider_properties']
                          as List<dynamic>)
                      .map<PropertyItemModel>(
                    (x) => PropertyItemModel.fromMap(x as Map<String, dynamic>),
                  ),
                )
              : [],
      featuredProperty: map['featured_property'] != null
          ? HomePropertyModel.fromMap(
              map['featured_property'] as Map<String, dynamic>)
          : null,
      urgentProperty: map['urgent_property'] != null
          ? HomePropertyModel.fromMap(
              map['urgent_property'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeDataModel.fromJson(String source) =>
      HomeDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      location,
      category,
      agent,
      counter,
      // filterPrices,
      featuredProperty!,
      urgentProperty!,
      sliderProperty!,
    ];
  }
}
