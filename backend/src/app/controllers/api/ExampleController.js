
class ExampleController{
    // functions

    index(req, res){
        const exJson = {
            'status_code' : 200,
            'message' : "hello",
            'user' : {
                'name' : 'phuoc',
                'age' : 21
            }
        }
        res.send(exJson);
    }
}

module.exports = new ExampleController;