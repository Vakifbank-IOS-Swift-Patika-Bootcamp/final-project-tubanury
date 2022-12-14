//
//  CoreDataManager.swift
//  RawgGames
//
//  Created by Tuba N. Yıldız on 10.12.2022.
//

import UIKit
import CoreData

class CoreDataManager {
    
  
    static let shared = CoreDataManager()

    private let managedContext: NSManagedObjectContext!
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }

    func saveNote(title: String, text: String) -> Note?{
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)!
        let note = NSManagedObject(entity: entity, insertInto: managedContext)
        note.setValue(title, forKeyPath: "noteTitle")
        note.setValue(text, forKeyPath: "noteText")
        
        do {
            try managedContext.save()
            return note as? Note
        } catch _ as NSError {
            
        }
        
        return nil
    }
    
    func getNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
        do {
            let notes = try managedContext.fetch(fetchRequest)
            return notes as! [Note]
        } catch _ as NSError {
        }
        return []
    }
    
    func deleteNote(note: Note) {
        managedContext.delete(note)
        
        do {
            try managedContext.save()
        } catch _ as NSError {
        }
    }
    
    func updateNote(note: Note) -> Note {
        note.setValue(note.noteText, forKey: "noteText")
        note.setValue(note.noteTitle, forKey: "noteTitle")
        if note.hasChanges {
            do {
                try managedContext.save()
            } catch _ as NSError {
            }
            return note
        }
        return note
        
    }
    func fetchGames() -> [Game]{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Game")
        do {
            let games = try managedContext.fetch(fetchRequest)
            return games as! [Game]
        } catch _ as NSError {
        }
        return []
    }
    
    func isGameSaved(id: Int) -> [Game] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Game")
        fetchRequest.predicate = NSPredicate(format: "id == %i", id)
        do {
            let games = try managedContext.fetch(fetchRequest)
            return games as! [Game]
        } catch _ as NSError {
        }
        return []
    }
    
    func saveGame(id: Int, name: String, tag: String, img: Data) -> Game? {
        let entity = NSEntityDescription.entity(forEntityName: "Game", in: managedContext)!
        let game = NSManagedObject(entity: entity, insertInto: managedContext)
        
        game.setValue(img, forKey: "image")
        game.setValue(id, forKey: "id")
        game.setValue(name, forKey: "name")
        game.setValue(tag, forKey: "tag")
        do {
            try managedContext.save()
            return game as? Game
        } catch _ as NSError {
        }
    
        return nil
        
    }
    
    func deleteGame(game: Game) {
        managedContext.delete(game)
        do {
            try managedContext.save()
        } catch _ as NSError {
        }
    }
    
}
