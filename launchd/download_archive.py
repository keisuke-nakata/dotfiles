import datetime as dt
import logging
import re
from pathlib import Path
import shutil
import sys

PROGRAM_NAME = "DownloadArchive"
DIR = Path("/Users/keisuke.nakata/Downloads")

# setting up logger
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
fmt = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
formatter = logging.Formatter(fmt)
ch.setFormatter(formatter)

logger = logging.getLogger(PROGRAM_NAME)
logger.setLevel(logging.DEBUG)
logger.addHandler(ch)

# generate directory name for archiving
dirname = dt.datetime.now().strftime("%Y%m%d")
archive_dir = DIR / dirname
if archive_dir.exists():
    logger.warning(f"{dirname} already exists. Skipped {PROGRAM_NAME}.")
    sys.exit()
logger.debug(f"{PROGRAM_NAME}...")

# match archiving target files
yyyymmdd_pat = re.compile(r"^202\d(0[1-9]|10|11|12)([012]\d|30|31)$")
moving_targets = [
    f for f in DIR.iterdir()
    if not (f.is_dir() and re.match(yyyymmdd_pat, f.name) is not None)
]

if len(moving_targets) == 0:
    logger.debug("There is no new file/directory to archive.")
    sys.exit()

# do archiving
archive_dir.mkdir(exist_ok=False)
for moving_target in moving_targets:
    shutil.move(moving_target, archive_dir)
logger.info(f"{PROGRAM_NAME}... done.")
