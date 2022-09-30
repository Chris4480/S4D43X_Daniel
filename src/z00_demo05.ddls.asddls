@AbapCatalog.sqlViewName: 'Z00DEMO05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 5: Arithmetic Expressions and Type Casts'
define view Z00_Demo05
  as select from sflight
{
  seatsmax                                  as MaximumSeatsEconomy,
  seatsmax_b                                as MaximumSeatsBusiness,
  seatsmax_f                                as MaxmimumSeatsFirst,
  seatsmax + seatsmax_b + seatsmax_f        as MaximumSeatsTotal,
  seatsocc                                  as OccupiedSeatsEconomy,
  seatsmax - seatsocc                       as FreeSeatsEconomy,
  price                                     as Price,
  price * 2                                 as DoublePrice,
  cast(price as abap.fltp) * 1.2            as NewPrice,
  ( cast(seatsocc as abap.fltp)
    / cast(seatsmax as abap.fltp) ) * 100.0 as OccupancyRate,
  //  cast(96.7 as abap.dec(16,2))              as Decimal1
  fltp_to_dec(96.7 as abap.dec(16,2))       as Decimal1,
  @EndUserText.label: 'Carrier ID'
  @EndUserText.quickInfo: 'Carrier ID'
  'LH'                                      as Char1,
  cast('LH' as s_carr_id)                   as CarrierId
}
