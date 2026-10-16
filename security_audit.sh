
#!/bin/bash

echo "================================"
echo "     LINUX SECURITY AUDIT"
echo "================================"

echo ""
echo "Current User:"
whoami

echo ""
echo "System Information:"
uname -srm

echo ""
echo "Disk Usage:"
df -h /

echo ""
echo "File Permission Audit:"
ls -l security_audit.sh


echo ""
echo "World-Writable File Check:"
find ~/cyberlab/linux-security-audit -type f -perm -0002 -print

echo ""
echo "Running Processes Check:"
ps -eo user,pid,comm --sort=pid | head -n 11

echo ""
echo "Authentication Log Check:"
if [ -r /var/log/auth.log ]; then
    grep -i "failed\|failure" /var/log/auth.log | tail -n 10
else
    echo "Authentication log not available."
fi

echo ""
echo "================================"
echo "       AUDIT COMPLETE"
echo "================================"
echo "Report saved to: audit_report.txt"
