const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const { validateCode } = require('./codeValidator'); // Assume this is a module that validates JS code

app.use(bodyParser.json());

app.post('/validate', (req, res) => {
    const { code } = req.body;

    try {
        validateCode(code);
        res.status(200).json({ message: 'Valid code', status: 'green' });
    } catch (error) {
        res.status(400).json({ message: 'Invalid code', status: 'red', error: error.message });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
