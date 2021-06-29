#base image
FROM artemisfowl004/ubuntu-novnc

#copying stuff
COPY . /app

#setting permissions
RUN chmod +x /app/conf.d/websockify.sh \
	&& chmod +x /app/run.sh \
	&& chmod +x /app/expect_vnc.sh 	

#starting up
CMD ["/app/run.sh"]
