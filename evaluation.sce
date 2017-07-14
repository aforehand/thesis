scenario = "Evaluation";
response_matching = simple_matching;
active_buttons = 3;
button_codes = 1,2,3;
default_font = "Calibri";
default_font_size = 24;
default_text_color = 100,100,100;
response_logging = log_active;
#write_codes = true;
#pulse_width = 6;
#response_port_output=false;

begin;

#intro text
text {caption = "During the previous trial, one or more\n
	of the following images were presented.\n
	Please indicate the images that were presented\n\n
	Press the spacebar to continue.";
} intro_text;

#images
array {
	bitmap {filename = "\IB\\evaluation\\cake_small.png";} cake;
	bitmap {filename = "\IB\\evaluation\\box_small.png";} the_box;
	bitmap {filename = "\IB\\evaluation\\house_small.png";} house;
	bitmap {filename = "\IB\\evaluation\\coke_can_small.png";} coke_can;
	bitmap {filename = "\IB\\evaluation\\penguin_small.png";} penguin;
	bitmap {filename = "\IB\\evaluation\\pointe_shoes_small.png";} pointe_shoes;
	bitmap {filename = "\IB\\evaluation\\car_small.png";} car;
	bitmap {filename = "\IB\\evaluation\\spider_small.png";} spider;
	bitmap {filename = "\IB\\evaluation\\helmet_small.png";} the_helmet;
	bitmap {filename = "\IB\\evaluation\\face_small.png";} face;
	bitmap {filename = "\IB\\evaluation\\tree_small.png";} tree;
	bitmap {filename = "\IB\\evaluation\\old_fashioned_small.png";} old_fashioned;
} images;

#placeholder image 
bitmap {filename = "placeholder.png";} placeholder;

#main picture
picture {
	bitmap placeholder; x = -375;	y = 250;
	bitmap placeholder; x = -125;	y = 250;
	bitmap placeholder; x = 125;	y = 250;
	bitmap placeholder; x = 375;	y = 250;
	bitmap placeholder; x = -375;	y = 0;
	bitmap placeholder; x = -125;	y = 0;
	bitmap placeholder; x = 125;	y = 0;
	bitmap placeholder; x = 375;	y = 0;
	bitmap placeholder; x = -375;	y = -250;
	bitmap placeholder; x = -125;	y = -250;
	bitmap placeholder; x = 125;	y = -250;
	bitmap placeholder; x = 375;	y = -250;
} main_pic;

#wait trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture {
		text intro_text;
		x = 0; y = 0;
	};
} wait_trial;

#main trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture main_pic;
} main_trial;

############################################################################
############################################################################
begin_pcl;

images.shuffle();

loop 
	int i = 1;
until
	i > images.count()
begin
	main_pic.set_part(i, images[i]);
	i = i + 1;
end;
	
array <int> sequence[12] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
string sequencefile = logfile_directory + logfile.subject()+ ".txt";
output_file out = new output_file;

sequence.shuffle();
out.open(sequencefile, true);
loop
	int c = 1;
until 
	c > sequence.count()
begin
	out.print(sequence[c]);
	out.print(",");
	c = c + 1;
end;
out.close();

wait_trial.present();
main_trial.present();
