@AbapCatalog.sqlViewName: 'Z00DEMO08'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 8: Outer Joins'
define view Z00_Demo08
  as select from    spfli
  //    inner join   scarr on spfli.carrid = scarr.carrid
    left outer join scarr on spfli.carrid = scarr.carrid
  //    right outer join scarr on spfli.carrid = scarr.carrid
  //    cross join   scarr
{
      /* Connection */
  key spfli.carrid as ConnectionCarrid,
  key connid       as Connid,
      countryfr    as Countryfr,
      cityfrom     as Cityfrom,
      airpfrom     as Airpfrom,
      countryto    as Countryto,
      cityto       as Cityto,
      airpto       as Airpto,
      /* Carrier */
      scarr.carrid as CarrierCarrid,
      carrname     as Carrname
}
