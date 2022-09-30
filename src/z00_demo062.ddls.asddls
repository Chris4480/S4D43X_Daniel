@AbapCatalog.sqlViewName: 'Z00DEMO06'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 6: Built-In Functions'
define view Z00_Demo062
  as select from sflight
    inner join   spfli on  sflight.carrid = spfli.carrid
                       and sflight.connid = spfli.connid
{
  /* Numerische Funktionen */
  5.0 / 3.0                                                        as Fltp1,
  div(5, 3)                                                        as Div1,
  mod(5, 3)                                                        as Mod1,
  division(5, 3, 2)                                                as Division1,
  price                                                            as Price,
  round(price, -1)                                                 as RoundedPrice,
  /* Zeichenkettenfunktionen */
  concat('Hallo', 'Welt')                                          as String1,
  concat_with_space('Hallo', 'Welt', 1)                            as String2,
  planetype                                                        as Planetype,
  concat_with_space('Airbus', replace(planetype, '400', '200'), 1) as Replace1,
  length('X  ')                                                    as LengthXSS,
  length('  X')                                                    as lengthSSX,
  length('   ')                                                    as lengthSSS,
  /* Währungs- und Einheitenumrechnungen */
  distance                                                         as OldDistance,
  distid                                                           as OldDistanceUnit,
  @Semantics.quantity.unitOfMeasure: 'NewDistanceUnit'
  unit_conversion(
    quantity => distance,
    source_unit => distid,
    target_unit => cast('KM' as abap.unit) )                       as NewDistance,
  cast('KM' as abap.unit)                                          as NewDistanceUnit,
  price                                                            as OldPrice,
  currency                                                         as OldCurrencyCode,
  @Semantics.amount.currencyCode: 'NewCurrencyCode'
  currency_conversion(
    amount => price,
    source_currency => currency,
    target_currency => cast('EUR' as abap.cuky),
    exchange_rate_date => fldate,
    error_handling => 'SET_TO_NULL' )                              as NewPrice,
  cast('EUR' as abap.cuky)                                         as NewCurrencyCode,
  /* Datums- und Zeitfunktionen */
  fldate                                                           as OldFlightDate,
  dats_add_days(fldate, 30, 'FAIL')                                as NewFlightDate

}
