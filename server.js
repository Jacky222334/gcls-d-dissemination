import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = process.env.PORT ? Number(process.env.PORT) : 3000;

// Serve the static website folder
const websiteDir = path.join(__dirname, "website");
app.use(express.static(websiteDir, { extensions: ["html"] }));

// Health check
app.get("/health", (_req, res) => {
  res.status(200).json({ ok: true });
});

app.listen(port, "0.0.0.0", () => {
  // eslint-disable-next-line no-console
  console.log(`GCLS-D site listening on port ${port}`);
});

