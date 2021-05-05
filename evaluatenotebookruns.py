# evaluatenotebookruns.py
import json
import glob
import os
import sys

def test_job_run():
  path = sys.argv[1]
  statuses = []

  for filename in glob.glob(os.path.join(path, '*.json')):
      print('Evaluating: ' + filename)
      data = json.load(open(filename))
      print('Run name: ' + data['metadata']['run_name'])
      status_job = data['metadata']['state']['result_state']
      statuses.append(status_job.lower())
      
      if status_job=='SUCCESS':
          status_notebook = data['notebook_output']['result']
          statuses.append(status_notebook.lower())
  if('failed' in statuses):
       raise Exception("Data Quality tests failed")

if __name__ == '__main__':
  test_job_run()