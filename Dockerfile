FROM continuumio/miniconda3:24.7.1-0

# Use conda-forge for geospatial stack
RUN conda config --add channels conda-forge && conda config --set channel_priority strict

# Copy env files
COPY environment.yml /tmp/environment.yml
COPY requirements-torch.txt /tmp/requirements-torch.txt
COPY requirements-pyg.txt   /tmp/requirements-pyg.txt

# Create env and install conda packages
RUN conda env create -n main_latest -f /tmp/environment.yml && conda clean -afy

# Activate env and install PyTorch + PyG stack via pip
SHELL ["/bin/bash", "-lc"]
RUN conda activate main_latest && \
    pip install --no-cache-dir -r /tmp/requirements-torch.txt && \
    pip install --no-cache-dir -r /tmp/requirements-pyg.txt

# Set default environment
ENV PATH /opt/conda/envs/main_latest/bin:$PATH
ENV CONDA_DEFAULT_ENV main_latest

# Default workdir
WORKDIR /workspace
CMD ["bash"]
