#!/bin/bash
# Log Analyzer for Problem Statement 2, Objective 3

LOG_FILE="access.log"

echo "===== Log Analysis ====="

# Count total requests
total_requests=$(wc -l < $LOG_FILE)
echo "Total requests: $total_requests"

# Count 404 errors
errors_404=$(grep "404" $LOG_FILE | wc -l)
echo "Total 404 errors: $errors_404"

# Most requested pages
echo "Most requested pages:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -5

# IPs with most requests
echo "Top 5 IPs making requests:"
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -5

echo "===== End of Analysis ====="

