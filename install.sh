# This script copies the files into the corresponding folders and adjust the permissions for things to run smoothly
# This script must be run as root, so there is no problems to access the system folder:

# Copy the script listen-for-shutdown.py into /usr/local/bin
DSTPATH="/usr/local/bin"
CURRPATH=$( pwd )
FNAME="listen-for-shutdown.py"

echo "Copying file ${FNAME} from ${CURRPATH} to ${DSTPATH}"
cp ${CURRPATH}/${FNAME} ${DSTPATH}/${FNAME}

# Changing the permissions so it can be executed:
chmod +x ${DSTPATH}/${FNAME}


# Setting up the service to run the script in the background
SERVICEFILE="listen-for-shutdown.service"
SERVICEPATH="/lib/systemd/system/"

# (FORCE) Copy the service file:
echo "Copying file ${SERVICEFILE} from ${CURRPATH} to ${SERVICEPATH}"
cp -f ${CURRPATH}/${SERVICEFILE} ${SERVICEPATH}/${SERVICEFILE}

# Change the permissions of the unit file:
chmod 644 ${SERVICEPATH}/${SERVICEFILE}

# Once created the unit file, make systemd aware of it and enable it:
systemctl daemon-reload
systemctl enable ${SERVICEFILE}
# Start the daemon:
systemctl start ${SERVICEFILE}

# Check the status:
echo "To check the status, type: "
echo "$ sudo systemctl status ${SERVICEFILE}"

systemctl status ${SERVICEFILE}

