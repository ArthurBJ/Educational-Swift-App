//dummy database
// const onboarding1 = {id: 1, 
//     title: 'Post title 1', 
//     body: 'Here is my body'}


// const Onboarding = require("../models/Onboarding")

// const onboarding2 = {id: 2, 
//     title: 'TITLE 2', 
//     body: 'BODY BODY BODY'}

// const onboarding3 = {id: 3, 
//     title: 'TITLE 3', 
//     body: 'BODY 3'} 
// const allOnboardings = [onboarding1, onboarding2, onboarding3]

module.exports = {
    onboarding: async function(req, res) {
        try {
            const onboarding = await Onboarding.find()
            res.send(onboarding)
        } catch {
            res.serverError(err.toString())
        }
        // Onboarding.find().exec(function(err, onboarding) {
        //     if (err) {
        //         return res.serverError(err.toString())
        //     }
        //     res.send(onboarding)
        // })

        // res.send(allOnboardings)
     },

     create: async function(req, res) {
        const title = req.body.question
        const postBody = req.body.answers

        sails.log.debug('My title: '+ title)
        sails.log.debug('My body: '+ postBody)
        // Onboarding.create({question: title, answers: postBody}).exex(function(err) {
        //     if (err) {
        //         return res.serverError(err.toString())
        //     }
        //     console.log("Finished created onboarding object")
        //     return res.end()
        // })

        // const newPost = {id: 4, 
        //     title: title,
        //     body: postBody}
        // allOnboardings.push(newPost)

        await Onboarding.create({question: title, answers: postBody})
        res.end()
     },

     findOnboardingById: function(req, res) {
        const onboardingId = req.param('onboardingId')

        const filteredOnboardings = allOnboardings.filter(p => {return p.id == onboardingId})

        if(filteredOnboardings.length > 0) {
            res.send(filteredOnboardings[0])
        } else {
            res.send('Failed to find onboarding by Id: ' + onboardingId)
        }
     }
}