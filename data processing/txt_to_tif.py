# Sagar Setru
# 2019 09 10
# script to write macros for ImageJ to save txt img as tif

import glob
import os
from pathlib import Path

#fname = '/Users/sagarsetru/files.txt'
#fname = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/files.txt'

# fname = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files.txt'

# list of files
# this files are each lists of .txt image files processed and then exported from Gwyddion

# fnames = [
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files1.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files10.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files11.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files12.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files13.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files14.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files15.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files16.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files2.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files3.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files4.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files5.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files6.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files7.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files8.txt',
#     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files9.txt',
#     ]

fnames = [
    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/data processing/files17.txt',
    ]

# loop over files
for fname in fnames:
    # from https://stackoverflow.com/questions/3277503/how-to-read-a-file-line-by-line-into-a-list
    with open(fname) as f:
        txtfiles = f.readlines()
    txtfiles = [x.strip() for x in txtfiles]
    
    #closeLine = ['close();']
    
    
    
    counter = 0
    for txtfile in txtfiles:
        macroLines = []
        
        counter += 1
        
        print('working on:')
        print(txtfile)
        print('file ',counter,' out of ',len(txtfiles))
        print(' ')
    
        txtfileNoExt = os.path.splitext(txtfile)[0]
    
        macroLines.append('run("Text Image... ", "open=['+txtfile+']");\n')
        macroLines.append('saveAs("Tiff", "'+txtfileNoExt+'.tif");\n')
        macroLines.append('close();')
    
        with open('macro.ijm','w') as f:
            for line in macroLines:
                f.write("%s" % line)
            #...
        #...
        print('running:')
        print('/Applications/Fiji.app/Contents/MacOS/ImageJ-macosx --headless -macro macro.ijm')
        print(' ')
        
        # then run imagej macro
        os.system("/Applications/Fiji.app/Contents/MacOS/ImageJ-macosx --headless -macro macro.ijm")
    
        # delete the macro
        #os.system("rm macro.ijm")

    
    
