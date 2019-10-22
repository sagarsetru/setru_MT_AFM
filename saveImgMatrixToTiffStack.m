function saveImgMatrixToTiffStack(img,pathname,fname,dataType)
%saveImgMatrixToTiffStack.m - fxn will save img to pathname/fname.tiff
% Sagar Setru, 2019 09 17
%%

tiffFileSave = [pathname,'/',fname,'.tiff'];

for t = 1:size(img,3)

        if t == 1

            if strcmp(dataType,'uint16')
                imwrite(uint16(img(:,:,t)),tiffFileSave)
            elseif strcmp(dataType,'int16')
                imwrite(int16(img(:,:,t)),tiffFileSave)
            else
                error('dataType must be string, either "uint16" or "int16"')
            end
            %imwrite(uint16(m.data_bgSubt(:,:,t)),tiffFileSave_bgSubt)

        else

            if strcmp(dataType,'uint16')
                imwrite(uint16(img(:,:,t)),tiffFileSave,'WriteMode','append')
            elseif strcmp(dataType,'int16')
                imwrite(int16(img(:,:,t)),tiffFileSave,'WriteMode','append')
            else
                error('dataType must be string, either "uint16" or "int16"')
            end
            %imwrite(uint16(m.data_bgSubt(:,:,t)),tiffFileSave_bgSubt,'WriteMode','append')

        end
        
end
    
end

