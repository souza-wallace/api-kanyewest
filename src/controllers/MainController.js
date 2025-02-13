export class MainController {
    constructor(utils, env) {
        this.utils = utils;
        this.api = env.parsed.API;
    }

    get = async (req, res) => {
        const message = await this.utils.chamaApi(this.api, 'GET');

        console.log(message)

        res.status(200).json({
            host: req.get('host'),
            message: message.quote
        });    
    };
}
