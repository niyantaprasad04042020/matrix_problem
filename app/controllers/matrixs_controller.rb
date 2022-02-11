class MatrixsController < ApplicationController
  def sub_matrix
    matrix     = params[:matrix]
    sub_matrix = []
    row        = matrix.length
    column     = matrix[0].length
    
    # creating a initial sub_matrix 
    sub_matrix << matrix[0]
    for i in 1..row-1
      row_array = []
      row_array << matrix[i][0]
      for j in 1..column-1
        row_array << 0
      end
      sub_matrix << row_array
    end

    # calculating the maximum value in sub matrix
    for i in 1..row-1
      for j in 1..column-1
        if matrix[i][j] == 1
          sub_matrix[i][j] = [sub_matrix[i][j-1], sub_matrix[i-1][j], sub_matrix[i-1][j-1]].min + 1
        else
          sub_matrix[i][j] = 0
        end
      end
    end
    
    # finding the coordinates of the maximum value in the sub-matrix
    max_of_s   = sub_matrix[0][0] 
    max_row    = 0 
    max_column = 0
    for i in 0..row-1
      for j in 0..column-1
        if max_of_s <= sub_matrix[i][j]
            max_of_s      = sub_matrix[i][j]
            max_row       = i
            max_column    = j
        end
      end
    end

    
    # printing the final matrix
    final_matrix = Array.new(max_column,Array.new)
    for i in 0..max_column-1
      for j in 0..max_row-1
        final_matrix[i][j] = 1
      end
    end
    
    respond_to do |format|
      if final_matrix.present?
        format.json { render json: {sub_matrix: final_matrix} }
      end
    end
  end

  private

  def matrix_params
    params.require(matrix: [])
  end
end
