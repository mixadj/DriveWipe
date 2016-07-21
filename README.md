# DriveWipe

This script for securely erasing disks was written with the intent of conforming to the standards written in the University of North Carolina at Charlotte guideline for hardware and media disposal. This can be found at the following link: http://itservices.uncc.edu/iso/guideline-hardware-and-media-disposal

I am writing this script to create a CLI for erasing drives to the UNCC disposal standards and to automate or semi-automate the process. Looking at the UNC Chapel Hill disposal requirements it seems like this would satisfy most other UNC system institution disposal requirements. In reality this whole thing is just a nice front end for some DD commands with some options added but hey, its all about making it easier for the other techs. 

According to these standards:

"Hardware or media containing Level 0 or 1 data may be wiped using specialized software designed to overwrite information (Active@KillDisk is a free download)."

This is 

"Hardware and media containing data classified as Level 2 or 3 should go through a Department of Defense (DOD) three-pass erasure."

For Level 0 or 1 data they do not specify a method but with many softwares you can write either all of one character or a sequence of random data in a single pass. This section is very vague and we will leave the decision to use a single pass up to the technician. If a single pass is chosen the technician may choose either all 1's, all 0's or random data.

For level 2 or 3 data we are to use the DOD 3 pass method. This is very vague as there are multiple methods created by the DOD that involve 2 or more passes. To combat vagueness with more vagueness, we will use the method generally agreed upon by the internet as the "DOD 3 pass". With this method we will write a character, its complement, and another pattern in succession to the disk being sanitized.