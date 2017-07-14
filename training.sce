scenario = "Training";
response_matching = simple_matching;
active_buttons = 2;
button_codes = 1,2;
default_font = "Calibri";
default_font_size = 24;
default_text_color = 100,100,100;
default_clear_active_stimuli = false;
response_logging = log_all;
write_codes = true;
pulse_width = 6;
response_port_output=false;

begin;

#intro text
text {caption = "Press the mouse when you see a letter\n
	from two positions back repeated.\n
	Focus only on the letters at the center of the screen\n
	and do not move during the experiment.\n\n
	You must score between 70% and 80% accuracy\n
	to complete the training phase.\n
	When instructed, press the mouse to begin the experiment.\n
	Good luck!";
} intro_text;
	
#feedback text
text {caption = " ";} feedback_text;

#trial beginning text
text {caption = "Trial beginning...";} next_trial;

#end text
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

#blank box
bitmap {filename = "\letters\\Template.png";} template;


#books
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\book_tag_$i.png";} "book$i";
	ENDLOOP;
} books;

#boxes
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\box_tag_$i.png";} "box_$i";
	ENDLOOP;
} boxes;

#cakes
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\cake_tag_$i.png";} "cake_$i";
	ENDLOOP;
} cakes;

#cars
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\car_tag_$i.png";} "car_$i";
	ENDLOOP;
} cars;

#drinks
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\drink_tag_$i.png";} "drink_$i";
	ENDLOOP;
} drinks;

#flowers
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\flower_tag_$i.png";} "flower$i";
	ENDLOOP;
} flowers;

#helmets
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\helmet_tag_$i.png";} "helmet_$i";
	ENDLOOP;
} helmets;

#laptops
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\laptop_tag_$i.png";} "laptop_$i";
	ENDLOOP;
} laptops;

#octopuses
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\octopus_tag_$i.png";} "octopus_$i";
	ENDLOOP;
} octopuses;

#penguins
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\penguin_tag_$i.png";} "penguin_$i";
	ENDLOOP;
} penguins;

#shoes
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\pointe_shoes_tag_$i.png";} "shoes_$i";
	ENDLOOP;
} shoes;

#trees
array {
	LOOP $i 3;
		bitmap {filename = "\IB\\training\\tree_tag_$i.png";} "tree_$i";
	ENDLOOP;
} trees;

#transitions
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\cake_box_$i.png";} "cake-box$i";
	ENDLOOP;
} cakes_boxes;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\box_book_$i.png";} "box-book$i";
	ENDLOOP;
} boxes_books;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\book_laptop_$i.png";} "book-laptop$i";
	ENDLOOP;
} books_laptops;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\laptop_penguin_$i.png";} "laptop-penguin$i";
	ENDLOOP;
} laptops_penguins;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\penguin_shoes_$i.png";} "penguin-shoes$i";
	ENDLOOP;
} penguins_shoes;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\shoes_car_$i.png";} "shoes-car$i";
	ENDLOOP;
} shoes_cars;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\car_octopus_$i.png";} "car-octopus$i";
	ENDLOOP;
} cars_octopuses;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\octopus_helmet_$i.png";} "octopus-helmet$i";
	ENDLOOP;
} octopuses_helmets;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\helmet_flower_$i.png";} "helmet-flower$i";
	ENDLOOP;
} helmets_flowers;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\flower_tree_$i.png";} "flower-tree$i";
	ENDLOOP;
} flowers_trees;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\tree_drink_$i.png";} "tree-drink$i";
	ENDLOOP;
} trees_drinks;
array {
	LOOP $i 20;
		bitmap {filename = "\IB\\transitions\\drink_cake_$i.png";} "drink-cake$i";
	ENDLOOP;
} drinks_cakes;

#placeholder image 
bitmap {filename = "placeholder.png";} placeholder;

#fixation mark
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap {filename = "fixation.png";} fixation;
	x = 0; y = 0;
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
	trial_duration = 2000;
	trial_type = fixed;
	picture fixation_pic;
} fixation_trial;

#main trial; 
trial {
	trial_type = specific_response;
	trial_type = fixed;
	terminator_button = 2;
	stimulus_event {
		picture trial_pic;
		stimulus_time_in = 100;
		stimulus_time_out = 2000;
	} main_event;
} main_trial;

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

double target_prop = 0.2;		#proportion of targets in a trial
int n_back = 2;
double run_time = 2.4e5;		#duration of a run
double image_dur_time = 1.5e3;#duration of each image
array<int> difficulties[8][2] = {{960, 1920}, {840, 1680}, {720, 1440}, 
	{600, 1200}, {480, 960}, {360, 720}, {240, 720}, {240, 480}}; 
int letter_dur;		#duration of one letter's presentation
int total_dur; 		#duration of letter and blank

#parameters that should not be changed
int stim_index = 1;			#keeps track of how many letters have appeared with the current image
int switcher = 0;				#rotates among the tagged images and transitions
int trans_dur = 20;			#number of images in each transition
int current_index;
int trans_index = 1;	#keeps track of the index of the transition array
array<int> last_image[1];
int current_image = 1;
int stim_count;	#number of letters persented per run
int image_dur;	#number of letters to appear with each image

int dur_a = 118;	#duration of transition
int dur_b = 38;	#duration of tagged images

#last n stimuli
array<int> last_n_stims[0];
loop int x = 1 until x > n_back begin
	last_n_stims.add(0);
	x = x + 1;
end;

#for feedback
int correct_count = 0;
int false_alarm_count = 0;
int total_hits = 0;
int total_fas = 0;

#image array
array<bitmap> images[0][0];
images.add(cakes);
images.add(boxes);
images.add(books);
images.add(laptops);
images.add(penguins);
images.add(shoes);
images.add(cars);
images.add(octopuses);
images.add(helmets);
images.add(flowers);
images.add(trees);
images.add(drinks);

#transition array
array<bitmap> transitions[0][0];
transitions.add(cakes_boxes);
transitions.add(boxes_books); 
transitions.add(books_laptops);
transitions.add(laptops_penguins);
transitions.add(penguins_shoes);
transitions.add(shoes_cars);
transitions.add(cars_octopuses);
transitions.add(octopuses_helmets);
transitions.add(helmets_flowers);
transitions.add(flowers_trees); 
transitions.add(trees_drinks); 
transitions.add(drinks_cakes);

current_index = random(1, images.count());

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
	array<int, 1 > is_target
begin
	array<int> targs[stim_count];
	loop int i = 1 until i > int(floor(double(stim_count) * target_prop)) begin
		targs[i] = 1;
		i = i + 1
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

sub
	run_n_back_trial(int run)
begin
	int num_targs = 0;
	int num_non_targs = 0;
	array<int> is_target[stim_count] = is_target();
	loop
		int i = 1;
	until
		i > stim_count
	begin
		int index;
		int code = 1;
		if (is_target[i] == 1) then
			index = last_n_stims[n_back];
			main_event.set_target_button(1);
			main_event.set_stimulus_time_out(2000);
			num_targs = num_targs + 1; 
			code = code + 100;
		else
			index = random_exclude(1, 26, last_n_stims);
			main_event.set_target_button(0);
			main_event.set_response_active(true);
			main_event.set_stimulus_time_out(total_dur);
			num_non_targs = num_non_targs + 1;	
		end;
		trial_pic.set_part(3, letters[index]);	
		main_event.set_port_code(code);
		main_event.set_event_code(string(code)+","+string(index));
		if switcher == 0 then
			#run image trial	
			main_trial.set_duration(dur_b);
			loop 
				int j = 1; 
			until 
				j > (total_dur / letter_dur)
			begin
				loop
					int k = 1;
				until
					k > (letter_dur / main_trial.duration())
				begin
					current_image = random_exclude(1, 4, last_image);
					trial_pic.set_part(2, images[current_index][current_image]);	
					main_trial.present();
					last_image[1] = current_image;
					if k == 1 && j == 1 then
						main_event.set_target_button(0);
						main_event.set_event_code("");
					end;
					k = k + 1;
				end;
				if j == 1 then
					trial_pic.set_part(3, template);
				end;
				j = j + 1;
			end;
			stim_index = stim_index + 1;
		else	
			#run transition trial
			main_trial.set_duration(dur_a);
			loop 
				int j = 1; 
			until 
				j > (total_dur / letter_dur)
			begin
				loop
					int k = 1;
				until
					k > (letter_dur / main_trial.duration())
				begin
					if trans_index > trans_dur then
					current_image = random_exclude(1, 3, last_image);
					trial_pic.set_part(2, images[mod(current_index, images.count()) + 1][current_image]);	
				else
					trial_pic.set_part(2, transitions[current_index][trans_index]);
				end;	
					main_trial.present();
					last_image[1] = current_image;
					if k == 1 && j == 1 then
						main_event.set_target_button(0);
						main_event.set_event_code("");
					end;
					k = k + 1;
					trans_index = trans_index + 1;
				end;
				if j == 1 then
					trial_pic.set_part(3, template);
				end;
				j = j + 1;
			end;
		end;
	
		#update parameters for main loop
		if (stim_index > image_dur) || (trans_index >= trans_dur) then
			stim_index = 1;
			trans_index = 1;
			switcher = mod((switcher + 1), 2);
			if switcher == 0 then
				current_index = mod(current_index, images.count()) + 1;
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
		i = i + 1;
	end;
	
	#display results
	correct_count = response_manager.total_hits() - total_hits;
	false_alarm_count = response_manager.total_false_alarms() - total_fas;
	double performance = double(correct_count - false_alarm_count) / double(num_targs);
	string cap = "Results:";
	cap = cap + "\nNumber of Targets: " + string(num_targs); 
	cap = cap + "\nHits: " + string(correct_count);
	cap = cap + "\nFalse Alarms: " + string(false_alarm_count);
	cap = cap + "\nPercentage Correct: " + printf(performance * 100.0, "%.1f") + "%";
	if  performance > 0.8 then
		cap = cap + "\n\nYou're doing well! A little too well...\nLet's increase the difficulty.";
	elseif performance < 0.7 then
		cap = cap + "\n\nYou must score between 70% and 80% to complete the training phase.\nTry again.";
	elseif run == 1 then
		cap = cap + "\n\nGreat! Almost done. Try once more for practice."
	end;
	cap = cap + "\nPlease call the experimenter in.\nWhen instructed, press the mouse to continue.";
	feedback_text.set_caption(cap);
	feedback_text.redraw();
	total_hits = total_hits + correct_count;
	total_fas = total_fas + false_alarm_count;
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

sub
	main
begin
	int difficulty;
	double performance;
	int run;
	loop 
		performance = 0.0;
		difficulty = 3;
		run = 1;
	until 
		(0.7 <= performance) && (performance <= 0.8) && (run > 2)   
	begin
		correct_count = 0;
		false_alarm_count = 0;
		switcher = 0;
		letter_dur = difficulties[difficulty][1];
		total_dur = difficulties[difficulty][2];
		stim_count = int(floor(run_time / double(total_dur)));
		image_dur = int(max(floor(image_dur_time / double(total_dur)), 1.0));
		wait_trial.present();
		begin_trial.present();
		fixation_trial.present();
		run_n_back_trial(run);
		performance = double(correct_count - false_alarm_count) / (target_prop * double(stim_count));
		feedback_trial.present();		
		if (performance > 0.8) && (difficulty < 8) then
			difficulty = difficulty + 1;
		elseif (performance < 0.6) && (difficulty > 1) then
			difficulty = difficulty - 1;
		end;
		run = run + 1;
	end;
	
	#write difficulty level to file
	output_file out = new output_file;
	out.open("difficulty.txt");
	out.print(string(difficulties[difficulty][1])+
		"\n"+string(difficulties[difficulty][2]));
	out.close();	
	end_trial.present();
end;

main();
	
