FROM openjdk:8

ENV SERVER_PORT=25565

ARG MODID="5"
ARG VERID="121"

WORKDIR /install

RUN mkdir -p /install && mkdir -p /minecraft
RUN curl https://api.modpacks.ch/public/modpack/${MODID}/${VERID}/server/linux \
    --output serverinstall_${MODID}_${VERID}
RUN chmod +x serverinstall_${MODID}_${VERID}
RUN yes | ./serverinstall_${MODID}_${VERID} --install
COPY run.sh /install
RUN chmod +x run.sh

VOLUME ["/minecraft"]
EXPOSE ${SERVER_PORT}
CMD ["/bin/sh", "run.sh"]
