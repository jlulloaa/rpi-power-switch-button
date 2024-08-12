# This script uninstall listen-for-shutdown application
# This script must be run as root, so there is no problems to access the system folder:

# Paths and filenames:
EXECPATH="/usr/local/bin"
FNAME="listen-for-shutdown.py"
SERVICEFILE="listen-for-shutdown.service"
SERVICEPATH="/lib/systemd/system/"

# Stop the service and disables it
echo "Stopping the service, please wait..."
systemctl stop ${SERVICEFILE}

echo "Disabling the service, please wait..."
systemctl disable ${SERVICEFILE}

echo "Removing the service file"
rm -f ${SERVICEPATH}/${SERVICEFILE}

# Removing the python executable
rm -f ${EXECPATH}/${FNAME}

# 
echo "LISTEN-FOR-SHUTDOWN has been uninstalled"
