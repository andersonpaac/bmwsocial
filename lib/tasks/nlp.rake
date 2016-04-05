desc "Process new posts & messages for new suggestions & alerts"
task :nlp => :environment do
  nlp = NLP.new
  nlp.init
  nlp.nlp
end

class NLP 
      
  def init    
    @food = Array.new
    @alcohol = Array.new
    @movies = Array.new
  
    # lets_go_actio means user needs to go somewhere. e.g., "Let's go get a sandwich for lunch?"
    @lets_go_action = "let's"
    # do_you_want_action means user might go somewhere. e.g., "Do you wanna watch Zootopia after work?"
    @do_you_want_action = "do you want to"
    # consume_action means user has just consumed something e.g., "Just had some beers with my friends"
    @consume_action = "had"      
    
    food_file = File.open(file_path_for 'food.txt')
    alcohol_file = File.open(file_path_for 'alcohol.txt')
    movie_file = File.open(file_path_for 'movies.txt')
    read_data(@food, food_file)
    read_data(@alcohol, alcohol_file)
    read_data(@movies, movie_file)      
  end  
  
  def read_data(destination_array, file_name)
    file = File.open(file_name)
    unless file.nil?
      file.each do |line|
        destination_array << line.strip
      end
    end
  end

  def file_path_for(filename)
    Rails.root.join('lib', 'tasks', filename)
  end

  def latest_post_id
    post = Post.last
    if post.nil? 
      return 0
    else
      return post.id
    end
  end

  def latest_message_id
    message = Message.last
    if message.nil? 
      return 0
    else
      return message.id
    end  
  end

  def contain_keyword?(array, str)
    dwoncase_str = str.downcase
    array.each do |word|
      if dwoncase_str.include?(word)
        return true
      end
    end
    false
  end
  
  # check whether user is going to get some food
  def is_user_getting_food?(str)
    downcase_str = str.downcase()            
    return ( (downcase_str.include?(@lets_go_action)) or downcase_str.include?(@do_you_want_action) ) && (contain_keyword?(@food, downcase_str))
  end
  
  # check whether user consumed alcohol within 3 hours.  if consume_action + alcohol => alert
  def did_user_consume_alcohol_within_3_hours?(str)        
    downcase_str = str.downcase()        
    return (downcase_str.include? (@consume_action)) && (contain_keyword?(@alcohol, downcase_str))        
  end

  def nlp     
    # id for lastest message/post processed
    post_id = latest_post_id
    message_id = latest_message_id
  
    # fetch new messages & posts every 5 seconds

    # if lets_go_action / do_you_want_action + food => restaurant suggestions

    # if lets_go_action / do_you_want_action + movies => theaters suggestions

    # if consume_action + alcohol => alert

    while true do
      posts = Post.where("id > ?", post_id).order(created_at: :desc)
      messages = Post.where("id > ?", message_id).order(created_at: :desc)
    
      if posts.count > 0
        post_id = posts.first.id
      end
    
      if messages.count > 0
        message_id = messages.first.id
      end
            
      if posts.count == 0 && messages.count == 0
        next
      end
      
      if posts.count > 0        
        posts.each do |post|
          if did_user_consume_alcohol_within_3_hours?(post.content)  
            # insert action about alcohol
            action = Action.create({})
          end          
          if is_user_getting_food?(post.content)
          end                      
        end        
      end    
      
      if messages.count > 0
        
      end
      
      sleep(2)        
    end
  end
end
