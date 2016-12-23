# Install a Jupyter Notebook Environment
# with support for NETCONF/RESTCONF via
# additional Python libs (like ncclient)

FROM       alpine:latest
MAINTAINER Ralph Schmieder <rschmied@cisco.com>

# install package dependencies
RUN apk add --update alpine-sdk python3-dev libffi-dev openssl-dev libxml2-dev libxslt-dev linux-headers

ENV HOME /home/docker
ENV BOOKS notebooks

RUN pip3 install ipywidgets==6.0.0.beta2 jupyter requests ncclient netaddr argparse pyang jupyter_contrib_nbextensions && \
    pip3 install git+https://github.com/rschmied/wsma_python.git && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    adduser -h $HOME -D docker docker

COPY images/devnet-logo.png /usr/lib/python3.5/site-packages/notebook/static/base/images/logo.png

USER docker
WORKDIR $HOME
RUN mkdir -p $HOME/$BOOKS && \
    mkdir $HOME/$BOOKS/images && \
    mkdir $HOME/$BOOKS/sections && \
    mkdir -p -m 700 .jupyter/custom && \
    mkdir -p -m 700 .jupyter/nbconfig && \
    mkdir -p $HOME/$BOOKS/tmp && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter contrib nbextension install --user && \
    echo "c.NotebookApp.ip = '*'" >>.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = ''" >>.jupyter/jupyter_notebook_config.py

COPY resources/custom.css $HOME/.jupyter/custom/
COPY resources/notebook.json $HOME/.jupyter/nbconfig/
COPY resources/ned-vlan.html $HOME/$BOOKS/tmp/
COPY START-HERE.ipynb $HOME/$BOOKS/
COPY sections $HOME/$BOOKS/sections/
COPY images $HOME/$BOOKS/images/

WORKDIR $HOME/$BOOKS

# Expose port 8888 
# from the container to the host
EXPOSE 8888/tcp

# Data Volume
VOLUME $HOME/$BOOKS

# https://github.com/ipython/ipython/issues/7062
ENTRYPOINT []
CMD ["/bin/sh", "-c", "/usr/bin/jupyter-notebook --no-browser"]

