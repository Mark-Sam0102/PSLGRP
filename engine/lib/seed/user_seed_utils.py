import json
import random
import string

class SeedHelper:
  seed_users = []

  def __init__(self):
      self.seed_users = []

  def create_user_seed_json (self, filename):
    try:
      print('--- saving json data into: ' + filename)
      with open(filename, "w") as f:
        json.dump(self.seed_users, f, indent=2)
    except FileNotFoundError:
      print('*** file not found: ', filename)
    except Exception as e:
      print('*** error: ', e)

  def add_user (self, name, user):
    print('--- adding user object under category: ' + name)
    found = False

    for x in self.seed_users:
      if x["name"] == name:
        found = True
        x["users"].append(user)

    if found == False:
      print('--- creating a new category: ' + name)
      user_arr = []
      user_arr.append(user)

      new_cat = {
        "name": name,
        "users": user_arr
      }

      self.seed_users.append(new_cat)

  @staticmethod
  def generate_random (letter_count, digit_count): 
    if letter_count < 2:
      letter_count = 2

    start = "".join((random.choice(string.ascii_letters) for x in range(2)))
    str = "".join(
        (random.choice(string.ascii_letters) for x in range(letter_count - 2))
    )
    str += "".join((random.choice(string.digits) for x in range(digit_count)))

    sam_list = list(str)  # it converts the string to list.
    random.shuffle(sam_list)

    final_string = start + "".join(sam_list)
    return final_string
