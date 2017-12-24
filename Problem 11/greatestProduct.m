ROW = 1;
COL = 2;
NUM = 4; %how many adjacent numbers we want to multiply

grid = dlmread("grid");
greatestProd = 0;

disp(grid)
disp(greatestProd)

for i = 1:1:size(grid)(ROW)   %cycle through rows
  for j = 1:1:size(grid)(COL) %cycle through columns

    %check horizontal products
    test = zeros(1,4);
    for k = 1:1:NUM
      if j+k-1 <= size(grid)(COL)
        test(k) = grid(i,j+k-1);
      end
    end
    testProd = prod(test);
    if testProd > greatestProd
      greatestProd = testProd;
    end
    
    %check vertical products
    test = zeros(1,4);
    for k = 1:1:NUM
      if i+k-1 <= size(grid)(ROW)
        test(k) = grid(i+k-1,j);
      end
    end
    testProd = prod(test);
    if testProd > greatestProd
      greatestProd = testProd;
    end
    
    %check downhill diagonal products
    test = zeros(1,4);
    for k = 1:1:NUM
      if i+k-1 <= size(grid)(ROW) && j+k-1 <= size(grid)(COL)
        test(k) = grid(i+k-1,j+k-1);
      end
    end
    testProd = prod(test);
    if testProd > greatestProd
      greatestProd = testProd;
    end
    
    %check uphill diagonal products
    test = zeros(1,4);
    for k = 1:1:NUM
      if i-k+1 > 0 && j+k-1 <= size(grid)(COL)
        test(k) = grid(i-k+1,j+k-1);
      end
    end
    testProd = prod(test);
    if testProd > greatestProd
      greatestProd = testProd;
    end
    
  end
end

disp("The greatest product is: ")
disp(greatestProd)