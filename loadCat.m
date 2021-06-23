function var = loadCat( dim, files, varname )
%LOADCAT Concatenate variables of same name appearing in multiple MAT files
%  
%   where dim is dimension to concatenate along,
%         files is a cell array of file names, and
%         varname is a string containing the name of the desired variable

    if( isempty( files ) )
        var = [];
        return;
    end
    var = load( files{1}, varname );
    var = var.(varname);

    for f = 2:numel(files),

        newvar = load( files{f}, varname );
            if( isfield( newvar, varname ) )
                var = cat( dim, var, newvar.(varname) );
            else
                warning( 'loadCat:missingvar', [ 'File ' files{f} ' does not contain variable ' varname ] );
            end
        end 

    end