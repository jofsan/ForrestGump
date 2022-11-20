var quizModel = require('../models/quizModel.js');

function quiz(req, res) { 
    var score = req.body.score;
    var idUsuario = req.body.idUsuario;
    var qtdCorreta= req.body.qtdCorreta;

    quizModel.quiz(idUsuario, qtdCorreta, score)
    .then(
        function(resultado) {      
            res.json(resultado);
            
    }
    ).catch(function(erro) {
        console.log(erro);
        console.log("Houve um erro ao realizar o cadastro! Erro: ", erro.sqlMessage);

        res.status(500).json(erro.sqlMessage);
    });

}

module.exports = {
    quiz
}