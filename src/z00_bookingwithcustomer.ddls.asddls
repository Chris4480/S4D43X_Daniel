@AbapCatalog.sqlViewName: 'Z00BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking with Customer'
define view Z00_BookingWithCustomer
  as select from Z00_Booking  as Booking
    inner join   Z00_Customer as Customer on Booking.CustomerID = Customer.ID
{
      /* Booking */
  key Booking.CarrierID,
  key Booking.ConnectionID,
  key Booking.FlightDate,
  key Booking.BookingID,
      Booking.LuggageWeight,
      Booking.LuggageWeightUnit,
      @EndUserText.label: 'Flight Class'
      @EndUserText.quickInfo: 'Flight Class'
      case Booking.FlightClass
        when 'C' then 'Business'
        when 'Y' then 'Economy'
        when 'F' then 'First'
        else ''
      end                                                                as FlightClass,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(currency_conversion(
        amount => Booking.Amount,
        source_currency => Booking.CurrencyCode,
        target_currency => cast('USD' as abap.cuky),
        exchange_rate_date => OrderDate ) as s_f_cur_pr preserving type) as Amount,
      cast('USD' as s_curr)                                              as CurrencyCode,
      Booking.OrderDate,
      Booking.CounterID,
      Booking.AgencyNumber,
      /* Customer */
      Customer.ID,
      @EndUserText.label: 'Name'
      @EndUserText.quickInfo: 'Name'
      case Customer.Form
         when '' then Customer.Name
         else concat_with_space(Customer.Form, Customer.Name, 1)
      end                                                                as Name,
      Customer.Street,
      Customer.Postcode,
      Customer.City,
      Customer.Country,
      @EndUserText.label: 'Days Ahead'
      @EndUserText.quickInfo: 'Days Ahead'
      dats_days_between(OrderDate, FlightDate)                           as DaysAhead,
      /*Grüße von Martin und Timon*/
      @EndUserText.label: 'Discount as Factor'
      @EndUserText.quickInfo: 'Discount as Factor'
      division(cast(Customer.Discount as abap.int1), 100, 2)             as Discount
}
