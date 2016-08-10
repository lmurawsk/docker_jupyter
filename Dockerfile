FROM continuumio/anaconda

	# install jupyter & jupyter lab
RUN cd /opt/conda/bin && \
    conda install jupyter -y --quiet && \
    pip install jupyterlab && \  
    jupyter serverextension enable --py jupyterlab && \
	mkdir /opt/notebooks

	# Data Science packages

    
	# python connectivity packages
RUN cd /opt/conda/bin && \
    pip install influxdb


    # createscript to launch jupyter notebook and jupyter lab in the background
RUN echo '#!/bin/bash\n\
    jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser &> /dev/null &\n\
    jupyter lab --notebook-dir=/opt/notebooks --ip='*' --port=8889 --no-browser &> /dev/null &\n\
    bash' > /usr/local/bin/start_script.sh && \
    chmod +x /usr/local/bin/start_script.sh

ENTRYPOINT ["tini", "--"]

CMD ["/usr/local/bin/start_script.sh"]