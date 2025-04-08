const PDFDocument = require("pdfkit");

const UserModel = require("../models/UserModel");

const exportUserPDF = async (req, res) => {
    try {
        const users = await UserModel.getUsuarios();

        if (!users || users.length === 0) {
            return res.status(404).json({ message: "Nenhum usuário encontrado" });
        }

        res.setHeader("Content-Type", "application/pdf");
        res.setHeader("Content-Disposition", "inline; filename=users.pdf");

        const doc = new PDFDocument();
        doc.pipe(res);

        // Título
        doc.fontSize(20).text("Relatório de Usuários", { align: "center" });
        doc.moveDown();

        // Cabeçalho
        doc.fontSize(12).text("Id | Nome | Email | Password", { underline: true });
        doc.moveDown(0.5);

        // Dados dos usuários
        users.forEach((user) => {
            doc.text(
                `${user.id} | ${user.name} | ${user.email} | ${user.password}`
            );
        });

        doc.end();
    } catch (error) {
        console.error("Erro ao gerar o PDF:", error);
        res.status(500).json({ message: "Erro ao gerar o PDF" });
    }
};

module.exports = { exportUserPDF };