extends Node

var config = {
"apiKey": "",
"authDomain": "",
"databaseURL": "",
"projectId": "",
"storageBucket": "",
"messagingSenderId": "" }

var auth = null

const OrderBy = "orderBy"
const LimitToFirst = "limitToFirst"
const LimitToLast = "limitToLast"
const StartAt = "startAt"
const EndAt = "endAt"
const EqualTo = "equalTo"

var references = {}

func _on_FirebaseAuth_login_succeeded(auth_result):
    auth = auth_result

func get_database_reference(path : String, filter : Dictionary):        
    var firebase_reference = Node.new()
    firebase_reference.set_script(load("res://addons/GDFirebase/FirebaseReference.gd"))
    var pusher = HTTPRequest.new()
    var listener = HTTPRequest.new()
    var store = Node.new()
    firebase_reference.set_auth_and_config(auth, config)
    firebase_reference.set_pusher(pusher)
    firebase_reference.set_listener(listener)
    firebase_reference.set_store(store)
    firebase_reference.set_db_path(path, filter)
    add_child(firebase_reference)
    references.append(firebase_reference)
    return firebase_reference