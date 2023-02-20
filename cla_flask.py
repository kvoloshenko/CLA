from flask import Flask, request, abort, jsonify
from flask_restful import Resource, Api
from marshmallow import Schema, fields
from cla_ai import ClaAi

# https://colab.research.google.com/drive/1gI6Q9WkhGo1uylw0rPKzhsy_xSDBToaV?usp=sharing
# http://127.0.0.1:5000/cla/api/v1.0/predict?number_lines=10&customer_type=Residential%20Customer%20Account&customer_sub_segment=Fixed%20UAEhttp://127.0.0.1:5000/cla/api/v1.0/predict?number_lines=10&customer_type=Residential%20Customer%20Account&customer_sub_segment=Fixed%20UAE
# http://127.0.0.1:5000/cla/api/v1.0/predict?number_lines=100&customer_type=Business%20Customer%20Account&customer_sub_segment=Fixed%20UAE


cla_ai = ClaAi()

class ClaQuerySchema(Schema):
    number_lines = fields.Int(required=True)
    customer_type = fields.Str(required=True)
    customer_sub_segment = fields.Str(required=True)

app = Flask(__name__)
api = Api(app)
schema = ClaQuerySchema()


class ClaAPI(Resource):

    def get(self):
        errors = schema.validate(request.args)
        if errors:
            abort(400, str(errors))

        args = request.args
        print(args)  # For debugging
        number_lines = args['number_lines']
        customer_type = args['customer_type']
        customer_sub_segment = args['customer_sub_segment']
        cl = cla_ai.predict(number_lines, customer_type, customer_sub_segment)

        return jsonify(cl)


api.add_resource(ClaAPI, '/cla/api/v1.0/predict', endpoint='cla_predict')


if __name__ == '__main__':
    app.run(debug=True)