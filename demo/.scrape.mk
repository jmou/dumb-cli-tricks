cookies.txt login.html:
	curl -L -o login.html -c cookies.txt https://www.recurse.com/calendar

csrf.txt: login.html
	grep csrf-token login.html | cut -d\" -f4 | tr -d '\n' > csrf.txt

calendar.html: cookies.txt csrf.txt password
	curl -L -o calendar.html -b cookies.txt https://www.recurse.com/sessions -F email=joe@mou.fo -F 'password=<password' -F 'authenticity_token=<csrf.txt'

calendar.json: calendar.html
	grep RC.Calendar calendar.html | cut -d\" -f4 | sed -e 's/&quot;/"/g' -e 's/&amp;/\&/g' -e 's/&lt;/</g' -e 's/&gt;/>/g' -e "s/&#39;/'/g" > calendar.json
