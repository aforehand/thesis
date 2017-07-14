scenario = "Classifier Training";
response_matching = simple_matching;
active_buttons = 2;
button_codes = 1,2;
default_font = "Calibri";
default_font_size = 18;
default_text_color = 100,100,100;
default_clear_active_stimuli = false;
response_logging = log_all;
write_codes = true;
pulse_width = 6;
response_port_output=true;

begin;

#intro text
text {caption = "Press the mouse when you see an image from one position back repeated. Focus only on the images at the center of the screen and do not move during the experiment.\n
	When instructed, press the mouse to begin the experiment.\n
	Good luck!"; max_text_width = 400;
} intro_text;
	
#fixation text
text{caption = "When you have focused on the letter above, click to begin the experiment"; max_text_width = 400;} fixation_text;

#feedback text
text {caption = " ";} feedback_text;

#trial beginning text
text {caption = " ";} next_trial;

#houses
array {
	LOOP $i 9;
		bitmap {filename = "house$i.png";} "house$i";
	ENDLOOP;
} houses;

#faces
array {
	LOOP $i 9;
		bitmap {filename = "face$i.png";} "face$i";
	ENDLOOP;
} faces;

#patchy face/house images
array {
	LOOP $i 10;
		bitmap {filename = "patchy$i.png";} "patchy$i";
	ENDLOOP;
} patches;

#fixation picture
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap {filename = "\letters\\A.png";}; x = -250; y = 0;
	bitmap {filename = "\letters\\A.png";}; x = 250; y = 0;
	text fixation_text; x = -250; y = -250;
	text fixation_text; x = 250; y = -250;
} fixation_pic;

#placeholder picture for n-back trial
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap {filename = "\letters\\template.png";}; x = -250; y = 0;
	bitmap {filename = "\letters\\template.png";}; x = 250; y = 0;
} n_back_pic;

#empty picture
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap {filename = "lines_small.png";}; x = -250; y = 0;
	bitmap {filename = "lines_small.png";}; x = 250; y = 0;
	bitmap {filename = "\letters\\template.png";}; x = -250; y = 0;
	bitmap {filename = "\letters\\template.png";}; x = 250; y = 0;
} default;

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
	stimulus_time_in = 1000;
} fixation_trial;

#n-back trial
trial {
	trial_type = specific_response;
	trial_type = fixed;
	terminator_button = 2;
   trial_duration = 960;
   stimulus_event {
      picture n_back_pic;
      time = 0;
      duration = 480;
      code = "n-back";
		stimulus_time_in = 100;
		stimulus_time_out = 2000;
   } n_back_event;	
} n_back_trial;

#feedback trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	stimulus_event {
		picture {
			text feedback_text;
			x = 0; y = 0;
		}feedback_pic;
		port_code = 255;
	} feedback_event;
} feedback_trial;

####################################

begin_pcl;

#variables
double scenario_time = 4.8e5;	#duration of the scenario
int n_back = 1;					#n-back value
double run_time = 1.5e4;		#duration of a run
double patchy_prop = 0.3;		#proportion of runs with a non-target category in the scenario
int blocks = 4;					#number of blocks in a scenario

#parameters not to be changed
int stim_array_length;		#number of stimuli in a trial; determined in main()
int stim_count;				#number of stimuli persented per run
int num_targs = 0;
int num_non_targs = 0;
array<int> is_target[0];
int run_count;
bool onset = true;

#last n stimuli
array<int> last_n_stims[0];
loop int x = 1 until x > n_back begin
	last_n_stims.add(0);
	x = x + 1;
end;

#for feedback
int correct_count = 0;
int false_alarm_count = 0;

#stimulus arrays to be used in trials
array<bitmap> categories[0][0];
categories.add(faces);
categories.add(houses);
categories.add(patches);

#codes denoting stimulus types
array<string> codes[3] = {"faces", "houses", "patches"};


#width of stimuli from file
input_file get_width = new input_file;
get_width.open("\logfiles\\width_setting.txt");
int width = get_width.get_int();
get_width.close();

fixation_pic.set_part_x(2, -width);
fixation_pic.set_part_x(3, width);
fixation_pic.set_part_x(4, -width);
fixation_pic.set_part_x(5, width);
n_back_pic.set_part_x(2, -width);
n_back_pic.set_part_x(3, width);
default.set_part_x(2, -width);
default.set_part_x(3, width);
default.set_part_x(4, -width);
default.set_part_x(5, width);
####################################

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
	array<int> targs[stim_count];
	array<int> targ[0];
	targ.add(random(2, stim_count));
	targs[targ[1]] = 1;
	targ.add(random_exclude(2, stim_count, targ));
	targs[targ[2]] = 1;
	if random(1, 10) > 6 then
		targ.add(random_exclude(2, stim_count, targ));
		targs[targ[3]] = 1;
	end;
	return targs
end;

#displays results
sub
	display_results
begin
	correct_count = response_manager.total_hits();
	false_alarm_count = response_manager.total_false_alarms();
	double performance = (double(correct_count) / double(num_targs)) 
		- (double(false_alarm_count) / double((stimulus_manager.stimulus_count() - num_targs)));
	string cap = "Results:";
	cap = cap + "\nNumber of Targets: " + string(num_targs); 
	cap = cap + "\nHits: " + string(correct_count);
	cap = cap + "\nFalse Alarms: " + string(false_alarm_count);
	cap = cap + "\nPercentage Correct: " + printf(performance * 100.0, "%.1f") + "%";
	cap = cap + "\nPlease call the experimenter in.\nWhen instructed, press the mouse to continue.";
	feedback_text.set_caption(cap);
	feedback_text.redraw();
	feedback_trial.present();
end;

sub
	run_n_back_trial (array<bitmap> stimuli[stim_array_length], int category)
begin
	onset = true;
	loop
		int num = 1;
	until
		num > stim_count
	begin
		int index;
		int code = category;		
		if (is_target[num] == 1) then
			index = last_n_stims[n_back];
			n_back_event.set_target_button(1);
			code = code + 100;
			num_targs = num_targs + 1;
			n_back_trial.set_clear_active_stimuli(false);
			onset = true;
		else
			index = random_exclude(1, stim_array_length, last_n_stims);
			n_back_event.set_target_button(0);
			n_back_event.set_response_active(true);
			n_back_trial.set_clear_active_stimuli(true);
			num_non_targs = num_non_targs + 1;
		end;
		n_back_event.set_port_code(code);
		n_back_event.set_event_code(string(code));
		n_back_pic.set_part(2, stimuli[index]);
		n_back_pic.set_part(3, stimuli[index]);
		#run the trial
		n_back_trial.present();
		onset = false;
		loop 
			int j = last_n_stims.count();
		until 
			j == 1 
		begin
			last_n_stims[j] = last_n_stims[j-1];
			j = j - 1;
		end;
		last_n_stims[1] = index;
		num = num + 1;
	end;
end;

#generates the order of categories
sub
	array<int, 1> make_run_order
begin
	int non_targ_count = int(floor(patchy_prop * double(run_count)));
	int targ_1_count = int(floor(double(run_count - non_targ_count) / 2.0));
	array<int> runs[0];
	loop int i = 1 until i > run_count begin
		if i <= non_targ_count then
			runs.add(3);
		elseif i <= (non_targ_count + targ_1_count) then
			runs.add(1);
		else
			runs.add(2);
		end;
		i = i + 1;
	end;
	runs.shuffle();
	return runs
end;

#initializes stuff
sub
	init
begin
	stim_count = int(ceil(run_time / double(n_back_trial.duration())));
	is_target.resize(stim_count);
	run_count = int(ceil(scenario_time / run_time));
end;

#set text for beginning run
sub
	beginning (int block)
begin
	string cap = "Block "+string(block)+" of "+string(blocks)+" beginning...";
	next_trial.set_caption(cap);
	next_trial.redraw();
	begin_trial.present();
end;

#main subroutine
sub
	main
begin
	wait_trial.present();
	fixation_trial.present();
	loop int i = 1 until i > blocks begin
		init();
		array<int> runs[run_count] = make_run_order();	
		beginning(i);
		loop int j = 1 until j > run_count begin
			is_target = is_target();
			stim_array_length = categories[runs[j]].count();
			n_back_pic.set_part(2, categories[runs[j]][1]);
			n_back_pic.set_part(3, categories[runs[j]][1]);
			run_n_back_trial(categories[runs[j]], runs[j]);
			j = j + 1;
		end;
		display_results();
		i = i + 1;
	end;
end;

main();