const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/user');

router.post('/register', async (req, res) => {
    const { Email, Password } = req.body;

    try {
        const existingUser = await User.findOne({ where: { Email } });
        if (existingUser) {
            return res.status(401).json({ error: 'User already exists' });
        }

        const salt = bcrypt.genSaltSync(10);
        const hashedPassword = bcrypt.hashSync(Password, salt);

        await User.create({ Email, Password: hashedPassword });//C'est l'aquivalent de insert into

        return res.status(200).json({ message: 'User registered successfull ' });
    } catch (error) {
        return res.status(400).json({ error: 'Registration failed'});
    }
});

router.post('/registerGoogle', async (req, res) => {
    const { Email } = req.body;

    try {
        const existingUser = await User.findOne({ where: { Email } });
        if (existingUser) {
            return res.status(401).json({ message: 'User already exists' });
        }

        const salt = bcrypt.genSaltSync(10);
        const hashedPassword = bcrypt.hashSync('generated_random_password', salt);

        await User.create({ Email, Password: hashedPassword });

        return res.status(200).json({ message: 'User registered successfully' });
    } catch (error) {
        return res.status(400).json({ error: 'Registration failed' });
    }
});



router.post('/login', async (req, res) => {
    const { Email, Password } = req.body;

    try {
        const user = await User.findOne({ where : {Email} });

        if (!user) {
            return res.status(400).json('Email invalid!');
        }

        const validPass = bcrypt.compareSync(Password, user.Password);

        if (!validPass) {
            return res.status(401).json('Password invalid!');
        }

        const payload = {
            _id: user._id,
            Email: user.Email,
        };

        const token = jwt.sign(payload, user.Password);

        res.status(200).json({
            message: 'User logged in successfully',
            mytoken: token,
        });
    } catch (error) {
        res.status(500).json(error.message);
    }
});


router.get('/getall', async (req, res) => {
    try {
        const users = await User.findAll();
        res.status(200).json(users);
        console.log("Data collected successfully");
    } catch (error) {
        console.error('Error fetching users:', error); 
        res.status(400).send({ error: error.message });
    }
});


router.get('/byemail/:Email', async (req, res) => {
    const Email = req.params.Email;
    try {
        const user = await User.findOne({where : {Email}});
        if(!user){
            res.status(401).send("L'utilisateur n'existe pas!")
        }

        res.status(200).json(user);
        console.log("Data collected successfully!");
    } catch (error) {
        res.status(400).send(error.message); 
    }
});

router.delete('/deleteAll', async (req, res) => {
    try {
      await User.destroy({ where: {} }); // Supprime tous les enregistrements dans la table des utilisateurs
      res.status(200).json({ message: 'All users deleted successfully' });
      console.log("All users deleted successfully");
    } catch (error) {
      console.error('Error deleting users:', error);
      res.status(400).send({ error: error.message });
    }
  });

router.delete('/delete/:Email', async (req, res) => {
    const userEmail = req.params.Email;
  
    try {
      const deletedUser = await User.destroy({
        where: { Email : userEmail },
      });
  
      if (deletedUser) {
        res.status(200).json({ message: 'User deleted successfully' });
        console.log("User deleted successfully");
      } else {
        res.status(404).json({ message: 'User not found' });
      }
    } catch (error) {
      console.error('Error deleting user:', error);
      res.status(400).send({ error: error.message });
    }
  });

module.exports = router;