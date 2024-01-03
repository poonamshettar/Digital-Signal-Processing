% Perform some computation or load data
A = rand(1000);  % Example operation, replace with your actual process

% Check memory usage before the operation
pre_operation_memory = memory;
fprintf('Memory before the operation: %.2f MB\n', pre_operation_memory.MemUsedMATLAB / 1e6);

% Perform the operation
% Replace the following line with your actual process or computation
result = A * A;

% Check memory usage after the operation
post_operation_memory = memory;
fprintf('Memory after the operation: %.2f MB\n', post_operation_memory.MemUsedMATLAB / 1e6);
