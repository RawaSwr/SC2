const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

let notes = [];
let id = 0;

// Get all notes
app.get('/notes', (req, res) => {
  res.json(notes);
});

// Add a new note
app.post('/notes', (req, res) => {
  const note = { id: id++, ...req.body };
  notes.push(note);
  res.status(201).json(note);
});

// Get a note by ID
app.get('/notes/:id', (req, res) => {
  const note = notes.find(n => n.id == req.params.id);
  if (note) {
    res.json(note);
  } else {
    res.status(404).json({ message: 'Note not found' });
  }
});

// Delete a note by ID
app.delete('/notes/:id', (req, res) => {
  notes = notes.filter(n => n.id != req.params.id);
  res.status(204).end();
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
