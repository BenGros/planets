# get user to input file
print('get file:')
file = input()
# use file for method
def read(file):
  with open(file, 'r') as f:
    contents = f.read()
  return contents
