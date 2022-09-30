*&---------------------------------------------------------------------*
*& Report z00_demo_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_13.

SELECT FROM z00_demo12
 FIELDS carrid, connid, \_carrier-carrname, cityfrom, cityto
 INTO TABLE @DATA(connections)
 UP TO 100 ROWS.
IF sy-subrc <> 0.
ENDIF.

cl_demo_output=>display( connections ).
