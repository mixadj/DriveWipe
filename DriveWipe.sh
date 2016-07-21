echo "Welcome to the DiskWipe Sanitization Script"
echo " "
echo " "
echo "If you would like to abort please type [ctrl-c] at any time"
echo " "
echo "Please select which level of data you want to sanitize. You can select from:"
echo "0 - Not important"
#We will write all 0's, 1 pass
echo "1 - Slightly more important"
#We will write random data, 1 pass
echo "2 - Kind of classified"
#Will write 0's, 1's and then random data, 1 pass each
echo "3 - ZOMG SUPER SECRET"
#Will write 0's, 1's, random data, then 0's agian (Just to confuse the guys digging through the trash), 1 pass each
echo "Please enter your selection as a single number from the range 0 - 3"

while read -p "Enter your selection: " selection && [[ $selection != [0-3] ]] ; do
 echo "Bad input, try again"
done

echo " Level ${selection} selected"
echo " "
echo " "
echo "All drives in this system will be sanitized using the level requested."
while read -p "Are you sure you wish to continue? [y]es or [n]o" selection && [[ $selection != [0-3] ]] ; do
 echo "Bad input, try again"
done


#echo "Are you sure you wish to proceed?"

#echo "Are you really, for real sure?"

#echo "Ok, hope you were, were clearing the disk with option ${selection}. This may take a while, go get a sandwich."