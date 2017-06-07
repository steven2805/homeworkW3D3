require('pg')

class SetRunner
  def SetRunner.run(sql)
    begin 
      db = PG.connect({dbname: 'music_db', host: 'localhost' })
      result = db.exec(sql)
    ensure 
      db.close()
    end
    return result 
  end
end
