const express = require('express');
const mysqlConnection = require('../utils/database.js');
const router = express.Router();



router.get('/', (req, res) => {
    const productId = req.params.productId;
    const sql = `
        SELECT image1_url, image2_url, image3_url, image4_url, image5_url
        FROM product_images
        WHERE product_id = ?
    `;
    mysqlConnection.query(sql, [productId], (err, result) => {
        if (err) {
            res.status(500).send('Error fetching product images');
        } else {
            if (result.length > 0) {
                // Combine image URLs into an array
                const imageUrls = [];
                for (let i = 0; i < result.length; i++) {
                    if (result[i].image1_url) imageUrls.push(result[i].image1_url);
                    if (result[i].image2_url) imageUrls.push(result[i].image2_url);
                    if (result[i].image3_url) imageUrls.push(result[i].image3_url);
                    if (result[i].image4_url) imageUrls.push(result[i].image4_url);
                    if (result[i].image5_url) imageUrls.push(result[i].image5_url);
                }
                res.json(imageUrls);
            } else {
                res.status(404).send('Product images not found');
            }
        }
    });
});

module.exports = router;