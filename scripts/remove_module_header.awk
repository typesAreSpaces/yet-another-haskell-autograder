#!/usr/bin/awk -f

BEGIN { 
    inHeader = 0
}

/^module.*where.*$/ {
    next
}

/^module/ {
    if(!inHeader){
	inHeader = 1
	next
    }
}

/where.*$/ {
    if(inHeader){
	inHeader = 0
	next
    }
}


{
    if (!inHeader) {
	print
    }
}
