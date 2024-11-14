function increment_constant()
  % Get the constant block handle with error handling
  constantBlock = find_system(gcs, 'BlockType', 'Constant', 'Name', 'mode');
  if isempty(constantBlock)
    error('Constant block "mode" not found!');
  end

  try
    % Get current value; handle potential errors and type conversion.
    currentValue = get_param(constantBlock{1}, 'Value');
    currentValue = str2double(currentValue); %Convert to double, handles string values

  if isnan(currentValue) || isinf(currentValue)
      currentValue = 0; % Reset if invalid
   end
    
  % lookupTable = [1, 2, 3, 4];
   %index = mod(currentValue, 4) + 1; %Correct index calculation
  %newValue = lookupTable(index);
 
if currentValue==4
    currentValue=0;
    newValue = currentValue + 1;
else
  newValue = currentValue + 1;
end
       
  %Ensure newValue is an int32 before setting the parameter
  newValue = double(newValue);
    % Set parameter.
    set_param(constantBlock{1}, 'Value', num2str(newValue));
    
     
  catch ME
    error(['Error updating constant: ' ME.message]); %Detailed error message for debugging
  end
end
