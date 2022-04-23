FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /root/
## Step 2:
# Copy source code to working directory
COPY ./app.py /root/app.py
COPY ./model_data/ /root/model_data/
COPY ./requirements.txt /root/requirements.txt
## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir -r /root/requirements.txt
## Step 4:
# Expose port 80
EXPOSE 80/tcp
EXPOSE 80/udp
## Step 5:
# Run app.py at container launch
ENTRYPOINT ["python3"]
CMD ["app.py"]
