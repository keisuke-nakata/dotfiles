[ipython-contrib/jupyter_contrib_nbextensions: A collection of various notebook extensions for Jupyter](https://github.com/ipython-contrib/jupyter_contrib_nbextensions "ipython-contrib/jupyter_contrib_nbextensions: A collection of various notebook extensions for Jupyter")

Dockerfile では、作るディレクトリ/ファイルたちの権限を chmod -R 0777 とかしてあげること
```
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable contrib_nbextensions_help_item/main
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable freeze/main
jupyter nbextension enable highlight_selected_word/main
jupyter nbextension enable keyboard_shortcut_editor/main
jupyter nbextension enable nbextensions_configurator/tree_tab/main
jupyter nbextension enable nbextensions_configurator/config_menu/main
jupyter nbextension enable notify/notify
jupyter nbextension enable scratchpad/main
jupyter nbextension enable scroll_down/main
jupyter nbextension enable snippets/main

# MacOS
# JUPYTER_PATH=${HOME}/Library/Jupyter
# Linux
JUPYTER_PATH=${HOME}/.local/share/jupyter

sed -i -e "s/'ctrl-b': toggle_action,/'ctrl-s': toggle_action,/g" ${JUPYTER_PATH}/nbextensions/scratchpad/main.js

cat << EOS > ${JUPYTER_PATH}/nbextensions/snippets/snippets.json
{
    "snippets" : [
        {
            "name" : "example",
            "code" : [
                "# This is an example snippet!",
                "# To create your own, add a new snippet block to the",
                "# snippets.json file in your jupyter nbextensions directory:",
                "# /nbextensions/snippets/snippets.json",
                "import this"
            ]
        },
        {
            "name" : "notebook first cell",
            "code" : [
"from pprint import pprint",
"",
"import numpy as np",
"import matplotlib.pyplot as plt",
"import pandas as pd",
"from IPython.display import display_html",
"",
"def summary(df):",
"    df.info()",
"    display_html(df.head())",
"    display_html(df.describe().T)",
"",
"# turn off autoCloseBrackets",
"from notebook.services.config import ConfigManager",
"c = ConfigManager()",
"_ = c.update('notebook', {'CodeCell': {'cm_config': {'autoCloseBrackets': False}}})",
"",
"%matplotlib inline"
            ]
        },
        {
            "name" : "dynsim sys path append",
            "code" : [
        "import sys",
        "sys.path.append('/mnt/vol10/nakata/home/jxtg/dynsim/dynsim/')"
            ]
        }
    ]
}

EOS
```
