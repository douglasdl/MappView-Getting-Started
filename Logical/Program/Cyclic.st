
PROGRAM _CYCLIC
	IF Heating THEN
		Speed := Speed + 1;
		IF Speed >= 100 THEN
			Heating := FALSE;
		END_IF
	ELSE
		Speed := Speed - 1;
		IF Speed <= 0 THEN
			Heating := TRUE;
		END_IF
	END_IF
END_PROGRAM