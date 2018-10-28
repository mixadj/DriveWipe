# DriveWipe

The script for securely erasing disks was written with the intent of conforming to the standards written in the University of North Carolina at Charlotte guideline for hardware and media disposal. This can be found at the following link: http://itservices.uncc.edu/iso/guideline-hardware-and-media-disposal

I am writing this script to create a CLI for erasing drives to the UNC Charlotte disposal standards and to automate or semi-automate the process. Looking at the UNC Chapel Hill disposal requirements it seems like this would satisfy most other UNC system institution disposal requirements. In reality this whole thing is just a nice front end for some DD commands with some options added but hey, its all about automation.

According to these standards:

"Hardware or media containing Level 0 or 1 data may be wiped using specialized software designed to overwrite information".

This is 

"Hardware and media containing data classified as Level 2 or 3 should go through a Department of Defense (DOD) three-pass erasure."

For Level 0 or 1 data they do not specify a method but with many softwares you can write either all of one character or a sequence of random data in a single pass. This section is very vague and we will leave the decision to use a single pass up to the technician. If a single pass is chosen the technician may choose either all 1's, all 0's or random data.

For level 2 or 3 data we are to use the DOD 3 pass method. This is very vague as there are multiple methods created by the DOD that involve 2 or more passes. To combat vagueness with more vagueness, we will use the method generally agreed upon by the internet as the "DOD 3 pass". With this method we will write a character, its complement, and another pattern in succession to the disk being sanitized.


#Update:

DD is out the window for now. I plan to use nwipe as its less work since someone has already done it.

Sourceforge Nwipe page http://www.andybev.com/index.php/Nwipe
Ubuntu docs  http://manpages.ubuntu.com/manpages/trusty/man1/nwipe.1.html

After securely being wiped SMART tests need to be performed on all the drives to see if they are viable for reuse. 

Ubuntu docs for smartmontools https://help.ubuntu.com/community/Smartmontools

When all this is finished logs from both nwipe and smartmontools will be emailed to the appropriate address using mutt

Ubuntu docs for mutt here: https://wiki.ubuntu.com/Mutt#Features

I also need to figure out how to properly setup the environment. I will attempt to create a second shell script that handles initial setup of a vanilla ubuntu server install.

The planned end result is to have an appliance that zeroes any drives inserted into it and emails the user when its completed with the appropriate logs. I would like to possibly automate it further so that when the drive has been zeroed and tested, it is unmounted, the user is emailed, the user can pull the drive, insert a new one and the system will automatically start zeroing the newly inserted drive.

#Notes for myself

Flowchart:

* Appliance boots

* chronjob in background constantly searching for newly attached devices

* mount new devices

* enable SMART stratus on device

* use nwipe to perform 3 pass 0, 1, random wiped on drive

* run smart test on device with smartmontools

* email user with drive SN, bay location, smart status and associated logs for the drive. Maybe also flash the light on the drive bay for easy locating.

* chronjob picks up new device

* rinse and repeat



Note: Maybe have a log cache that flushes every week/month that a log aggregator can pull from.
Note: This is an old project
