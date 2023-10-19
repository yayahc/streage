// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAgeModelCollection on Isar {
  IsarCollection<AgeModel> get ageModels => this.collection();
}

const AgeModelSchema = CollectionSchema(
  name: r'AgeModel',
  id: 5584402944812982114,
  properties: {
    r'days': PropertySchema(
      id: 0,
      name: r'days',
      type: IsarType.long,
    ),
    r'hours': PropertySchema(
      id: 1,
      name: r'hours',
      type: IsarType.long,
    ),
    r'microseconds': PropertySchema(
      id: 2,
      name: r'microseconds',
      type: IsarType.long,
    ),
    r'milliseconds': PropertySchema(
      id: 3,
      name: r'milliseconds',
      type: IsarType.long,
    ),
    r'minutes': PropertySchema(
      id: 4,
      name: r'minutes',
      type: IsarType.long,
    ),
    r'months': PropertySchema(
      id: 5,
      name: r'months',
      type: IsarType.long,
    ),
    r'seconds': PropertySchema(
      id: 6,
      name: r'seconds',
      type: IsarType.long,
    ),
    r'years': PropertySchema(
      id: 7,
      name: r'years',
      type: IsarType.long,
    )
  },
  estimateSize: _ageModelEstimateSize,
  serialize: _ageModelSerialize,
  deserialize: _ageModelDeserialize,
  deserializeProp: _ageModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _ageModelGetId,
  getLinks: _ageModelGetLinks,
  attach: _ageModelAttach,
  version: '3.1.0+1',
);

int _ageModelEstimateSize(
  AgeModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _ageModelSerialize(
  AgeModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.days);
  writer.writeLong(offsets[1], object.hours);
  writer.writeLong(offsets[2], object.microseconds);
  writer.writeLong(offsets[3], object.milliseconds);
  writer.writeLong(offsets[4], object.minutes);
  writer.writeLong(offsets[5], object.months);
  writer.writeLong(offsets[6], object.seconds);
  writer.writeLong(offsets[7], object.years);
}

AgeModel _ageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AgeModel(
    days: reader.readLong(offsets[0]),
    hours: reader.readLong(offsets[1]),
    microseconds: reader.readLong(offsets[2]),
    milliseconds: reader.readLong(offsets[3]),
    minutes: reader.readLong(offsets[4]),
    months: reader.readLong(offsets[5]),
    seconds: reader.readLong(offsets[6]),
    years: reader.readLong(offsets[7]),
  );
  object.id = id;
  return object;
}

P _ageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ageModelGetId(AgeModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ageModelGetLinks(AgeModel object) {
  return [];
}

void _ageModelAttach(IsarCollection<dynamic> col, Id id, AgeModel object) {
  object.id = id;
}

extension AgeModelQueryWhereSort on QueryBuilder<AgeModel, AgeModel, QWhere> {
  QueryBuilder<AgeModel, AgeModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AgeModelQueryWhere on QueryBuilder<AgeModel, AgeModel, QWhereClause> {
  QueryBuilder<AgeModel, AgeModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AgeModelQueryFilter
    on QueryBuilder<AgeModel, AgeModel, QFilterCondition> {
  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> daysEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> daysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> daysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> daysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'days',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> hoursEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> hoursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> hoursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> hoursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> microsecondsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'microseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition>
      microsecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'microseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> microsecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'microseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> microsecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'microseconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> millisecondsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition>
      millisecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'milliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> millisecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'milliseconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> millisecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'milliseconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> minutesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> minutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> minutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> minutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> monthsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'months',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> monthsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'months',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> monthsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'months',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> monthsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'months',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> secondsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> secondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> secondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> secondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> yearsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'years',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> yearsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'years',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> yearsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'years',
        value: value,
      ));
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterFilterCondition> yearsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'years',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AgeModelQueryObject
    on QueryBuilder<AgeModel, AgeModel, QFilterCondition> {}

extension AgeModelQueryLinks
    on QueryBuilder<AgeModel, AgeModel, QFilterCondition> {}

extension AgeModelQuerySortBy on QueryBuilder<AgeModel, AgeModel, QSortBy> {
  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMicroseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microseconds', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMicrosecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microseconds', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milliseconds', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milliseconds', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'months', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'months', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortBySeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortBySecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'years', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> sortByYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'years', Sort.desc);
    });
  }
}

extension AgeModelQuerySortThenBy
    on QueryBuilder<AgeModel, AgeModel, QSortThenBy> {
  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMicroseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microseconds', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMicrosecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'microseconds', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milliseconds', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMillisecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milliseconds', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'months', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'months', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenBySeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenBySecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.desc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'years', Sort.asc);
    });
  }

  QueryBuilder<AgeModel, AgeModel, QAfterSortBy> thenByYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'years', Sort.desc);
    });
  }
}

extension AgeModelQueryWhereDistinct
    on QueryBuilder<AgeModel, AgeModel, QDistinct> {
  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctByDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'days');
    });
  }

  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hours');
    });
  }

  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctByMicroseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'microseconds');
    });
  }

  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctByMilliseconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'milliseconds');
    });
  }

  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minutes');
    });
  }

  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctByMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'months');
    });
  }

  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctBySeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seconds');
    });
  }

  QueryBuilder<AgeModel, AgeModel, QDistinct> distinctByYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'years');
    });
  }
}

extension AgeModelQueryProperty
    on QueryBuilder<AgeModel, AgeModel, QQueryProperty> {
  QueryBuilder<AgeModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> daysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'days');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> hoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hours');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> microsecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'microseconds');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> millisecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'milliseconds');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> minutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minutes');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> monthsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'months');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> secondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seconds');
    });
  }

  QueryBuilder<AgeModel, int, QQueryOperations> yearsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'years');
    });
  }
}
