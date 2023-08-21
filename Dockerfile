FROM mfocchi/trento_lab_framework:introrob
USER ${NB_UID}
RUN pip3 install --no-cache-dir --upgrade pip &&\
    pip3 install --no-cache-dir jupyter &&\
    pip3 install --no-cache-dir jupyterlab &&\
    pip3 install --no-cache-dir --upgrade jupyter_core jupyter_client