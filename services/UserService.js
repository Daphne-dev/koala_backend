const prisma = require('../prisma')
const makeDataForCreate = require('../utils/makeDataForCreate')

const createUser = (fields) => {
    const data = makeDataForCreate(fields)
    return prisma.users.create({data})
}

module.exports = {
    createUser
}