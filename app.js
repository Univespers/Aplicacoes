import mysql from 'mysql2/promise'; 

async function conectarBanco() {
    try {
        const connection = await mysql.createConnection({
            host: 'localhost',
            port: 3306,
            user: 'root',
            password: '123456',
            database: 'sistema_academico'
        });

        console.log("✅ Banco conectado na porta 3306!");

        try {
            const [results] = await connection.execute('SELECT * FROM Aluno');
            console.log('Resultados:', results);
        } catch (queryError) {
            console.error('❌ Erro na consulta:', queryError);
        } finally {
            await connection.end();
            console.log("🔌 Conexão encerrada.");
        }

    } catch (connectionError) {
        console.error("❌ Erro de conexão:", connectionError);
    }
}

conectarBanco();
