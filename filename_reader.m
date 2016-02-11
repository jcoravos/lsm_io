function [ list ] = filename_reader(directory_name)
%filename_reader takes the visible filenames from a file and puts them into
%a list.
p = struct2cell(dir(directory_name));
[m,n] = size(p);
list = cell(1,1)
for col = 1:n
    
    if isempty(regexp(p{1,col},'^\.','match')) == true %if the cell is empty, it means the filename does not start in a '.' so keep it.
        if isempty(list{1}) == 1
            list{1} = p{1,col}
            continue
        else
            list{end+1} = p{1,col}
            continue
        end
    else
        continue
    end
end
end

