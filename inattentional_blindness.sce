scenario = "Testing";
response_matching = simple_matching;
active_buttons = 2;
button_codes = 1,2;
default_font = "Calibri";
default_font_size = 24;
default_text_color = 100,100,100;
default_clear_active_stimuli = false;
response_logging = log_all;
#write_codes = true;
#pulse_width = 6;
response_port_output=false;

begin;

#intro text
text {caption = "Press the mouse when you see a letter\n
	from two positions back repeated.\n
	Focus only on the letters at the center of the screen\n
	and do not move your head during the experiment.\n\n
	Press the mouse to begin the experiment.\n
	Good luck!";
} intro_text;
	
#feedback text
text {caption = " ";} feedback_text;

#trial beginning text
text {caption = "Trial beginning...";} next_trial;

#letter array
array {
	bitmap {filename = "\letters\\A.png";} A;
	bitmap {filename = "\letters\\B.png";} B;
	bitmap {filename = "\letters\\C.png";} C;
	bitmap {filename = "\letters\\D.png";} D;
	bitmap {filename = "\letters\\E.png";} E;
	bitmap {filename = "\letters\\F.png";} F;
	bitmap {filename = "\letters\\G.png";} G;
	bitmap {filename = "\letters\\H.png";} H;
	bitmap {filename = "\letters\\I.png";} I;
	bitmap {filename = "\letters\\J.png";} J;
	bitmap {filename = "\letters\\K.png";} K;
	bitmap {filename = "\letters\\L.png";} L;
	bitmap {filename = "\letters\\M.png";} M;
	bitmap {filename = "\letters\\N.png";} N;
	bitmap {filename = "\letters\\O.png";} O;
	bitmap {filename = "\letters\\P.png";} P;
	bitmap {filename = "\letters\\Q.png";} Q;
	bitmap {filename = "\letters\\R.png";} R;
	bitmap {filename = "\letters\\S.png";} S;
	bitmap {filename = "\letters\\T.png";} T;
	bitmap {filename = "\letters\\U.png";} U;
	bitmap {filename = "\letters\\V.png";} V;
	bitmap {filename = "\letters\\W.png";} W;
	bitmap {filename = "\letters\\X.png";} X;
	bitmap {filename = "\letters\\Y.png";} Y;
	bitmap {filename = "\letters\\Z.png";} Z;
} letters;

#blank box
bitmap {filename = "\letters\\Template.png";} template;

#frequency-tagged houses
array {
	LOOP $i 10;
		bitmap {filename = "\IB\\house_tag_$i.png";} "house$i";
	ENDLOOP;
} houses;

#frequency-tagged faces
array {
	LOOP $i 10;
		bitmap {filename = "\IB\\face_tag_$i.png";} "face$i";
	ENDLOOP;
} faces;

#trees
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\tree_tag_$i.png";} "tree_$i";
	ENDLOOP;
} trees;

#drinks
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\drink_tag_$i.png";} "drink_$i";
	ENDLOOP;
} drinks;

#cakes
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\cake_tag_$i.png";} "cake_$i";
	ENDLOOP;
} cakes;

#boxes
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\box_tag_$i.png";} "box_$i";
	ENDLOOP;
} boxes;

#tree-drink transition
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\tree_drink_$i.png";} "tree-drink$i";
	ENDLOOP;
} trees_drinks;

#drink-cake transition
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\drink_cake_$i.png";} "drink-cake$i";
	ENDLOOP;
} drinks_cakes;

#cake-box transition
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\cake_box_$i.png";} "cake-box$i";
	ENDLOOP;
} cakes_boxes;

#box-house transition
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\box_house_$i.png";} "box-house$i";
	ENDLOOP;
} boxes_houses;

#helmet-face transition
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\helmet_face_$i.png";} "helmet-face$i";
	ENDLOOP;
} helmets_faces;

#face-house transitions
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\face_house_$i.png";} "face-house$i";
	ENDLOOP;
} faces_houses;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\f_h_alt_$i.png";} "face-house-alt$i";
	ENDLOOP;
} faces_houses_alt;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\f_h_dif_$i.png";} "face-house-dif$i";
	ENDLOOP;
} faces_houses_dif;

#house-face transition
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\house_face_$i.png";} "house-face$i";
	ENDLOOP;
} houses_faces;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\h_f_alt_$i.png";} "house-face-alt$i";
	ENDLOOP;
} houses_faces_alt;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\h_f_dif_$i.png";} "house-face-dif$i";
	ENDLOOP;
} houses_faces_dif;

#placeholder image 
bitmap {filename = "placeholder.png";} placeholder;

#fixation mark
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap {filename = "fixation.png";}; x = 0; y = 0;
} fixation_pic;

#trial picture
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap placeholder; x = 0; y = 0;
	bitmap placeholder; x = 0; y = 0;
} trial_pic;

#wait trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture {
		text intro_text;
		x = 0; y = 0;
	};
} wait_trial;

#trial beginning
trial {
	trial_duration = 1000;
	trial_type =fixed;
	picture {
		text next_trial;
		x = 0; y = 0;
	};
} begin_trial;

#fixation trial
trial {
	trial_duration = 1000;
	trial_type = fixed;
	picture fixation_pic;
} fixation_trial;

#stimulus trial; variable duration
trial {
	trial_type = specific_response;
	trial_type = fixed;
	terminator_button = 2;
	stimulus_event {
		picture trial_pic;
		port_code = 1;
		stimulus_time_in = 100;
		stimulus_time_out = 2000;
	} stim_event;
} stim_trial;

#feedback trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture {
		text feedback_text;
		x = 0; y = 0;
	}feedback_pic;
} feedback_trial;

##############################################################################
begin_pcl;
##############################################################################

#variables
double scenario_time = 4.8e5;		#length of the scenario in ms: 6e5=10mins;4.8e5=8mins;1.2e5=2mins 
double before_trans_time = 5.8e4;#time before switching from the non-target images in ms
double image_dur_time = 1.5e3;	#duration of each image
double target_prop = 0.2;			#proportion of targets in a trial
int n_back = 2;						#n-back value

##############################################################################
#parameters that should not be changed
int difficulty;			#diffidulty setting determined in training phase	
int letter_dur;			#duration of one letter's presentation
int total_dur; 			#duration of letter and blank
int stim_count;			#number of letters per run
int before_trans;			#number of letters shown before switching from the non-target image
int image_dur;				#number of letters to appear with each image

#trial durations
int a_dur = 118;	#duration of transitions, 8.3 Hz
int b_dur = 78;	#duration of frequency-tagged image b, 12.5 Hz
int c_dur = 58;	#duration of frequency-tagged image c, 16.67 Hz
int d_dur = 38;	#duration of initial iamges, 25 Hz

#indexing parameters
int trans_index = 1;		#keeps track of the index of the transition array
int stim_index = 1;		#keeps track of how many letters have appeared with the current image
int switcher_init = 3;	#initial value of the switcher in each block
int switcher = 0;			#rotates among the tagged images and transitions
int trans_dur = 20;		#number of images in each transition
int index = 1;				#letter index
int run = 1;			

#stimuli and image parameters
int num_targs;				#number of targets presented so far
int num_non_targs;		#number of non-targets presented so far
bool first_trans;			#
array<int> is_target[0]; #array of target positions
array<int> last_image[1] = {1};
int current_image = 1;
array<int> codes[2];
bool onset = true;
array<int> trans_set[1] = {1};

#pre-trans parameters
bool img = true;
bool increment = true;
bool can_break = false;
int pre_trans_index = 1;

#last n stimuli
array<int> last_n_stims[0];
loop int x = 1 until x > n_back begin
	last_n_stims.add(0);
	x = x + 1;
end;

#event codes
int non_target = 1;
int b_ho = 2;
int house = 3;
int ho_f = 4;
int face = 5;
int f_ho = 6;

#for feedback
int correct_count = 0;
int false_alarm_count = 0;

#non-target images
array<bitmap> non_targets[0][0];
non_targets.add(trees);
non_targets.add(drinks);
non_targets.add(cakes);
non_targets.add(boxes);

#non-target transitions
array<bitmap> non_target_trans[0][0];
non_target_trans.add(trees_drinks);
non_target_trans.add(drinks_cakes);
non_target_trans.add(cakes_boxes);

#face-house transitions
array<bitmap> face_house_trans[0][0];
face_house_trans.add(faces_houses);
face_house_trans.add(faces_houses_alt);
face_house_trans.add(faces_houses_dif);

#house-face transitions
array<bitmap> house_face_trans[0][0];
house_face_trans.add(houses_faces);
house_face_trans.add(houses_faces_alt);
house_face_trans.add(houses_faces_dif);

##############################################################################
#subroutines
##############################################################################

#generates random stimulus array index
sub
   int random_exclude(int first, int last, array<int> exclude[n_back])
begin
   int rval = random(first, last - 1);
	loop 
		int i = 1; 
	until 
		i > exclude.count()
	begin
		if rval == exclude[i] then
			rval = random_exclude(first, last, exclude);
			i = 1;
		else
			i = i + 1;
		end;
	end;
   return rval
end;

#generates an array of target positions
sub 
	array<int, 1> is_target
begin
	array<int> targs[0];
	loop int i = 1 until i > (before_trans + stim_count) begin
		if i <= int(floor(double(before_trans + stim_count) * target_prop)) then
			targs.add(1);
		else
			targs.add(0);
		end;
		i = i + 1;
	end;
	loop int i = 1 until i > n_back begin
		if targs[i] == 0 then
			i = i + 1;
		else
			targs.shuffle();
			i = 1;
		end;
	end;
	return targs
end;	

#runs a trial
sub
	do_trial(int phase, array<bitmap> stimuli[20], array<bitmap> next_images[3])
begin
	trial_pic.set_part(3, letters[index]);	
	loop 
		int j = 1;
	until 
		j > (total_dur / letter_dur)
	begin
		loop 
			int k = 1; 
		until 
			k > (letter_dur / stim_trial.duration())
		begin
			if phase == 1 then #distractor images
				current_image = random_exclude(1, 4, last_image);
			elseif phase == 2 then #distractor transitions
				if trans_index < 1 then
					current_image = 1;
				else
					current_image = trans_index;
				end;
				trans_index = trans_index - 1;
			elseif phase == 3 then #face-house transitions
				if trans_index > trans_dur then
					current_image = trans_dur;
				else
					current_image = trans_index;
				end;
				trans_index = trans_index + 1;
			else #face and house images
				current_image = random_exclude(1, 10, last_image);
			end;	
			trial_pic.set_part(2, stimuli[current_image]);
			if ((trans_index < 1) || (trans_index > trans_dur)) && (phase != 1) then
				current_image = random_exclude(1, 3, last_image);
				trial_pic.set_part(2, next_images[current_image]);
			end;
			stim_trial.present();
			if k == 1 && j == 1 then
				stim_event.set_target_button(0);
				stim_event.set_event_code("");
			end;
			last_image[1] = current_image;
			k = k + 1;
		end;
		if j == 1 then
			trial_pic.set_part(3, template);
		end;
		j = j + 1;	
	end;	
end;

#sets event codes and target stuff
sub
	set_codes(int target)  
begin
	if (target == 1) then
		index = last_n_stims[n_back];
		num_targs = num_targs + 1; 
		stim_event.set_target_button(1);
		stim_event.set_stimulus_time_out(2000);
		onset = true;
	else
		index = random_exclude(1, 26, last_n_stims);
		stim_event.set_target_button(0);
		stim_event.set_response_active(true);
		stim_event.set_stimulus_time_out(total_dur);
		num_non_targs = num_non_targs + 1;
	end;
	int code = codes[run];
	if stim_trial.duration() == b_dur then
		code = code + 10;
	elseif stim_trial.duration() == c_dur then
		code = code + 20;
	end;
	if target == 1 then
		code = code + 100;
	end;
	if onset then
		stim_event.set_port_code(code);
	else
		stim_event.set_port_code(0);
	end;
	stim_event.set_event_code(string(code)+","+string(index));
end;

#does the things
sub
	do_the_things(int dur, int code_1, int code_2, int phase, 
		array<bitmap> images[20], array<bitmap> next_images[3], int i)
begin
	stim_trial.set_duration(dur);
	codes[1] = code_1;
	codes[2] = code_2;
	set_codes(is_target[i]);
	do_trial(phase, images, next_images);
end;

#updates parameters for main loop
sub
	update_loop_parameters(bool main_loop)
begin
	if main_loop then
		if ((stim_index > image_dur) || (trans_index > trans_dur)) then
			stim_index = 1;
			trans_index = 1;
			trans_set[1] = random_exclude(1, 4, trans_set);
			first_trans = false;
			switcher = mod((switcher + 1), 4);
			onset = true;
		end;
	else
		if increment then
			if stim_index > image_dur then
				stim_index = 1;
				trans_index = 1;
				img = false;
			end;
			if trans_index > trans_dur then
				trans_index = 1;
				pre_trans_index = pre_trans_index + 1;
				if pre_trans_index == non_targets.count() then
					increment = false;	
				end;	
				img = true;
			end;
		else
			if stim_index > image_dur then
				stim_index = 1;
				trans_index = trans_dur;
				img = false;
				if pre_trans_index == non_targets.count() then
					can_break = true;	
				end;
				pre_trans_index = pre_trans_index - 1;
			end;
			if trans_index < 1 then
				trans_index = trans_dur;
				if pre_trans_index == 1 then
					increment = true;
				end;
				img = true;
			end;
		end;
	end;
	loop 
		int j = last_n_stims.count();
	until 
		j == 1 
	begin
		last_n_stims[j] = last_n_stims[j-1];
		j = j - 1;
	end;
	last_n_stims[1] = index;
end;

#displays results
sub
	display_results
begin
	correct_count = response_manager.total_hits();
	false_alarm_count = response_manager.total_false_alarms();
	double performance = double(correct_count - false_alarm_count) / double(num_targs);
	string cap = "Results:";
	cap = cap + "\nNumber of Targets: " + string(num_targs); 
	cap = cap + "\nHits: " + string(correct_count);
	cap = cap + "\nFalse Alarms: " + string(false_alarm_count);
	cap = cap + "\nPercentage Correct: " + printf(performance * 100.0, "%.1f") + "%";
	cap = cap + "\nPress the mouse to continue.";
	feedback_text.set_caption(cap);
	feedback_text.redraw();
	feedback_trial.present();
end;

#displays the non-target images
sub
	pre_trans
begin
	loop int i = 1 until (i > before_trans) && can_break begin
		can_break = false;
		if img then
			do_the_things(d_dur, non_target, non_target, 1, non_targets[pre_trans_index], non_targets[pre_trans_index], i);
			stim_index = stim_index + 1;
		else
			if increment then
				do_the_things(a_dur, non_target, non_target, 3, non_target_trans[pre_trans_index], 
					non_targets[pre_trans_index + 1], i);
				trans_index = trans_index + 1;
			else
				do_the_things(a_dur, non_target, non_target, 2, non_target_trans[pre_trans_index],
					non_targets[pre_trans_index], i);
				trans_index = trans_index - 1;
			end;
		end;
		onset = false;
		update_loop_parameters(false);
		i = i + 1;
	end;
	trans_index = 1;
end;

#performs one run of target trials
sub
	do_run (array<bitmap> trans_1[trans_dur],
		array<bitmap> images_b[10], 
		array<bitmap> trans_2[3][trans_dur], 
		array<bitmap> images_c[10],
		array<bitmap> trans_3[3][trans_dur])
begin
	#Initial images
	pre_trans();
	loop
		int i = before_trans + 1;
	until
		i > (before_trans + stim_count)
	begin	
		#First transition
		if first_trans then
			do_the_things(a_dur, b_ho, b_ho, 3, trans_1, images_b, i);
		#First Stimulus	
		elseif switcher == 0 then 
			do_the_things(b_dur, face, house, 4, images_b, images_b, i);
			stim_index = stim_index + 1;		
		#Second transition
		elseif switcher == 1 then
			do_the_things(a_dur, f_ho, ho_f, 3, trans_2[trans_set[1]], images_c, i);	
		#Second Stimulus
		elseif switcher == 2 then 
		stim_trial.set_duration(c_dur);
			do_the_things(c_dur, house, face, 4, images_c, images_c, i);
			stim_index = stim_index + 1;		
		#Third transition
		elseif switcher == 3 then
			do_the_things(a_dur, ho_f, f_ho, 3, trans_3[trans_set[1]], images_b, i);
		end;	
		onset = false;
		update_loop_parameters(true);
		i = i + 1;
		if i == (before_trans + int(double(stim_count) / 2.0)) then
			run = 2;
		end;
	end;	
	display_results();
end;

#calculates the maximum of two numbers
sub
	double max(double num_1, double num_2)
begin
	double max;
	if num_1 >= num_2 then
		max = num_1;
	else
		max = num_2;
	end;
	return max;
end;

#initializes parameters
sub
	init
begin
	num_targs = 0;
	num_non_targs = 0;
	first_trans = true;
	is_target.resize(before_trans+stim_count);
	is_target = is_target();
	correct_count = 0;
	false_alarm_count = 0;
	switcher = switcher_init;
end;

#converts timing variables into letter count variables
sub
	get_counts
begin
	stim_count = int(floor(scenario_time / double(total_dur)));
	before_trans = int(floor(before_trans_time / double(total_dur)));
	image_dur = int(max(floor(image_dur_time / double(total_dur)), 1.0));
end;

#main
sub
	main
begin
	input_file in = new input_file;
	in.open("\logfiles\\difficulty.txt");
	letter_dur = int(in.get_line());
	total_dur = int(in.get_line());	
	in.close();
	get_counts();
	init();	
	run = 1;
	wait_trial.present();
	begin_trial.present();
	fixation_trial.present();
	do_run(boxes_houses, houses, house_face_trans, faces, face_house_trans)
end;

main();
	
