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
RUN adduser --disabled-password \
--gecos '' docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers
RUN bash /app/setup.sh
RUN adduser docker sudo
USER docker
CMD sudo -- bash -c 'exec supervisord -c /app/supervisord.conf'
