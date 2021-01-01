const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const {UserService} = require('../services')

const signup = async (req, res, next) => {
    try{
        const {email, password, nickname} = req.body
        
        const hashPassword = await bcrypt.hash(password, 12)
        
        const createUser = await UserService.createUser({
            email,
            password: hashPassword,
            nickname
        })

        res.status(200).json({
            message: 'success'
        })
    }
    catch(err){
        next(err)
    }
}

module.exports = {
    signup
}