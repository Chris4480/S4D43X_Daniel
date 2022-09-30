@AbapCatalog.sqlViewName: 'Z00CUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer with Revenue'
define view Z00_CustomerWithRevenue
  as select from Z00_BookingWithCustomer
{
  key ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Total Amount'
      @EndUserText.quickInfo: 'Total Amount'
      sum(Amount)                      as TotalAmount,
      CurrencyCode,
      @EndUserText.label: 'Average Days Ahead'
      @EndUserText.quickInfo: 'Average Days Ahead'
      avg(DaysAhead as abap.dec(16,0)) as AverageDaysAhead
}
group by
  ID,
  Name,
  Street,
  Postcode,
  City,
  Country,
  CurrencyCode
having
  sum(Amount) > 25000
