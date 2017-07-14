scenario = "Set Images";
response_matching = simple_matching;
active_buttons = 3;
button_codes = 1,2,3;
default_font = "Calibri";
default_font_size = 24;
default_text_color = 100,100,100;
response_logging = log_active;

begin;

#image
bitmap {filename = "\\training\\tree_flower_18.png";} flower;

#letter
bitmap {filename = "\letters\\A.bmp";} A;

#picture
picture{
	bitmap flower; x=-250; y=75;
	bitmap A; x=-250; y=0;
	bitmap flower; x=250; y=75;
	bitmap A; x=250; y=0;
} set_pic;

#intro trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture {
		text {caption = "Adjust the positions of the images using the mouse buttons.\n
							When the images are aligned, press the spacebar.\n\n
							Click the mouse to continue.";} intro_text;
		x = 0; y = 0;
	} intro_pic;
} intro_trial;

#set image trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture set_pic;
} set_image_trial;

#finished trial
trial {
	trial_duration = forever;
	trial_type = first_response;
	picture {
		text {caption = "finished.";} finished_text;
		x = 0; y = 0;
	} finished_pic;
} finished_trial;

###################
begin_pcl;

int x = 250;

intro_trial.present();
loop int i=1 until i==0 begin
	set_image_trial.present();
	response_data last = response_manager.last_response_data();
	if last.button() == 1 then
		x = x - 5;
	elseif last.button() == 2 then
		x = x + 5;
	else
		i=0;
	end;
		set_pic.set_part_x(1, -x);
		set_pic.set_part_x(2, -x);
		set_pic.set_part_x(3, x);
		set_pic.set_part_x(4, x);
end;

output_file out = new output_file;
out.open("width_setting.txt");
out.print(string(x));
out.close();

finished_trial.present();