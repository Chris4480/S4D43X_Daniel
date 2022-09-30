*&---------------------------------------------------------------------*
*& Report z00_demo_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_11.

PARAMETERS p_carrid TYPE s_carr_id.
PARAMETERS p_connid TYPE s_conn_id.
PARAMETERS p_deadl TYPE dats.

DATA flights TYPE TABLE OF z00_demo11.

SELECT FROM z00_demo11( pcarrierid = @p_carrid, pconnectionid = @p_connid )
 FIELDS *
* WHERE flightdate > @p_deadl
 INTO TABLE @flights.
IF sy-subrc <> 0.
ENDIF.

*SELECT FROM z00_flight
* FIELDS *
** WHERE carrierid = @p_carrid AND connectionid = @p_connid AND flightdate > @sy-datlo
* INTO TABLE @flights.
*IF sy-subrc <> 0.
*ENDIF.

cl_demo_output=>display( flights ).
