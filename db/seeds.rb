# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subsc.find_or_create_by!(
    name: "snakcs",
    company_name: "スナック会社",
    title: "sunaku",
    introduction: "oisii",
    fee: "1000",
    postage: "200",
    delivery_frequency: "1週間",
    minimum_period: "2週間"
)

    Subsc.find_or_create_by!(
    name: "チョコ",
    company_name: "スナック会社",
    title: "sunaku",
    introduction: "oisii",
    fee: "1000",
    postage: "200",
    delivery_frequency: "1週間",
    minimum_period: "2週間"
    )

    Subsc.find_or_create_by!(
    name: "クッキー",
    company_name: "スナック会社",
    title: "sunaku",
    introduction: "oisii",
    fee: "1000",
    postage: "200",
    delivery_frequency: "1週間",
    minimum_period: "2週間"
)

admin = Admin.find_or_initialize_by(email: "admin@yahoo.co.jp")
if admin.new_record?
  admin.assign_attributes(password: "123123")
  admin.save!
end