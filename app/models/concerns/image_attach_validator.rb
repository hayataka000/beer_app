class ImageAttachValidator < ActiveModel::Validator
  def validate(record)
    unless record.image.attached?
      record.errors[:image] << 'you need to attach some image'
    end
  end
end