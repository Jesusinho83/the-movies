//
//  FirebaseViewModel.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 06/10/22.
//

import Foundation
import Firebase

class FirebaseViewModel: ObservableObject{
    
    @Published var show = false
    @Published var datos = [FirebaseModel]()
    
    func login(email:String, pass: String, completation: @escaping (_ done: Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: pass){ (user, error) in
            if user != nil {
                print("entro")
                completation(true)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en firebase", error)
                    
                }else{
                    print("Error en la app")
                }
            }
        }
        
    }
    func createUser(email:String, pass: String, completation: @escaping (_ done: Bool) -> Void){
        Auth.auth().createUser(withEmail: email, password: pass){ (user, error) in
            if user != nil {
                print("Entro y se registro")
                completation(true)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en firebase de registro", error)
                }else{
                    print("Error en la app")
                }
            }
            
        }
        
    }
    
    // Base de datos
    
    // Guardar
    func save(titulo:String,portada:String,descripcion:String,favoritos:Bool,fecha:String,calificacion:Double,completion: @escaping (_ done: Bool)-> Void){
        let db = Firestore.firestore()
        let id = UUID().uuidString
        let campos : [String:Any] = ["titulo": titulo,"descripcion": descripcion,"portada":portada,"favoritos": favoritos,"fecha":fecha,"calificacion":calificacion]
        db.collection("Favoritos").document(id).setData(campos){error in
            if let error = error?.localizedDescription{
                print("error en guardar en firestore", error)
            }else{
                print("guardo todo")
                completion(true)
            }
        }
    }
    
    // Mostrar
    func getData(){
        let db = Firestore.firestore()
        db.collection("Favoritos").addSnapshotListener { (QuerySnapshot, error) in
            if let  error = error?.localizedDescription{
                print("error al mostrar datos",error)
            }else{
                self.datos.removeAll()
                for document in QuerySnapshot!.documents{
                    let valor = document.data()
                    let id = document.documentID
                    let titulo = valor["titulo"] as? String ?? "sin titulo"
                    let portada = valor["portada"] as? String ?? "sin titulo"
                    let descripcion = valor["descripcion"] as? String ?? "sin titulo"
                    let fecha = valor["fecha"] as? String ?? "sin titulo"
                    let favoritos = valor["favoritos"]
                    let calificacion = valor["calificacion"]
                    DispatchQueue.main.async {
                        let registros = FirebaseModel(id: id, titulo: titulo, portada: portada, descripcion: descripcion, fecha: fecha, favoritos: (favoritos != nil), calificacion: calificacion as! Double)
                        self.datos.append(registros)
                    }
                }
            }
        }
    }
    
}
