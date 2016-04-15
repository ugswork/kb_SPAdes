FROM kbase/kbase:sdkbase.latest
MAINTAINER KBase Developer
# -----------------------------------------

# Insert apt-get instructions here to install
# any required dependencies for your module.

# RUN apt-get update

RUN cd /opt \
    && wget http://spades.bioinf.spbau.ru/release3.7.1/SPAdes-3.7.1-Linux.tar.gz \
    && tar -xvzf SPAdes-3.7.1-Linux.tar.gz \
    && rm SPAdes-3.7.1-Linux.tar.gz
ENV PATH $PATH:/opt/SPAdes-3.7.1-Linux/bin

# -----------------------------------------

COPY ./ /kb/module
RUN mkdir -p /kb/module/work

WORKDIR /kb/module

RUN make

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
