FROM nimbix/ubuntu-desktop:trusty

COPY filezilla-launch.sh /usr/local/bin/filezilla-launch.sh

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate
