# This util provides a simple convention for keeping authenication info in a dot file.
# The file should contain space delimited params like the example below, but with out the leading hash (#)
#
# Name User Password Host Extra
# ono-leads-db1 mthorley password leads-db.1on1.com prod_leads_db1
# classesa-ready-db classesarw password classes-dev-mysql classesa_ready
AUTH_FILE=~/.authinfo

function auth_user {
  $(grep $1 $AUTH_FILE| awk '{print $2}') 
}

echo $(auth_user 'classesa-ready-db')

#  PASS=$(grep classesa-ready-db ~/.authinfo| awk '{print $3}') 
#  HOST=$(grep classesa-ready-db ~/.authinfo| awk '{print $4}') 
#  DB=$(grep classesa-ready-db ~/.authinfo| awk '{print $5}') 
#  SQL="$@"
#  mysql -h$HOST -u$USER -p$PASS $DB -e "$SQL"
