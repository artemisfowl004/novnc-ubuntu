#base image
FROM artemisfowl004/ubuntu-novnc

#copying stuff
COPY . /app
RUN chmod 777 -R /app 
#setting permissions
RUN chmod +x /app/conf.d/websockify.sh \
	&& chmod +x /app/run.sh \
	&& chmod +x /app/expect_vnc.sh 	\
        && chmod +x /usr/share/novnc/utils/launch.sh
#starting up
RUN  useradd admin && echo "admin:admin" | chpasswd && adduser admin sudo

RUN bash /app/setup.sh
USER admin
RUN echo "fowl:fowl" | chpasswd
CMD exec supervisord -c /app/supervisord.conf
