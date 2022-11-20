var database = require("../database/config")

function quiz(id, qtdCorreta, score) {
    console.log("NO MODEL")
    var instrucao = `insert into quiz (qtdCorreta, score, fk_usuario) values (${qtdCorreta}, ${score}, ${id})`;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
    
    console.log("NO MODEL")
    var instrucao = `select*from usuario 
    join quiz on 
    fk_usuario=usuario.id 
    join votodificuldade 
    on votodificuldade.fk_usuario=usuario.id;`
    
}

module.exports = {
    quiz
}