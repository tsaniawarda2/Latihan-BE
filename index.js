const express = require("express");
// import express from 'express'
const app = express();
const port = 5000;

const db = require("./connection");

app.get("/", (req, res) => {
  db.query("SELECT * FROM produk", (error, result) => {
    // hasil dari mysql
    console.log(result);
    res.status(200).send(result);
  });
});

app.get("/find", (req, res) => {
  const sql = `SELECT * FROM produk WHERE kategori = "${req.query.kategori}"`;

  db.query(sql, (error, result) => {
    res.json(result);
  });

  console.log(req.query.kategori);
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
