require "application_system_test_case"

class Ciu8DisplaysTest < ApplicationSystemTestCase
  test "Creating a new display" do
    # Когда мы посещаем страницу Ciu8Displays#index
    # мы ожидаем увидеть заголовок с текстом "Дисплеи CIU8"
    visit ciu8_displays_path
    assert_selector "h1", text: "Дисплеи CIU8"


    # Когда мы нажимаем на ссылку с текстом "Добавить дисплей"
    # мы ожидаем попасть на страницу с заголовком "Добавить новый дисплей"
    click_on "Добавить дисплей"
    assert_selector "h1", text: "Добавить новый дисплей"


    # Когда мы заполняем поля формы и нажимаем на "Добавить дисплей"
    fill_in "ТП", with: "ТП-1"
    fill_in "Улица", with: "ул. Партизанская"
    fill_in "Номер дома", with: "15"
    fill_in "Модель ПУ", with: "AD11S.1-FL-Z-R-TX(1-1-2)"
    fill_in "S/N ПУ", with: "05562105"
    fill_in "S/N CIU8", with: "05840463"
    click_on "Добавить дисплей"


    # Мы рассчитываем вернуться на страницу с заголовком "Дисплеи CIU8"
    # и увидеть наш "Дисплей CIU8" добавленный в список
    assert_selector "h1", text: "Дисплеи CIU8"
    assert_selector "p", text: "ТП-1"
    assert_selector "p", text: "ул. Партизанская"
    assert_selector "p", text: "15"
    assert_selector "p", text: "AD11S.1-FL-Z-R-TX(1-1-2)"
    assert_selector "p", text: "05562105"
    assert_selector "p", text: "05840463"
  end
end
