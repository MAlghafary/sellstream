const mysqlConnection = require("../utils/database");

class Order {
  constructor(
    id,
    user_id,
    first_name,
    last_name,
    street_address,
    city,
    email,
    phone_number,
    notes,
    status,
    total_amount,
    order_date_time,
    items
  ) {
    this.id = id;
    this.user_id = user_id;
    this.first_name = first_name;
    this.last_name = last_name;
    this.street_address = street_address;
    this.city = city;
    this.email = email;
    this.phone_number = phone_number;
    this.notes = notes;
    this.status = status;
    this.total_amount = total_amount;
    this.order_date_time = order_date_time;
    this.items = items || [];
  }

  static fromData(data) {
    return new Order(
      data.id || null,
      data.user_id,
      data.first_name,
      data.last_name,
      data.street_address,
      data.city,
      data.email,
      data.phone_number,
      data.notes || "",
      data.status,
      data.total_amount,
      data.order_date_time || new Date(),
      data.items || []
    );
  }

  save(callback) {
    const query = `
      INSERT INTO \`order\` (
        user_id,
        first_name,
        last_name,
        street_address,
        city,
        email,
        phone_number,
        notes,
        status,
        total_amount,
        order_date_time
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;
    const values = [
      this.user_id,
      this.first_name,
      this.last_name,
      this.street_address,
      this.city,
      this.email,
      this.phone_number,
      this.notes,
      this.status,
      this.total_amount,
      this.order_date_time
    ];

    mysqlConnection.query(query, values, (err, result) => {
      if (err) {
        console.error("Error saving order:", err);
        callback(err, null);
        return;
      }

      const orderId = result.insertId;
      this.id = orderId;

      // Insert order items into the orderitem table
      const itemQueries = this.items.map(item => {
        return new Promise((resolve, reject) => {
          const itemQuery = `
            INSERT INTO orderitem (
              order_id,
              product_id,
              quantity,
              unit_price,
              total_price
            ) VALUES (?, ?, ?, ?, ?)
          `;
          const itemValues = [
            orderId,
            item.product_id,
            item.quantity,
            item.unit_price,
            item.total_price
          ];

          mysqlConnection.query(itemQuery, itemValues, (itemErr, itemResult) => {
            if (itemErr) {
              reject(itemErr);
            } else {
              resolve(itemResult);
            }
          });
        });
      });

      Promise.all(itemQueries)
        .then(() => callback(null, this))
        .catch((itemErr) => {
          console.error("Error saving order items:", itemErr);
          callback(itemErr, null);
        });
    });
  }
}

module.exports = Order;
