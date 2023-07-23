FROM ubuntu:20.04.6
FROM python:3.8.10

WORKDIR /usr/src/app/adaspeech
# ADD E:\Recount\LibriTTS\sample_set\labwav /usr/src/app/adaspeech/raw_data/eng
# ADD E:\Recount\LibriTTS\sample_set\text_grids /usr/src/app/adaspeech/preprocessed_data/textgrid

COPY . .
RUN apt-get update
RUN apt-get install libsndfile1-dev -y
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install resampy==0.3.1

RUN rm -rf /content/AdaSpeech/raw_data/vie
RUN rm -rf /content/AdaSpeech/preprocessed_data/textgrid/Ba_Trung
RUN pip install protobuf==3.20.*
RUN pip install soundfile
RUN pip install gdown
RUN pip install Pillow
RUN gdown --fuzzy https://drive.google.com/file/d/1RkZ8reW0WjR9lE_ztTnN1qFVx24JZhhy/view?usp=drive_link
RUN gdown --fuzzy https://drive.google.com/file/d/12-XlQw8k52hRT73_hwfQ3bXuIBwegabw/view?usp=drive_link



# CMD ["python", "preprocess.py", "config/pretrain/preprocess.yaml"]