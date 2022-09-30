@AbapCatalog.sqlViewName: 'Z00FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight'
define view Z00_Flight
  as select from sflight
{
  key carrid                           as CarrierID,
  key connid                           as ConnectionID,
  key fldate                           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
        amount => price,
        source_currency => currency,
        target_currency => cast('EUR' as abap.cuky),
        exchange_rate_date => fldate ) as Price,
      cast('EUR' as abap.cuky)         as CurrencyCode,
      planetype                        as Planetype,
      seatsmax                         as MaximumSeatsEconomy,
      seatsmax_b                       as MaximumSeatsBusiness,
      seatsmax_f                       as MaximumSeatssFirst,
      seatsocc                         as OccupiedSeatEconomy,
      seatsocc_b                       as OccupiedSeatsBusiness,
      seatsocc_f                       as OccupiedSeatsFirst,
      seatsmax - seatsocc              as FreeSeatsEconomy,
      seatsmax_b - seatsocc_b          as FreeSeatsBusiness,
      seatsmax_f - seatsocc_f          as FreeSeatsFirst,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
        amount => paymentsum,
        source_currency => currency,
        target_currency => cast('EUR' as abap.cuky),
        exchange_rate_date => fldate ) as Paymentsum

}
