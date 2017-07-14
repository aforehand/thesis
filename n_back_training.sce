scenario = "N-back Training";
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
text {caption = "Click the mouse when you see a letter from two positions back repeated. Focus only on the letters at the center of the screen and do not move during the experiment.\n
	When instructed, click to continue.\n
	Good luck!"; max_text_width = 400;
} intro_text;
	
#fixation text
text{caption = "When you have focused on the letter above, click to begin the experiment"; max_text_width = 400;} fixation_text;
	
#feedback text
text {caption = " "; max_text_width = 400;} feedback_text;

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


#frequency-tagged books
array {
	LOOP $i 10;
		bitmap {filename = "\\training\\book_tag_$i.png";} "book$i";
	ENDLOOP;
} books;

#frequency-tagged laptops
array {
	LOOP $i 10;
		bitmap {filename = "\\training\\laptop_tag_$i.png";} "laptop$i";
	ENDLOOP;
} laptops;

#frequency-tagged cakes
array {
	LOOP $i 10;
		bitmap {filename = "\\training\\cake_tag_$i.png";} "cake$i";
	ENDLOOP;
} cakes;

#frequency-tagged drinks
array {
	LOOP $i 10;
		bitmap {filename = "\\training\\drink_tag_$i.png";} "drink$i";
	ENDLOOP;
} drinks;

#frequency-tagged flowers
array {
	LOOP $i 10;
		bitmap {filename = "\\training\\flower_tag_$i.png";} "flower$i";
	ENDLOOP;
} flowers;

#frequency-tagged trees
array {
	LOOP $i 10;
		bitmap {filename = "\\training\\tree_tag_$i.png";} "tree$i";
	ENDLOOP;
} trees;

#drink-cake transitions
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\drink_cake_$i.png";} "drink-cake$i";
	ENDLOOP;
} drinks_cakes;
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\drink_cake_alt_$i.png";} "drink-cake-alt$i";
	ENDLOOP;
} drinks_cakes_alt;
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\drink_cake_dif_$i.png";} "drink-cake-dif$i";
	ENDLOOP;
} drinks_cakes_dif;

#laptop-book transitions
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\laptop_book_$i.png";} "laptop-book$i";
	ENDLOOP;
} laptops_books;
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\laptop_book_alt_$i.png";} "laptop-book-alt$i";
	ENDLOOP;
} laptops_books_alt;
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\laptop_book_dif_$i.png";} "laptop-book-dif$i";
	ENDLOOP;
} laptops_books_dif;

#tree-flower transitions
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\tree_flower_$i.png";} "tree-flower$i";
	ENDLOOP;
} trees_flowers;
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\tree_flower_alt_$i.png";} "tree-flower-alt$i";
	ENDLOOP;
} trees_flowers_alt;
array {
	LOOP $i 19;
		bitmap {filename = "\\training\\tree_flower_dif_$i.png";} "tree-flower-dif$i";
	ENDLOOP;
} trees_flowers_dif;

#placeholder image 
bitmap {filename = "lines_small.png";} placeholder;

#fixation mark
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap A; x = -250; y = 0;
	bitmap A; x = 250; y = 0;
	text fixation_text; x = -250; y = -250;
	text fixation_text; x = 250; y = -250;
} fixation_pic;

#trial picture
picture {
	bitmap {filename = "lines.png";}; x = 0; y = 0;
	bitmap placeholder; x = -250; y = 75;
	bitmap template; x = -250; y = 0;
	bitmap placeholder; x = 250; y = 75;
	bitmap template; x = 250; y = 0;
} trial_pic;

#wait trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture {
		text intro_text;
		x = -250; y = 0;
		text intro_text;
		x = 250; y = 0;
	};
} wait_trial;

#trial beginning
trial {
	trial_duration = 1000;
	trial_type =fixed;
	picture {
		text next_trial;
		x = -250; y = 0;
		text next_trial;
		x = 250; y = 0;
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
		x = -250; y = 0;
		text feedback_text;
		x = 250; y = 0;
	}feedback_pic;
} feedback_trial;

#end trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	stimulus_event{
		picture {
			text end_text;
			x = -250; y = 0;
			text end_text;
			x = 250; y = 0;
		} end_pic;
		port_code = 255;
	} end_event;
} end_trial;

##############################################################################
begin_pcl;
##############################################################################

#variables
double scenario_time = 2.4e5;		#length of the scenario in ms: 6e5=10mins;4.8e5=8mins;1.2e5=2mins 
double before_trans_time =5.8e4;	#time before switching from the non-target images in ms
double target_prop = 0.2;			#proportion of targets in a trial
int n_back = 2;						#n-back value

##############################################################################

#difficulty levels

#trial durations
int b_dur = 78;	#duration of frequency-tagged image b, 12.5 Hz
int c_dur = 58;	#duration of frequency-tagged image c, 16.67 Hz
int gcd = 18; 		#greatest common demominator of b_dur and c_dur

#letter timing
int letter_dur;
int total_dur;

#stimuli and image parameters
int num_targs = 0;				#number of targets presented so far
int num_non_targs = 0;		#number of non-targets presented so far
array<int> is_target[0]; #array of target positions
array<int> last_left_image[1] = {1};
array<int> last_right_image[1] = {1};
int left_image = 1;
int right_image = 1;
int trans_length = 19;

#modulo parameters
int left_mod = 3;
int right_mod = 4;
int trans_mod = 5;

#last n stimuli
array<int> last_n_letters[0];
loop int x = 1 until x > n_back begin
	last_n_letters.add(1);
	x = x + 1;
end;

/*
#event codes
int box_img = 1;
int helmet = 2;
int house = 3;
int face = 4;
*/

#tree-flower transitions
array<bitmap> tree_flower_trans[0][0];
tree_flower_trans.add(trees_flowers);
tree_flower_trans.add(trees_flowers_alt);
tree_flower_trans.add(trees_flowers_dif);

#house-book transitions
array<bitmap> laptop_book_trans[0][0];
laptop_book_trans.add(laptops_books);
laptop_book_trans.add(laptops_books_alt);
laptop_book_trans.add(laptops_books_dif);

#house-cake transitions
array<bitmap> drink_cake_trans[0][0];
drink_cake_trans.add(drinks_cakes);
drink_cake_trans.add(drinks_cakes_alt);
drink_cake_trans.add(drinks_cakes_dif);

array<bitmap> first_imgs[0][0];
first_imgs.add(trees);
first_imgs.add(laptops);
first_imgs.add(drinks);

array<bitmap> trans_imgs[0][0][0];
trans_imgs.add(tree_flower_trans);
trans_imgs.add(laptop_book_trans);
trans_imgs.add(drink_cake_trans);

array<bitmap> second_imgs[0][0];
second_imgs.add(flowers);
second_imgs.add(books);
second_imgs.add(cakes);

int trans_set_count = tree_flower_trans.count();

#for feedback
int correct_count = 0;
int false_alarm_count = 0;
int total_hits = 0;
int total_fas = 0;

#width of stimuli from file
input_file get_width = new input_file;
get_width.open("\logfiles\\width_setting.txt");
int width = get_width.get_int();
get_width.close();

fixation_pic.set_part_x(2, -width);
fixation_pic.set_part_x(3, width);
#fixation_pic.set_part_x(4, -width);
#fixation_pic.set_part_x(5, width);
trial_pic.set_part_x(2, -width);
trial_pic.set_part_x(3, -width);
trial_pic.set_part_x(4, width);
trial_pic.set_part_x(5, width);
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

#runs a trial
sub
	do_run(int run, int before_trans, int duration, array<bitmap> non_targs[2][10], 
			array<bitmap> transitions[2][trans_set_count][trans_length], array<bitmap> targets[2][10])
begin
	array<bitmap> images[2][10] = non_targs;
	bool transitioned = false;
	int trans_index = 1;
	int trans_set = 1;
	int letter_index = 1;
	int letter_counter = 1;
	loop 
		int k = 1; 
	until 
		k > duration
	begin
		if k > before_trans then
			images = targets;
		end;
		if transitioned || (k <= before_trans) then
			if mod(k,left_mod) == 0 then
				left_image = random_exclude(1, 10, last_left_image);
				trial_pic.set_part(2, images[1][left_image]);
				last_left_image[1] = left_image;
			end;
			if mod(k,right_mod) == 0 then
				right_image = random_exclude(1, 10, last_right_image);
				trial_pic.set_part(4, images[2][right_image]);
				last_right_image[1] = right_image;
			end;
		else
			if mod(k,trans_mod) == 0 then
				trial_pic.set_part(2, transitions[1][trans_set][trans_index]);
				trial_pic.set_part(4, transitions[2][trans_set][trans_index]);
				trans_set = trans_set + 1;
				if mod(trans_set,4) == 0 then
					trans_index = trans_index + 1;
					trans_set = 1;
				end;
				if trans_index > trans_length then
					transitioned = true;
				end;
			end;
		end;
		#letters
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
end;


#displays results
sub
	display_results(int run)
begin
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
	cap = cap + "\nPlease call the experimenter in. When instructed, press the mouse to continue.";
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
	int duration = int(scenario_time) / gcd;
	int before_trans = int(before_trans_time) / gcd;
	int difficulty;
	double performance;
	int run;
	loop 
		performance = 0.0;
		difficulty = 50;
		run = 1;
	until 
		(0.7 <= performance) && (performance <= 0.8) && (run > 2)   
	begin
		correct_count = 0;
		false_alarm_count = 0;
		letter_dur = difficulty;#difficulties[difficulty][1] ;
		total_dur = difficulty + 10;#difficulties[difficulty][2] / gcd;
		
		array<bitmap> non_targs[0][0];
		array<bitmap> targs[0][0];
		array<bitmap> trans[0][0][0];
		is_target.resize(1 + (duration / total_dur));
		is_target = is_target(is_target.count());
		array<int> left_imgs[1];
		left_imgs[1] = random(1,3);
		int right_imgs = random_exclude(1,3,left_imgs);

		non_targs.add(first_imgs[left_imgs[1]]);
		non_targs.add(first_imgs[right_imgs]);
		trans.add(trans_imgs[left_imgs[1]]);
		trans.add(trans_imgs[right_imgs]);
		targs.add(second_imgs[left_imgs[1]]);
		targs.add(second_imgs[right_imgs]);	
		
		wait_trial.present();
		begin_trial.present();
		fixation_trial.present();
		do_run(run, before_trans, duration, non_targs, trans, targs);
		performance = double(correct_count - false_alarm_count) / double(num_targs);
		feedback_trial.present();			
		display_results(run);
		
		if (performance > 0.8) && (difficulty < 8) then
			difficulty = difficulty + 10;
		elseif (performance < 0.6) && (difficulty > 1) then
			difficulty = difficulty - 10;
		end;
		run = run + 1;
	end;
	
	#write difficulty level to file
	output_file out = new output_file;
	out.open("difficulty.txt");
	out.print(string(difficulty*gcd)+
		"\n"+string(difficulty*gcd));
	out.close();	
	end_trial.present();
end;

main();
	
