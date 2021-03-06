
#! /bin/bash
echo "###########Check if the server is serving the expected content###########"

webserv="http://localhost:80"
keyword="Hello World"



if curl -s "$webserv" | grep "$keyword"
then
    # if the keyword is in the conent
    echo " The website is working fine with correct content"
else
    echo "Website is not working with the correct content. Please check." | sudo ssmtp -vvv jalithakanchana@gmail.com
fi
