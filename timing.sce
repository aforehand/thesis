scenario = "Timing";

begin;

#empty picture
picture {bitmap {filename = "lines.png";}; x = 0; y = 0;} default;

#frequency-tagged faces
array {
	LOOP $i 10;
		picture {
			bitmap {filename = "\IB\\face_tag_$i.png";} "face$i";
			x = 0; y = 0;
		} "pic$i";
	ENDLOOP;
} faces;

#trial beginning
trial {
	#trial_duration = 1000;
	trial_type = fixed;
	LOOP $i 10;
		stimulus_event {
			picture "pic$i";
			duration = 10;
			delta_time = 10;
			code = "pic$i";
		};
	ENDLOOP;
} main_trial;

#######################################
#######################################

begin_pcl;


loop int i = 1; until i > 100	begin					
	loop int j = 1; until j > 20 begin
		loop int k = 1; until k > 5 begin	
			k = k + 1;
		end;
		j = j + 1;	
	end;	
	i = i + 1;
	main_trial.present();
end;

