import os
from dotenv import load_dotenv

load_dotenv()
url_path = f"postgresql://postgres:{os.environ.get('password')}@localhost:5432/Employee_DB"