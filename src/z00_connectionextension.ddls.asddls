@AbapCatalog.sqlViewAppendName: 'Z00CONNX'
@EndUserText.label: 'Connection Extension'
extend view Z00_Connection with Z00_ConnectionExtension
  association [1] to scarr as _Carrier on spfli.carrid = _Carrier.carrid
{
  spfli.distance as Distance,
  spfli.distid   as Distid,
  _Carrier
}
