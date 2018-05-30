python3.6 pix2pix.py   --mode train --output_dir ../MMGcache/test2train1/checkpoint/ --max_epochs 50 --input_dir maps/train/ --which_direction AtoB
python3.6 pix2pix.py   --mode test --checkpoint ../MMGcache/test2train1/checkpoint/ --output_dir ../MMGcache/test2train1/train_processed --input_dir maps/train
python3.6 create_dataset.py maps/train ../MMGcache/test2train2/train higher
python3.6 pix2pix.py   --mode train --output_dir ../MMGcache/test2train2/checkpoint/ --max_epochs 100 --input_dir ../MMGcache/test2train2/train/ --which_direction AtoB
python3.6 pix2pix.py   --mode test --checkpoint ../MMGcache/test2train2/checkpoint/ --output_dir ../MMGcache/test2train2/train_processed --input_dir ../MMGcache/test2train2/train
python3.6 create_dataset.py maps/train ../MMGcache/test2train3/train higher
python3.6 pix2pix.py   --mode train --output_dir ../MMGcache/test2train3/checkpoint/ --max_epochs 200 --input_dir ../MMGcache/test2train3/train --which_direction AtoB
