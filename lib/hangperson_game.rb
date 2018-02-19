class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service
  
  attr_accessor :word, :letter, :game, :win, :lose, :play, :guesses, :show, :wrong_guesses, :guess
  
   def guess(letter)
       
       
    if letter.nil? or letter == "" or !letter.match(/[A-Za-z]/)
        
       raise ArgumentError.new("Invalid guess.")
           
    end
    
    

    if (@guesses || "").include?(letter) or (@wrong_guesses || "").include?(letter)
        
           return false
           
    end
           
    if (@word || "").include?(letter)
            
            @guesses += letter
            
            return true
            
    else
            @wrong_guesses += letter
            
            return true
            
    end
    
    
    
   end
        
   
    
    
    
  
  
  def check_win_or_lose
      
   if @wrong_guesses.length >= 7
       
      return :lose
      
   end
  
  
  
   if not word_with_guesses.include? "-"
      
      return :win
      
   end
   
   :play
  
  end
  
  
  def word_with_guesses()
      
  @word.gsub(/[^ #{@guesses}]/,'-')
  
  
    
  end
  
  
  
  
  

   
  
  def initialize(word)
    
    @word = word
    @game = game
    @win = win
    @lose = lose
    @show = show
    @guess = ""
    @wrong_guesses = ""
    @letter = letter
   
    
  end
  
  

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end
 
 

   

end
   





  
  
