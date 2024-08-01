#Let's Configure the Project After Startup

#Receive FPGA address

get_service_paths master

#Create FPGA address allias

set my_master [lindex [get_service_paths master] 0]
set c_path [claim_service master $my_master ""]

#Create addres allias
set LED          0x00000000

#Open a channel for performing operations with an internal interface
open_service master $c_path

#The first LED lights up to show successful channel opening
master_write_8 $c_path $LED 0x01


