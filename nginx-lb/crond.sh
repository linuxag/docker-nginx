result=$(systemctl is-enabled crond | grep -o "enabled")
echo $result
if [[ $result == "enabled" ]]
then
echo "crond is enabled"
else 
echo "not enabled"
systemctl --now enable crond
fi