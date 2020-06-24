  
FROM jlphillips/csci3130

LABEL maintainer = "Hannah Williams"

USER root

# Additional tools
RUN apt-get update && \
    apt-get install -y \
    gromacs \
    grace \
    dnsutils \
    && apt-get clean

# CSCI 3130
USER $NB_UID

RUN conda install --quiet --yes \
    bash_kernel \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
