import datetime as dt
import logging
import re
from pathlib import Path
import shutil
import sys

ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
fmt = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
formatter = logging.Formatter(fmt)
ch.setFormatter(formatter)

logger = logging.getLogger("DownloadArchive")
logger.setLevel(logging.DEBUG)
logger.addHandler(ch)

dirname = dt.datetime.now().strftime("%Y%m%d")
downloads_dir = Path("/Users/keisuke.nakata/Downloads")
archive_dir = downloads_dir / dirname
if archive_dir.exists():
    logger.warning(f"{dirname} already exists. Skipped DownloadArchive.")
    sys.exit()
logger.debug("Archiving Downloads...")

yyyymmdd_pat = re.compile(r"202\d(0[1-9]|10|11|12)([012]\d|30|31)$")
moving_targets = (
    f for f in downloads_dir.iterdir()
    if not (f.is_dir() and re.match(yyyymmdd_pat, f.name) is not None)
)

archive_dir.mkdir(exist_ok=False)
for moving_target in moving_targets:
    shutil.move(moving_target, archive_dir)
else:
    archive_dir.rmdir()
    logger.debug("There is no new Downloads.")
logger.info("Archiving Downloads... done.")
