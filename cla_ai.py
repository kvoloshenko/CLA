# Работа с массивами данных
import numpy as np
from tensorflow.keras.models import model_from_json
# Функции-утилиты для работы с категориальными данными
from tensorflow.keras import utils
# Масштабирование данных
from sklearn.preprocessing import StandardScaler
import joblib

# Для нормализации данных используется готовый инструмент
y_scaler = StandardScaler()
y_scaler = joblib.load('std_scaler.bin')

MAX_NUMBER_LINES = 300

# Классы CUSTOMER_TYPE
CUSTOMER_TYPE_class = [0,
                    {'Business Customer Account	'  : 0,
                     'Residential Customer Account': 1
                    }]
# Классы CUSTOMER_SUB_SEGMENT
CUSTOMER_SUB_SEGMENT_class = [0,
              {'Fixed & Mobile Expat' : 0,
               'Mobile Expat'         : 1,
               'Fixed Expat'          : 2,
               'Fixed & Mobile UAE'   : 3,
               'Mobile UAE'           : 4,
               'Fixed UAE'            : 5
                             }]

# Вычисление счетчиков для данных разбиения
for class_desc in [CUSTOMER_TYPE_class,
                   CUSTOMER_SUB_SEGMENT_class]:
    if isinstance(class_desc[1], list):
        class_desc[0] = len(class_desc[1]) + 1
    else:
        class_desc[0] = max(class_desc[1].values()) + 1

def str_to_multi(arg, class_dict):
    # Определение размерности выходного вектора
    num_classes = class_dict[0]

    # Создание нулевого вектора
    result = np.zeros(num_classes)

    # Поиск значения в словаре и, если найдено,
    # выставление 1. на нужной позиции
    for value, cls in class_dict[1].items():
        # print(f'value={value} cls={cls}')
        if value == arg:
            result[cls] = 1.

    return result

def extract_CUSTOMER_SUB_SEGMENT_to_multi(arg):
  return str_to_multi(arg, CUSTOMER_SUB_SEGMENT_class)

def extract_CUSTOMER_TYPE_to_multi(arg):
  return str_to_multi(arg, CUSTOMER_TYPE_class)

def extract_NUMBER_LINES_Category(arg, MAX_NUMBER_LINES):
  NUMBER_LINES = utils.to_categorical(arg, MAX_NUMBER_LINES+1) #Превращаем в категорию
  return NUMBER_LINES
class ClaAi:
    def __init__(self):
        # Открываем json файл разметки модели
        json_file = open('model.json', 'r')
        loaded_model_json = json_file.read()  # считываем
        json_file.close()  # закрываем
        self.loaded_model = model_from_json(loaded_model_json)  # используем керас, чтобы считать разметку архитектуры
        self.loaded_model.summary()
        self.loaded_model.load_weights("model.h5")  # подгружаем веса
        print("Загружено с диска")

    def data_preparation(self, NUMBER_LINES, CUSTOMER_TYPE, CUSTOMER_SUB_SEGMENT):
        NUMBER_LINES_vec = extract_NUMBER_LINES_Category(NUMBER_LINES, MAX_NUMBER_LINES)
        CUSTOMER_TYPE_ohe = extract_CUSTOMER_TYPE_to_multi(CUSTOMER_TYPE)
        CUSTOMER_SUB_SEGMENT_ohe = extract_CUSTOMER_SUB_SEGMENT_to_multi(CUSTOMER_SUB_SEGMENT)
        x_data = np.hstack([NUMBER_LINES_vec,
                            CUSTOMER_TYPE_ohe,
                            CUSTOMER_SUB_SEGMENT_ohe])
        # print(type(x_data))
        # print(x_data.shape)
        x_data = x_data.reshape(1, x_data.shape[0])
        # print(type(x_data))
        # print(x_data.shape)
        return x_data

    def predict(self, number_lines, customer_type, customer_sub_segment):
        x_data = self.data_preparation(number_lines, customer_type, customer_sub_segment)
        print (f'x_data = {x_data}')
        pred = self.loaded_model.predict(x_data)  # Предсказание на тренировочной выборке
        pred = y_scaler.inverse_transform(pred)
        print(type(pred))
        print(pred.shape)
        print(pred)
        print(pred[0][0])
        cla = int(pred[0][0])
        cl = {'cl': cla,
              'number_lines': number_lines,
              'customer_type': customer_type,
              'customer_sub_segment': customer_sub_segment}
        return cl