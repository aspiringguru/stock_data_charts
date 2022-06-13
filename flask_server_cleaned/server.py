from flask import Flask, render_template, jsonify, request, redirect
from flask import send_file, send_from_directory, abort
app = Flask(__name__)

import pandas as pd
import sqlite3
from sqlite3 import Error



@app.route('/sql_stock_bubble_data')
def sql1():
    #print("route sql1 start.")
    db_filename="yf_data_backup3.db"
    conn = sqlite3.connect(db_filename)
    #print("connected to database.")
    cur = conn.cursor()
    sql = """select stockCode, longName, marketCap, dividendYield, currentPrice, trailingPE
    from yf_stock_data_view
    where marketCap !="None" AND marketCap !="None"
      AND dividendYield is NOT NULL
      AND dividendYield !="None"
      AND dividendYield <1.0
    order by marketCapInt desc;"""
    #print("executing sql")
    cur.execute(sql)
    rows = cur.fetchall()
    results = []
    for row in rows:
        #print(row)
        result = {
            "stock_code":row[0],
            "longName":row[1],
            "marketCap":row[2],
            "dividendYield":row[3],
            "currentPrice":row[4],
            "trailingPE":row[5],
        }
        results.append(result)
    #print("results:", results)
    return jsonify(results)

#localhost:5000/get_json/prog_languages.json
@app.route("/get_html/<filename>")
def get_html(filename):
    #print("route get_html:", filename)
    return render_template(filename)

#localhost:5000/get_json/prog_languages.json
@app.route("/get_json/<filename>")
def get_json(filename):
    #print("get_json : app.root_path:", app.root_path)
    json_dir = app.root_path+"\\static\\json\\"
    #print("json_dir:", json_dir)
    try:
        return send_from_directory(directory=json_dir, path=filename, as_attachment=False)
        #returns file as downloadable if as_attachment=True.
    except FileNotFoundError:
        abort(404)

@app.route('/')
def home():
    #print("route home")
    #return "this is home"
    return redirect(f"/get_html/asx_bubble.html")


if __name__ == '__main__':
    #print("start flask server main method.")
    #app.run(host='0.0.0.0', debug = True, port=5050)
    app.run(host='0.0.0.0', debug = False, port=5800)#aws server port 5800 = demo1.peerbanking.com.au
