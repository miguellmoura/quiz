//
//  SettingsViewController.swift
//  Quiz
//
//  Created by Miguel Moura on 09/10/22.
//  Copyright © 2022 HSBC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var quiz = Quiz()
    
    
    @IBOutlet weak var numberQuestions: UILabel!
    
    @IBAction func editNumberQuestion(_ sender: UIButton) {
        // Criar Alert Controller
        let editQuestionsShowed = UIAlertController(title: "Questões a serem mostradas: ", message: "Mudar número de questões que aparecerão", preferredStyle: .alert)
        
        // Criar uma caixa de texto
        var texto = UITextField()
        
        // Adicionar a caixa de texto no alerta
        editQuestionsShowed.addTextField { txt in
            txt.placeholder = "Número de questões"
            texto = txt
        }
        
        // Criar uma ação (botão + função)
        let acao = UIAlertAction(title: "Salvar", style: .default) { botao in
            
            if Int(texto.text!)! > self.quiz.questions.count {
                
                let muitaQuestao = UIAlertController(title: "Erro", message: "Não foi possível alterar o número de questões", preferredStyle: .alert)
                
                let save = UIAlertAction(title: "Ok", style: .default) { botao in
                }
                
                muitaQuestao.addAction(save)
                
                self.present(muitaQuestao, animated: true)
                
            } else {
                self.quiz.numberQuestionsShowed = texto.text!
                self.defaults.set(self.quiz.numberQuestionsShowed, forKey: "config")
                self.numberQuestions.text = self.quiz.numberQuestionsShowed
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        // Adicionar a ação no alerta
        editQuestionsShowed.addAction(acao)
        
        
        
        // Mostrar o alerta
        present(editQuestionsShowed, animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String)

        if let number = defaults.string(forKey: "config") {
            quiz.numberQuestionsShowed = number
            self.numberQuestions.text = number
        } else {
            quiz.numberQuestionsShowed = "0"
        }

        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
