FROM nfcore/base:2.1
LABEL authors="Urmo Võsa" \
      description="Docker image containing tools for running full trans-eQTL analysis setup with HASE"

COPY EqtlgenP2CondaEnv.yml /
COPY tools/Genotype-IO-1.0.6-SNAPSHOT-jar-with-dependencies.jar /usr/bin/
RUN ["chmod", "777", "/usr/bin/Genotype-IO-1.0.6-SNAPSHOT-jar-with-dependencies.jar"]
RUN conda env create -f EqtlgenP2CondaEnv.yml && conda clean -a
ENV PATH /opt/conda/envs/eQTLGenPhase2Env/bin:$PATH
ENV TAR="/bin/tar"
RUN ln -s /bin/tar /bin/gtar
