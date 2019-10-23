#import gwyfile
import access2thematrix

#obj = gwyfile.load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/naked MTs/mt_naked_.0_00067.spm')

mtrx_data = access2thematrix.MtrxData()
data_file = r'/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/naked MTs/mt_naked_.0_00067.spm'
traces, message = mtrx_data.open(data_file)
