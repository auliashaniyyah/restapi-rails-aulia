class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
  
    storage :fog
  
    version :landscaped do
      process resize_and_pad: [320, 150]
    end
  
    def size_range
      0..2.megabytes
    end
  
    def store_dir
      "#{ENV['DO_FOLDER']}/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
    def extension_whitelist
      %w[jpg jpeg gif png svg]
    end
  end