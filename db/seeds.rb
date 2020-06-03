# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  (1..50).each do |i|
    Board.create(user_id: "#{i%3+1}", name: "ユーザー#{i}", title: "タイトル#{i}", body: "本文#{i}", star_rate: i%6)
  end

  Tag.create([
    { name: '勉強' },
    { name: '仕事' },
    { name: 'スポーツ' },
    { name: '恋愛' },
    { name: '夫婦' },
    { name: '家族' },
    { name: '対人関係' },
    { name: '自分自身' },
    { name: '受験' },
    { name: '就活' },
    { name: '子育て' },
    { name: '趣味' },
    { name: 'その他' }
  ])
end

if Rails.env == 'production'
  Tag.create([
    { name: '勉強' },
    { name: '仕事' },
    { name: 'スポーツ' },
    { name: '恋愛' },
    { name: '夫婦' },
    { name: '家族' },
    { name: '対人関係' },
    { name: '自分自身' },
    { name: '受験' },
    { name: '就活' },
    { name: '子育て' },
    { name: '趣味' },
    { name: 'その他' }
  ])
end
