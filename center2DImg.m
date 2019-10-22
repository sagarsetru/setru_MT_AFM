function [img2] = center2DImg(img,xc,yc,removeFrames,fr_rem)
%center2DImg.m - fxn to center image about points given
% Sagar Setru
% 20 August 2019
    %find centrosome centers w.r.t. center of matrix
    imgSize = size(img);
    xc_mt2 = -(xc - imgSize(1)/2);
    yc_mt2 = -(yc - imgSize(2)/2);
    
    %round away from zero to get max and min amplitudes
    max_xc_mt2 = rafz(max(xc_mt2));
    min_xc_mt2 = rafz(min(xc_mt2));
    max_yc_mt2 = rafz(max(yc_mt2));
    min_yc_mt2 = rafz(min(yc_mt2));

    %get largest of these and use for padding
    padval = max(abs([max_xc_mt2 min_xc_mt2 max_yc_mt2 min_yc_mt2]));
    %build image pads
    padt = zeros(imgSize(1),padval,imgSize(3));
    padr = zeros(padval,imgSize(2)+padval,imgSize(3));
    padb = zeros(imgSize(1)+padval,padval,imgSize(3));
    padl = zeros(padval,padval+imgSize(2)+padval,imgSize(3));

    %build images with pads
    %clear imgp
    img = cat(2,padt,img);
    img = cat(1,img,padr);
    img = cat(2,img,padb);
    img = cat(1,padl,img);
    
    % get size of padded image
    imgSize2 = size(img);

    %%% translate image in each frame such that aster is in the center
    img2 = zeros(imgSize2);
    img=double(img);
    
    %if removing frames, translate only those frames which are to be kept,
    %and set the other frames that are to be removed all to zero
    if removeFrames
        % get vector of frames to be kept
        fr_keep = [1:imgSize(3)]';
        fr_keep(ismember(fr_keep,fr_rem)) = [];
        % loop through these frames and translate
        for j = 1:size(fr_keep)
            fr_n = fr_keep(j);
            img2(:,:,fr_n) = imtranslate(img(:,:,fr_n),[xc_mt2(fr_n) yc_mt2(fr_n)]);
        end
        % set frames to be removed to zero
        img2(:,:,fr_rem) = 0;
    else
        for j = 1:imgSize(3)
            img2(:,:,j) = imtranslate(img(:,:,j),[xc_mt2(j) yc_mt2(j)]);
        end
    end
    img2 = double(img2);
end

