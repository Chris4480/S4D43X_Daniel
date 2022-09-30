*&---------------------------------------------------------------------*
*& Report z00_abapcds_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abapcds_09.

PARAMETERS p_deadl TYPE dats.

DATA bookings TYPE TABLE OF z00_bookingafterdeadline.

IF p_deadl IS INITIAL.
  p_deadl = sy-datum.
ENDIF.

SELECT FROM z00_bookingafterdeadline( pdeadline = @p_deadl )
 FIELDS *
 ORDER BY flightdate
 INTO TABLE @bookings
 UP TO 100 ROWS.
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( bookings ).
