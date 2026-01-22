FROM condaforge/miniforge3:24.7.1-0

LABEL authors="Felix Waern, felix.waern@ki.se"
LABEL description="Image for placode scRNA-seq clonal analysis."

# Use bash as shell
SHELL ["/bin/bash", "-c"]

# Set workdir
WORKDIR /placodes

# Set timezone to avoid interactive prompt
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Install unzip
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Install required packages including Java
RUN apt-get update && \
    apt-get install -y curl default-jre tzdata nano && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get clean

# Install nextflow
ARG NEXTFLOW_VERSION=24.10.4
ENV PATH="/root/.local/bin:${PATH}"
RUN export NXF_VER=${NEXTFLOW_VERSION} && \
    curl -s https://get.nextflow.io | bash && \
    chmod +x nextflow && \
    mkdir -p /root/.local/bin/ && \
    mv nextflow /root/.local/bin/


# Install Cell Ranger 
ARG CELL_RANGER_VERSION="7.1.0"
ARG CELLRANGER_URL
RUN mkdir -p /opt/cellranger/${CELL_RANGER_VERSION} && \
    curl -o cellranger.tar.gz "${CELLRANGER_URL}" && \
    tar -zxvf cellranger.tar.gz -C "/opt/cellranger/${CELL_RANGER_VERSION}" --strip-components=1 && \
    rm cellranger.tar.gz
ENV PATH="/opt/cellranger/${CELL_RANGER_VERSION}:${PATH}"


# Install Quarto
ARG QUARTO_VERSION="1.3.450"
RUN mkdir -p /opt/quarto/${QUARTO_VERSION} && \
    curl -o quarto.tar.gz -L "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" && \
    tar -zxvf quarto.tar.gz -C "/opt/quarto/${QUARTO_VERSION}" --strip-components=1 && \
    rm quarto.tar.gz
ENV PATH="/opt/quarto/${QUARTO_VERSION}/bin:${PATH}"

# Configure Conda
RUN conda config --set channel_priority flexible  && \
    conda config --append channels bioconda

# Install environment
COPY environment.yml ./
RUN conda env create -f environment.yml && \
    conda clean -a

RUN echo "source activate sclitr" >> ~/.bashrc
ENV PATH=/opt/conda/envs/project_mrsa/bin:${PATH}

# Add project files
COPY code ./code/
#COPY data ./data/
#COPY results ./results/

# Declare volumes
VOLUME [ "./data" ]
VOLUME [ "./results" ]

# Run initial command. 
# Start Bash shell by default
CMD /bin/bash

# Check afterwards
# nextflow info
# which cellranger