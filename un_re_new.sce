scenario = "Unattended Replay";
response_matching = simple_matching;
active_buttons = 2;
button_codes = 1,2; #11=house,13=face,15=patchy,2=esc CONFIRM
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
text {caption = "Press the mouse when you see a letter
	from two positions back repeated.
	Focus only on the letters at the center of the screen
	and do not move during the experiment.\n
	When instructed, press the mouse to begin the experiment.\n
	Good luck!"; max_text_width = 1000;
} intro_text;
	
#feedback text
text {caption = " ";} feedback_text;

#trial beginning text
text {caption = "Trial beginning...";} next_trial;

#end of trial text
text {caption = "Finished!\nPlease wait for further instructions.";} end_text;

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

#template
bitmap {filename = "\letters\\template.png";} template;

#frequency-tagged houses
array {
	LOOP $i 10;
		bitmap {filename = "\main experiment\\house_tag_$i.png";} "house$i";
	ENDLOOP;
} houses;

#frequency-tagged faces
array {
	LOOP $i 10;
		bitmap {filename = "\main experiment\\face_tag_$i.png";} "face$i";
	ENDLOOP;
} faces;

#face-house transition
array {
	LOOP $i 19;
		bitmap {filename = "\main experiment\\face_house_$i.png";} "face-house$i";
	ENDLOOP;
} faces_houses;

#house-face transition
array {
	LOOP $i 19;
		bitmap {filename = "\main experiment\\house_face_$i.png";} "house-face$i";
	ENDLOOP;
} houses_faces;

#frequency-tagged boxes
array {
	LOOP $i 10;
		bitmap {filename = "\main experiment\\box_tag_$i.png";} "box$i";
	ENDLOOP;
} boxes;

#frequency-tagged helmets
array {
	LOOP $i 10;
		bitmap {filename = "\main experiment\\helmet_tag_$i.png";} "helmet$i";
	ENDLOOP;
} helmets;

#box-helmet transitions
array {
	LOOP $i 19;
		bitmap {filename = "\main experiment\\box_helmet_$i.png";} "box-helmet$i";
	ENDLOOP;
} boxes_helmets;

#helmet-box transitions
array {
	LOOP $i 19;
		bitmap {filename = "\main experiment\\helmet_box_$i.png";} "helmet-box$i";
	ENDLOOP;
} helmets_boxes;

#helmet-face transitions
array {
	LOOP $i 49;
		bitmap {filename = "\main experiment\\helmet_face_$i.png";} "helmet-face$i";
	ENDLOOP;
} helmets_faces;
array {
	LOOP $i 49;
		bitmap {filename = "\main experiment\\helmet_face_alt_$i.png";} "helmet-face-alt$i";
	ENDLOOP;
} helmets_faces_alt;
array {
	LOOP $i 49;
		bitmap {filename = "\main experiment\\helmet_face_dif_$i.png";} "helmet-face-dif$i";
	ENDLOOP;
} helmets_faces_dif;

#box-house transitions
array {
	LOOP $i 49;
		bitmap {filename = "\main experiment\\box_house_$i.png";} "box-house$i";
	ENDLOOP;
} boxes_houses;
array {
	LOOP $i 49;
		bitmap {filename = "\main experiment\\box_house_alt_$i.png";} "box-house-alt$i";
	ENDLOOP;
} boxes_houses_alt;
array {
	LOOP $i 49;
		bitmap {filename = "\main experiment\\box_house_dif_$i.png";} "box-house-dif$i";
	ENDLOOP;
} boxes_houses_dif;

#placeholder image 
bitmap {filename = "lines_small.png";} placeholder;

#fixation mark
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap template; x = -250; y = -50;
	bitmap template; x = 250; y = -50;
} fixation_pic;

#trial picture
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap placeholder; x = -250; y = 0;
	bitmap template; x = -250; y = -50;
	bitmap placeholder; x = 250; y = 0;
	bitmap template; x = 250; y = -50;
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
	trial_duration = forever;
	trial_type = first_response;
	picture fixation_pic;
} fixation_trial;

#stimulus trial; variable duration
trial {
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

#end trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	stimulus_event{
		picture {
			text end_text;
			x = 0; y = 0;
		} end_pic;
		port_code = 255;
	} end_event;
} end_trial;

##############################################################################
begin_pcl;
##############################################################################

#variables
double scenario_time = 3.0e4;#2.4e5;		#length of the scenario in ms: 6e5=10mins;4.8e5=8mins;1.2e5=2mins 
double before_trans_time = 1.0e4;#5.8e4;#time before switching from the non-target images in ms
double target_prop = 0.2;			#proportion of targets in a trial
int n_back = 2;						#n-back value

##############################################################################

#trial durations
int b_dur = 78;	#duration of frequency-tagged image b, 12.5 Hz
int c_dur = 58;	#duration of frequency-tagged image c, 16.67 Hz
int gcd = 18; 		#greatest common demominator of b_dur and c_dur

#letter timing
int letter_dur;
int total_dur;

input_file in = new input_file;

#stimuli and image parameters
array<int> last_image[1] = {1};
int image = 1;

int last_code = 1;
int this_time = 0;
int next_time = 0;
int this_code = 0;
int next_code = 0;

int face_mod = 0;
int house_mod = 0;
int trans_mod = 5;

#weights the random walk
int weight = 0;

#stimuli and image parameters
int num_targs;				#number of targets presented so far
int num_non_targs;		#number of non-targets presented so far
array<int> is_target[0]; #array of target positions
int trans_length = 49;


#last n stimuli
array<int> last_n_stims[0];
loop int x = 1 until x > n_back begin
	last_n_stims.add(1);
	x = x + 1;
end;

#last n stimuli
array<int> last_n_letters[0];
loop int x = 1 until x > n_back begin
	last_n_letters.add(1);
	x = x + 1;
end;

#for feedback
int correct_count = 0;
int false_alarm_count = 0;
int total_hits = 0;
int total_fas = 0;

#event codes
int box_img = 1;
int helmet = 2;
int house = 3;
int face = 4;

#face-house transitions
array<bitmap> box_house_trans[0][0];
box_house_trans.add(boxes_houses);
box_house_trans.add(boxes_houses_alt);
box_house_trans.add(boxes_houses_dif);

#house-face transitions
array<bitmap> helmet_face_trans[0][0];
helmet_face_trans.add(helmets_faces);
helmet_face_trans.add(helmets_faces_alt);
helmet_face_trans.add(helmets_faces_dif);

int trans_set_count = box_house_trans.count();

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
	array<int, 1> is_target(int letter_count)
begin
	array<int> targs[0];
	loop int i = 1 until i > letter_count begin
		if i <= int(floor(double(letter_count) * target_prop)) then
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

#returns the transition index according to the number of time steps available
sub
	int get_trans_index(int index, int time_steps, bool same_side)
begin
	int difference = 1;
	if ((time_steps > (19 - index)) && !same_side) || ((time_steps >= index) && same_side) then
		if (index > 7) && (index < 13) then
			int chance = random(1, 10);
			if abs(weight) < chance then
				difference = last_n_stims[1];
			elseif chance >= 2 then
				difference = int(-double(weight)/double(abs(weight)));
			else
				difference = last_n_stims[1];
			end;
			weight = weight + difference;
		elseif (index >= 14) then
			difference = -1;
		else
			difference = 1;
		end;	
	elseif same_side then
		if time_steps < index then
			difference = -2;
		else
			difference = -1;
		end;
	else
		if (time_steps <= (19 - index)) then
			difference = 2;
		else
			difference = 1;
		end;
	end;
	index = index + difference;
	if index > 19 then
		index = 19;
	elseif index < 1 then
		index = 1;
	end;
	#keeps track of the last several moves
	loop 
		int j = last_n_stims.count();
	until 
		j == 1 
	begin
		last_n_stims[j] = last_n_stims[j-1];
		j = j - 1;
	end;
	last_n_stims[1] = difference;
	
	return index;
end;

#runs a trial
sub
	do_run(int run, int before_trans, int duration, array<bitmap> non_targs[2][10], 
		array<bitmap> non_targ_trans[2][19], array<bitmap> transitions[2][trans_set_count][trans_length], 
		array<bitmap> targets[2][10], array<bitmap> targ_trans[2][19])
begin
	#int last_response = response_manager.last_response();
	array<bitmap> images[2][10] = non_targs;
	array<bitmap> trans_imgs[2][19] = non_targ_trans;
	bool transitioned = false;
	int trans_index = 1;
	int trans_set = 1;
	int letter_index = 1;
	int letter_counter = 1;
	string file = "\logfiles\\attended_log_"+string(run)+".txt";
	in.open(file);
	this_time = in.get_int();
	this_code = in.get_int();
	next_time = in.get_int();
	next_code = in.get_int();
	int time_steps = int(double(next_time - this_time) / double(trans_mod));
	if run == 1 then
		face_mod = 4;
		house_mod = 3;
	else
		face_mod = 3;
		house_mod = 4;
	end;	
	loop 
		int k = 1; 
	until 
		k > duration
	begin
		if k > before_trans then
			images = targets;
			trans_imgs = targ_trans;
		end;
		#change image
		if next_time < k then
			last_code = this_code;
			this_time = next_time;
			this_code = next_code;
			next_time = in.get_int();
			next_code = in.get_int();
			if next_time == 0 then 
				break;
			end;
			trans_index = 1;
			time_steps = int(double(next_time - this_time) / double(trans_mod));
		end;
		#target and non-target images
		if transitioned || (k <= before_trans) then
			if 
				((this_code == 1) && (mod(k,face_mod) == 0)) ||
				((this_code == 2) && (mod(k,house_mod) == 0))	
			then
				image = random_exclude(1, 10, last_image);
				trial_pic.set_part(2, images[this_code][image]);
				trial_pic.set_part(4, images[this_code][image]);
			elseif 
				((this_code == 3) || (this_code == 4)) && 
				(mod(k,trans_mod) == 0) 
			then
				trans_index = get_trans_index(trans_index,time_steps,last_code==next_code);
				trial_pic.set_part(2, trans_imgs[this_code - 2][trans_index]);
				trial_pic.set_part(4, trans_imgs[this_code - 2][trans_index]);
				time_steps = time_steps - 1;
			end;
		#main transition
		elseif mod(k,trans_mod) == 0 then
			trial_pic.set_part(2, transitions[next_code][trans_set][trans_index]);
			trial_pic.set_part(4, transitions[next_code][trans_set][trans_index]);
			trans_index = trans_index + 1;
			trans_set = trans_set + 1;
			if mod(trans_set,4) == 0 then
				trans_set = 1;
			end;
			if trans_index > trans_length then
				transitioned = true;
			end;
		end;
		if mod(k,total_dur) == 0 then
			if is_target[letter_counter] == 1 then
				letter_index = last_n_letters[n_back];
				num_targs = num_targs + 1; 
				stim_event.set_target_button(1);
				stim_event.set_stimulus_time_out(2000);
			else
				letter_index = random_exclude(1, 26, last_n_letters);
				num_non_targs = num_non_targs + 1; 
				stim_event.set_target_button(0);
				stim_event.set_response_active(true);
				stim_event.set_stimulus_time_out(total_dur*gcd);
			end;
			trial_pic.set_part(3, letters[letter_index]);
			trial_pic.set_part(5, letters[letter_index]);
			letter_counter = letter_counter + 1;
			loop 
				int j = last_n_letters.count();
			until 
				j == 1 
			begin
				last_n_letters[j] = last_n_letters[j-1];
				j = j - 1;
			end;
			last_n_letters[1] = letter_index;
		end;
		if mod(k,total_dur) == letter_dur then
			trial_pic.set_part(3, template);
			trial_pic.set_part(5, template);
		end;
		stim_trial.present();		
		if mod(k,total_dur) == 0 then
			stim_event.set_target_button(0);
			stim_event.set_event_code("");
			stim_event.set_port_code(0);
		end;	
		k = k + 1;
	end;	
	in.close();
end;


#displays results
sub
	display_results
begin
	correct_count = response_manager.total_hits() - total_hits;
	false_alarm_count = response_manager.total_false_alarms() - total_fas;
	double performance = double(correct_count - false_alarm_count) / double(num_targs);
	string cap = "Results:";
	cap = cap + "\nNumber of Targets: " + string(num_targs); 
	cap = cap + "\nHits: " + string(correct_count);
	cap = cap + "\nFalse Alarms: " + string(false_alarm_count);
	cap = cap + "\nPercentage Correct: " + printf(performance * 100.0, "%.1f") + "%";
	cap = cap + "\n\nPlease call the experimenter in.\nWhen instructed, press the mouse to continue.";
	feedback_text.set_caption(cap);
	feedback_text.redraw();
	feedback_trial.present();
	total_hits = total_hits + correct_count;
	total_fas = total_fas + false_alarm_count;
	num_targs = 0;
	num_non_targs = 0;
end;

#main
sub
	main
begin
	input_file difficulty = new input_file;
	difficulty.open("\logfiles\\difficulty.txt");
	letter_dur = int(difficulty.get_line()) / gcd;
	total_dur = int(difficulty.get_line()) / gcd;	
	difficulty.close();
	wait_trial.present();
	int duration = int(scenario_time) / gcd;
	int before_trans = int(before_trans_time) / gcd;
	array<bitmap> non_targs[0][0];
	array<bitmap> non_targ_trans[0][0];
	array<bitmap> targs[0][0];
	array<bitmap> targ_trans[0][0];
	array<bitmap> trans[0][0][0];
	is_target.resize(duration / total_dur);
	is_target = is_target(is_target.count());
	loop int i = 1 until i > 2 begin
		begin_trial.present();
		fixation_trial.present();
		non_targs.add(boxes);
		non_targs.add(helmets);
		non_targ_trans.add(boxes_helmets);
		non_targ_trans.add(helmets_boxes);
		trans.add(box_house_trans);
		trans.add(helmet_face_trans);
		targs.add(houses);
		targs.add(faces);	
		targ_trans.add(houses_faces);
		targ_trans.add(faces_houses);	
		do_run(i, before_trans, duration, non_targs, non_targ_trans, trans, targs, targ_trans);
		display_results();
		i = i + 1;
	end;
	end_trial.present();
end;

main();
	
