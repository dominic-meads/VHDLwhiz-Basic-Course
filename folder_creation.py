import os

for x in range(5, 24):  # already made first 4 folders
  if x <= 9:
    folder_name = "T0" + str(x)
  else: 
    folder_name = "T" + str(x)
  subfolder_names = ["src", "sim"]
  for subfolder_name in subfolder_names:
      os.makedirs(os.path.join(folder_name, subfolder_name))