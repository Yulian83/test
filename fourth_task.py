class Animal:
    def __init__(self, name, command, birth_date):
        self._name = name
        self._command = command
        self._birth_date = birth_date

    def get_name(self):
        return self._name

    def get_command(self):
        return self._command

    def set_command(self, new_command):
        self._command = new_command

class DomesticAnimal(Animal):
    pass

class Dog(DomesticAnimal):
    pass

class Cat(DomesticAnimal):
    pass

class Hamster(DomesticAnimal):
    pass

class PackAnimal(Animal):
    pass

class Horse(PackAnimal):
    pass

class Camel(PackAnimal):
    pass

class Donkey(PackAnimal):
    pass


class AnimalRegistry:
    def __init__(self):
        self.animals = []

    def add_animal(self, animal):
        if isinstance(animal, Animal):
            self.animals.append(animal)
            print(f"{animal.get_name()} добавлен в реестр.")
        else:
            print("Невозможно добавить животное, оно не является экземпляром класса Animal.")

    def list_commands(self, animal_name):
        for animal in self.animals:
            if animal.get_name() == animal_name:
                print(f"Список команд для {animal_name}: {animal.get_command()}")
                return
        print(f"Животное {animal_name} не найдено в реестре.")

    def teach_command(self, animal_name, new_command):
        for animal in self.animals:
            if animal.get_name() == animal_name:
                animal.set_command(new_command)
                print(f"Животное {animal_name} обучено новой команде: {new_command}")
                return
        print(f"Животное {animal_name} не найдено в реестре.")

class Counter:
    def __init__(self):
        self._value = 0

    def add(self):
        self._value += 1

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if self._value > 0:
            raise ValueError("Работа с объектом счетчика не была завершена в блоке try-with-resources.")



def main():
    registry = AnimalRegistry()
    counter = Counter()
    while True:
        print("\nМеню:")
        print("1. Завести новое животное")
        print("2. Посмотреть список команд животного")
        print("3. Обучить животное новой команде")
        print("4. Выход")

        choice = input("Выберите действие: ")

        if choice == "1":
            name = input("Введите имя животного: ")
            command = input("Введите список команд через запятую: ")
            birth_date = input("Введите дату рождения (ГГГГ-ММ-ДД): ")
            new_animal = Animal(name, command.split(','), birth_date)
            registry.add_animal(new_animal)

            counter.add()
        
        elif choice == "2":
            name = input("Введите имя животного: ")
            registry.list_commands(name)
        
        elif choice == "3":
            name = input("Введите имя животного: ")
            new_command = input("Введите новую команду: ")
            registry.teach_command(name, new_command)
        
        elif choice == "4":
            break
        
        else:
            print("Неверный ввод. Попробуйте еще раз.")

if __name__ == "__main__":
    main()
