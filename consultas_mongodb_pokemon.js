
// 🔥 1. Encuentra todos los Pokémon de tipo “Electric”
db.Pokemones.find({ Type1: "Electric" })

// 🗡️ 2. Muestra nombres y ataque de Pokémon con más de 100 de ataque
db.Pokemones.find({ Attack: { $gt: 100 } }, { Name: 1, Attack: 1, _id: 0 })

// 🛡️ 3. Pokémon con defensa entre 80 y 100 (inclusive)
db.Pokemones.find({ Defense: { $gte: 80, $lte: 100 } })

// 📊 4. Promedio de ataque por tipo
db.Pokemones.aggregate([
  { $group: { _id: "$Type1", promedioAtaque: { $avg: "$Attack" } } },
  { $sort: { promedioAtaque: -1 } }
])

// ❤️ 5. Pokémon con más HP por tipo
db.Pokemones.aggregate([
  { $sort: { HP: -1 } },
  { $group: { _id: "$Type1", Nombre: { $first: "$Name" }, MaxHP: { $first: "$HP" } } },
  { $sort: { MaxHP: -1 } }
])

// ⚡ 6. Top 5 Pokémon más rápidos
db.Pokemones.find().sort({ Speed: -1 }).limit(5)

// 🌊 7. Promedio de ataque de Pokémon tipo “Water” por generación
db.Pokemones.aggregate([
  { $match: { Type1: "Water" } },
  { $group: { _id: "$Generation", promedioAtaque: { $avg: "$Attack" } } },
  { $sort: { promedioAtaque: -1 } }
])

// 🔍 8. Análisis de rendimiento con explain()
db.Pokemones.find({ Type1: "Fire" }).explain("executionStats")

// 🧱 9. Crear índice compuesto
db.Pokemones.createIndex({ Type1: 1, Speed: 1 })

// 📈 10. Usa explain() para analizar el rendimiento de una búsqueda: 
db.Pokemones.find({ Type1: "Fire" }).explain("executionStats")

// 11.🧩 Crea un índice compuesto en Type1 y Speed, y analiza una búsqueda:
db.Pokemones.find({ Type1: "Electric" })
  .sort({ Speed: -1 })
  .explain("executionStats")
