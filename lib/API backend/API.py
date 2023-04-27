
import firebase_admin
from firebase_admin import credentials

cred = credentials.Certificate("lib/API backend/fulbrightforum-8d6f9-firebase-adminsdk-b3pm8-ceb5c03347.json")
firebase_admin.initialize_app(cred)


