*&---------------------------------------------------------------------*
*& Report z00_demo_14
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_14.

DATA flights TYPE TABLE OF sflight.

SELECT FROM sflight FIELDS * INTO @DATA(flight).
  AUTHORITY-CHECK OBJECT 'S_CARRID'
    ID 'CARRID' FIELD flight-carrid
    ID 'ACTVT' FIELD '03'.
  IF sy-subrc <> 0.
    CONTINUE.
  ENDIF.

  APPEND flight TO flights.
ENDSELECT.

cl_demo_output=>display( flights ).

WRITE lines( flights ).
