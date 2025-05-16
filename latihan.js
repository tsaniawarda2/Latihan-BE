const express = require("express");
const app = express();
const port = 5000;

app.get("/ucapan", (req, res) => {
  res.send("Selamat siang dari server!");
});

app.get("/data-diri", (req, res) => {
  res.json({
    nama: "Tsania",
    pekerjaan: "Backend Developer",
  });
});

app.get("/salam", (req, res) => {
  const nama = req.query.nama;

  if (!nama) {
    res.send("Siapa nama kamu?");
  } else {
    res.send(`Hai, ${nama}!`);
  }
});

app.listen(port, () => {
  console.log("App listening on port 5000");
});
