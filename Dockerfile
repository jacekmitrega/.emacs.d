FROM debian

RUN apt-get update && apt-get install -y emacs24-nox

WORKDIR /root/.emacs.d

COPY *.el ./
COPY snippets/ snippets/
COPY themes/ themes/
COPY vendor/ vendor/

RUN echo 'Was first initialization successful?\nExit Emacs to re-launch it.' > instr1.txt
RUN echo 'Was subsequent initialization successful?\nExit Emacs to finish the test.' > instr2.txt

CMD bash -c 'emacs instr1.txt && emacs instr2.txt'
