#!/bin/bash

# start SSHd
if [[ -x /usr/sbin/sshd ]]; then
  sudo /usr/sbin/sshd-keygen && sudo /usr/sbin/sshd
fi

USERNAME="$1"
APIKEY="$2"

# generate XML for site manager
mkdir -p ~/.filezilla
cat <<EOF >~/.filezilla/sitemanager.xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<FileZilla3>
    <Servers>
        <Server>
            <Host>vaults.nimbix.net</Host>
            <Port>2222</Port>
            <Protocol>1</Protocol>
            <Type>0</Type>
            <User>$USERNAME</User>
            <Pass>$APIKEY</Pass>
            <Logontype>1</Logontype>
            <TimezoneOffset>0</TimezoneOffset>
            <PasvMode>MODE_DEFAULT</PasvMode>
            <MaximumMultipleConnections>0</MaximumMultipleConnections>
            <EncodingType>Auto</EncodingType>
            <BypassProxy>0</BypassProxy>
            <Name>vaults</Name>
            <Comments></Comments>
            <LocalDir>/data</LocalDir>
            <RemoteDir>/data</RemoteDir>
            <SyncBrowsing>0</SyncBrowsing>drop
        </Server>
    </Servers>
</FileZilla3>
EOF
exec /usr/bin/filezilla --site=0/drop
