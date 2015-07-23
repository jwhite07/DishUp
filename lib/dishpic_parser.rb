class DishpicParser
  def self.crawl_folder(folder)
    folder_path = Rails.root + folder
    targetNames = File.read(File.join(Rails.root, "dishpics.txt")).split("\n")
    destPath = File.join(Rails.root, "dishpicsParsed")
    trueCounter = 0
    not_found = []
    multiples = []
    new_names = []
    #puts targetNames
    #puts folder_path
    file_tree = {}
    folders = Dir.entries(folder_path)
    folders.shift
    folders.shift
    
    folders.each do |f|
      files = Dir.entries(folder_path + f)
      files.shift
      files.shift
      files.each do |img|
        old_name = img.dup
        puts img
        img.slice!(".jpg")
        img.slice!(".JPG")
        puts img
        splitImg = img.split(/[\-]/)
        new_name = ""
        splitImg.map!{|i| i.parameterize.underscore.camelize}
        
        new_name = "#{splitImg[0]}_#{splitImg[1]}.jpg"
        puts new_name
        if targetNames.include? new_name
          puts true
          new_names << new_name
          trueCounter += 1
          source_path = "#{folder_path}/#{f}/#{old_name}"
          destination_path = "#{destPath}/#{new_name}"
          puts "Source: #{source_path}"
          puts "Destination: #{destination_path}"
          File.rename(source_path, destination_path)
        elsif new_name.include? "Logo"
          puts "Skipped"
        elsif new_name.include? "2" or new_name.include? "3"
          puts "Skipped"
          multiples << new_name
        else
          puts false
          not_found << new_name
        end
        
      end
    end
    puts "Matches found: #{trueCounter}"
    puts "Not Matched: #{not_found.count}"
    puts "List of Multiple Images: #{multiples.count}"
    puts multiples
    puts "List of unmatched files: "
    puts not_found
    dishes_missing_images = targetNames - new_names
    puts "List of Dishes missing images #{dishes_missing_images.count}:"
    puts dishes_missing_images
  end
  
end
