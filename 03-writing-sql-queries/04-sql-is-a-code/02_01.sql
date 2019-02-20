  -- artists names used as track names by other artists
  SELECT artist.name AS artist,
         -- "inspired" is the other artist
         inspired.name AS inspired,
         album.title AS album,
         track.name AS track
    FROM      artist
         /*
          * Here we join the artist name on the track name,
          * which is not our usual kind of join and thus
          * we don't use the using() syntax. For
          * consistency and clarity of the query, we use
          * the "on" join condition syntax through the
          * whole query.
          */
         JOIN track
           ON track.name = artist.name
         JOIN album
           ON album.albumid = track.albumid
         JOIN artist inspired
           ON inspired.artistid = album.artistid
   WHERE artist.artistid <> inspired.artistid;
