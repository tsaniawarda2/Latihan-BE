// const data = "Testing"
// console.log(data)

const express = require("express");
const db = require("./connection");
// import express from "express"
const app = express();
const port = 5000;

const bodyParser = require("body-parser");
app.use(bodyParser.json());

app.post("/add-produk", (req, res) => {
  // const id_produk = req.body.id_produk
  // const produk = req.body.produk
  const { id_produk, produk, kategori, harga_per_kg } = req.body;
  const sql = `INSERT INTO produk (id_produk, produk, kategori,harga_per_kg) VALUES (
  ${id_produk}, "${produk}", "${kategori}", ${harga_per_kg}
  )`;

  db.query(sql, (error, result) => {
    if (error) throw error;
    // console.log(result);
  });

  return res.status(200).send("OK");
});

app.put("/update", (req, res) => {
  // const idProduk = req.params.id;
  const { id_produk,produk, kategori, harga_per_kg } = req.body;
  const sql = `UPDATE produk SET produk = "${produk}", kategori="${kategori}", harga_per_kg=${harga_per_kg} 
  WHERE id_produk = ${id_produk}`;
// UPDATE (nama_table)
// SET (nama_kolom)
  db.query(sql, (error, result) => {
    if (error) throw error;
    // console.log(result);
  });



  return res.status(200).send("OK");
});

app.delete('/delete/:id',(req,res)=>{
  const idProduk = req.params.id
  const sql = `DELETE FROM produk WHERE id_produk = ${idProduk}`

    db.query(sql, (error, result) => {
    if (error) throw error;
    // console.log(result);
  });

  return res.status(200).send("OK");
})

app.get("/find/:id", (req, res) => {
  const data = req.params.id;
  const sql = `SELECT * FROM produk WHERE id_produk = ${data} `;
  db.query(sql, (error, result) => {
    res.json(result);
  });
});

app.get("/", (req, res) => {
  res.status(200).send("Selamat datang!");
});

app.get("/user", (req, res) => {
  res.json({
    nama: "Tsania",
    pekerjaan: "Backend Developer",
  });
});

app.get("/hello", (req, res) => {
  res.send("Hello World!");
});

app.post("/add", (req, res) => {
  // console.log("masuk");

  const { id_produk, produk, kategori, harga_per_kg } = req.body;
  console.log(kategori);

  db.query(
    `INSERT INTO produk (id_produk, produk, kategori, harga_per_kg) VALUES (${id_produk}, '${produk}', '${kategori}', ${harga_per_kg})`
  );

  res.send("OK");
});

app.listen(port, () => {
  // console.log("App listening on port 5000");
  console.log(`App listening on port ${port}`);
});
