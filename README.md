# File Structure:
- Dockerfile
- environment.yml
- requirements-torch.txt
- requirements-pyg.txt
- README.md

# Conventional Conda Environment Creation:
- conda create -n main_latest "python<3.13" xesmf -c conda-forge
- conda activate main_latest
- conda install -c conda-forge richdem
- pip install geopandas xarray zarr cfgrib joblib tqdm jupyter matplotlib seaborn networkx dask numba rasterio rioxarray netCDF4 cartopy fiona ipyleaflet pyflwdir
- conda install -c conda-forge gdal
- pip install torch==2.4.1 torchvision==0.19.1 torchaudio==2.4.1 --index-url https://download.pytorch.org/whl/cu124
- pip install torch_geometric
- pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.4.0+cu124.html