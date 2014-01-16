#!/bin/bash/
#Revit Version Year Extraction Report script v5.14 PT2
#5/14/2013: Finalized script...maybe
##########
#rename the variables below to the share you want to run this script on
#and the report location
##########
server="server" #server
reploc="/mnt/share/directory/to/revit/report.csv" #location to save csv report
pnum=`ls ../../../??.????.???.txt|sed 's/.txt//'|sed 's/.*\///g'` #project number
pname=`ls ../../../*.dgn|sed 's/.dgn//'|sed 's/.*\///'|sed 's/,//g'` #project name
##########
#Real Code begins here
##########
echo "$1"
RES=$(xxd -ps "$1"|grep --max-count=1 -o '72006500200032003000310033002000280042\|72006500200032003000310032002000280042\|72006500200032003000310031002000280042\|72006500200032003000310030002000280042\|320030003000380031003100310038\|320030003000370030003600300037\|320030003000370030003800310030\|320030003000390030003100300035')
RES5=`echo $RES|sed 's/ .*//g'`

if [[ $RES5 == "320030003000370030003600300037" || $RES5 == "320030003000370030003800310030" ]]
then
	file=${1//.\//}
	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,2008" >> "$reploc"
	echo "   2008"
elif [[ $RES5 == "320030003000380031003100310038" ]]
then
	file=${1//.\//}
	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,2009" >> "$reploc"
        echo "   2009"
elif [[ $RES5 == "72006500200032003000310030002000280042" ]]
then
	file=${1//.\//}
	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,2010" >> "$reploc"
        echo "   2010"
elif [[ $RES5 == "320030003000390030003100300035" ]]
then
	file=${1//.\//}
	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,2010 (alpha preview)" >> "$reploc"
        echo "   2010 alpha preview"
elif [[ $RES5 == "72006500200032003000310031002000280042" ]]
then
	file=${1//.\//}
	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,2011" >> "$reploc"
        echo "   2011"
elif [[ $RES5 == "72006500200032003000310032002000280042" ]]
then
	file=${1//.\//}
	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,2012" >> "$reploc"
        echo "   2012"
elif [[ $RES5 == "72006500200032003000310033002000280042" ]]
then
	file=${1//.\//}
	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,2013" >> "$reploc"
	echo "   2013"
else
	file=${1//.\//}
    	path=`pwd|sed 's/\//\\\/g'|sed "s/mnt/$server/"`
    	echo "$pnum,$pname,=HYPERLINK(\"\\"$path"\"),$file,Unknown" >> "$reploc"
	echo "   ???"
fi
