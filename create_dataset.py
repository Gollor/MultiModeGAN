import os
import shutil
import argparse
import json

parser = argparse.ArgumentParser(description='Create a new dataset given the GAN output. '
                                 'This dataset will contain only the half of images, '
                                 'separated by median loss.')
parser.add_argument('path_from', help='Path to the folder with images to copy.')
parser.add_argument('path_to', help='Path to create the folder with the selected images.')
parser.add_argument('rule', choices=['lesser', 'higher'])
args = parser.parse_args()

ds = json.load(open("dataset_eval.json"))
imagenames_ascending = sorted(list(ds.keys()), key=lambda x: ds[x])
in_len = len(imagenames_ascending)
if args.rule == 'lesser':
    images_names = set(imagenames_ascending[:in_len//2])
else:
    images_names = set(imagenames_ascending[in_len//2:])

files = os.listdir(args.path_from)
os.makedirs(args.path_to, exist_ok=True)
for file in files:
    if '.'.join(file.split('.')[:-1]) in images_names:
        shutil.copyfile(os.path.join(args.path_from, file), os.path.join(args.path_to, file))
print("Done")

