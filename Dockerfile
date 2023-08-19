FROM mfocchi/trento_lab_framework:introrob
USER ${NB_UID}
WORKDIR "${HOME}"
RUN pip3 install --no-cache-dir --upgrade pip \
  && pip3 install --no-cache-dir jupyter \
  && pip3 install --no-cache-dir jupyterlab