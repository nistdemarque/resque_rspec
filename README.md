# resque_rspec
RSpec example for Resque job

To be able to run those scripts, install the following gems:

rspec
resque
resque-status

Then, you must start a worker in root of this folder:

TERM_CHD=1 QUEUE=resque_test rake resque:work &