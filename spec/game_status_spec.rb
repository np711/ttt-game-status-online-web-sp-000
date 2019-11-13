require_relative '../lib/game_status.rb'

describe "./lib/game_status.rb" do
  describe 'WIN_COMBINATIONS' do
    it 'defines a constant WIN_COMBINATIONS with arrays for each win combination' do
      expect(WIN_COMBINATIONS.size).to eq(8)

      expect(WIN_COMBINATIONS).to include_array([0,1,2])
      expect(WIN_COMBINATIONS).to include_array([3,4,5])
      expect(WIN_COMBINATIONS).to include_array([6,7,8])
      expect(WIN_COMBINATIONS).to include_array([0,3,6])
      expect(WIN_COMBINATIONS).to include_array([1,4,7])
      expect(WIN_COMBINATIONS).to include_array([2,5,8])
      expect(WIN_COMBINATIONS).to include_array([0,4,8])
      expect(WIN_COMBINATIONS).to include_array([6,4,2])
    end
  end

  def won?(board)
winner = []
empty_board = board.all? {|x| x == " "}
WIN_COMBINATIONS.each do |sub_array|
    if empty_board || full?(board)
      return false
    elsif sub_array.all? { |value| board[value] =="X" } || sub_array.all? { |value| board[value] =="O" }
      winner = sub_array
    end
  end
  winner
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board) || !won?(board)
    return false
  end
end