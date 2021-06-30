#base image
FROM artemisfowl004/ubuntu-novnc

#copying stuff
COPY . /app
RUN chmod -R /app
#setting permissions
RUN chmod +x /app/conf.d/websockify.sh \
	&& chmod +x /app/run.sh \
	&& chmod +x /app/expect_vnc.sh 	\
        && chmod +x /usr/share/novnc/utils/launch.sh
#starting up
RUN useradd -ms /bin/bash newuser
USER newuser

CMD ["/app/run.sh"]
