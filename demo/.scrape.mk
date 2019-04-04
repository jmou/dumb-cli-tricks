cookies.txt login.html:
	curl -L -o login.html -c cookies.txt https://www.recurse.com/calendar

csrf.txt: login.html
	grep csrf-token login.html | cut -d\" -f4 | tr -d '\n' > csrf.txt

calendar.html: cookies.txt csrf.txt password
	curl -L -o calendar.html -b cookies.txt https://www.recurse.com/sessions -F email=joe@mou.fo -F 'password=<password' -F 'authenticity_token=<csrf.txt'
