#! /bin/bash
echo "Service Discovery V1.0"
echo "---------------------------------------------------"
echo "Make sure you run this script as root user..."
echo "---------------------------------------------------"
sleep 1
echo "Checking User Privileges..."
sleep 2
if [ "$UID" != 0 ]; then
        echo "---------------------------------------------------"
        echo "[Permission Error] Run the script as root user"
        echo "Exiting !"
        echo "---------------------------------------------------"
        exit 1
fi
echo "==============================================="
echo "Service Discovery"
echo "==============================================="
echo "Fetching the Public IP Address"
pub_ip=$(curl wgetip.com)
file="./prometheus/prometheus.yml"
file2="./prometheus/targets.json"
ip="localhost"
printf "%s\nThe Public IP is: $pub_ip \n"
echo "Replacing $ip with $pub_ip in $file"
sed -i "s/$ip/$pub_ip/g" "$file"
echo "The Updated $file"
cat "$file"
echo "Replacing $ip with $pub_ip in $file2"
sed -i "s/$ip/$pub_ip/g" "$file2"
echo "The Updated $file2"
cat "$file2"
