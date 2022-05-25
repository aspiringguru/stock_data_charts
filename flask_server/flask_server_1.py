from flask import Flask, render_template, jsonify
from flask import send_file, send_from_directory, abort
appFlask = Flask(__name__)

import pandas as pd
import sqlite3
from sqlite3 import Error


@appFlask.route('/chart_bubble')
def chart_bubble():
    print("route /chart_bubble start")
    return render_template('bubble_1.html')


@appFlask.route('/chart_bubble_json')
def chart_bubble_json():
    print("route /chart_bubble start")
    return render_template('bubble_1_load_json.html')


@appFlask.route('/home/<int:score>')
def homeTemplate(score):
    dict = {'Physics':97,'Computers':98,'Mathematics':99}
    return render_template('flaskTemplate_1.html',name = "AmKy", marks = score, result = dict)

@appFlask.route('/test1/<int:score>')
def test1(score):
    print("score:", score)
    return "this is route test1, score="+str(score)

@appFlask.route('/sql_stock_bubble_data')
def sql1():
    print("route sql1 start.")
    db_filename="yf_data_backup3.db"
    conn = sqlite3.connect(db_filename)
    print("connected to database.")
    cur = conn.cursor()
    sql = """select stockCode, longName, marketCap, dividendYield, currentPrice
    from yf_stock_data_view
    where marketCap !="None" AND marketCap !="None"
      AND dividendYield is NOT NULL
      AND dividendYield !="None"
      AND dividendYield <1.0
    order by marketCapInt desc;"""
    print("executing sql")
    cur.execute(sql)
    rows = cur.fetchall()
    results = []
    for row in rows:
        print(row)
        result = {
            "stock_code":row[0],
            "longName":row[1],
            "marketCap":row[2],
            "dividendYield":row[3],
            "currentPrice":row[4],
        }
        results.append(result)
    print("results:", results)
    return jsonify(results)

#localhost:5000/get_json/prog_languages.json
@appFlask.route("/get_html/<filename>")
def get_html(filename):
    print("route get_html:", filename)
    return render_template(filename)

#localhost:5000/get_json/prog_languages.json
@appFlask.route("/get_json/<filename>")
def get_json(filename):
    print("get_json : app.root_path:", appFlask.root_path)
    json_dir = appFlask.root_path+"\\static\\json\\"
    print("json_dir:", json_dir)
    try:
        return send_from_directory(directory=json_dir, path=filename, as_attachment=False)
        #returns file as downloadable if as_attachment=True.
    except FileNotFoundError:
        abort(404)

@appFlask.route('/')
def home():
    print("route home")
    return "this is home"


if __name__ == '__main__':
    print("start flask server main method.")
    appFlask.run(host='0.0.0.0', debug = True)
