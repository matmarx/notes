> alt+backspace	delete word backwards
> alt+d		delete word upfront
> ctrl+a		begining
> ctrl+e		end of line
> ctrl+k		delete from cursor to end
> ctrl+u		delete from cursor to start

> !cmd:p	print out last cmd

for line in wordlist:
>	file=rockyou.txt; while read line; do echo $line; done\<$file

grep only for mails:
>	grep -i -o '[A-Z0-9._%+-]\+@[A-Z0-9.-]\+\.[A-Z]\{2,4\} file.txt

grep only for ips:
>	grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'

```
bash string splitting:
#!/bin/bash
#Input a string value
echo “Enter a string value”
read text
# Set the delimiter
IFS=' '
#Split the value of $text into an array based on space delimiter
read -a arr <<< "$text"
# Print each value of the array
for value in "${arr[@]}";
do
printf "$value\n"
done
```
