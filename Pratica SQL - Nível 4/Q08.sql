select movies.id, movies.name
from movies join genres on movies.id_genres = genres.id and genres.description = 'Action';