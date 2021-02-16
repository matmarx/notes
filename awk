##F - delimiter (:), print 1st and 4th column, separated by TAB
>awk -F: '{print $1 "<TAB>" $4}'
