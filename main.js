const express = require('express');
const app = express();
const cors = require('cors')

const PORT = process.env.PORT || 8000;

app.get('/', (req, res) => {
  return res.json({ message: "Hey, I am a Node.js container v5" });
});

app.listen(PORT, () => console.log(`Server started on PORT ${PORT}. Have a nice day!`));
