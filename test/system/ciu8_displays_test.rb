require "application_system_test_case"

class Ciu8DisplaysTest < ApplicationSystemTestCase
  setup do
    @ciu8_display = Ciu8Display.ordered.first
  end

  test "Creating a new display" do
    visit ciu8_displays_path
    assert_selector "h1", text: "Дисплеи CIU8"

    click_on "Добавить новый дисплей"

    fill_in "ТП", with: "ТП-1"
    fill_in "Улица", with: "ул. Партизанская"
    fill_in "Номер дома", with: "15"
    fill_in "Модель ПУ", with: "AD11S.1-FL-Z-R-TX(1-1-2)"
    fill_in "S/N ПУ", with: "05562105"
    fill_in "S/N CIU8", with: "05840463"

    click_on "Добавить дисплей"

    assert_selector "h1", text: "Дисплеи CIU8"
    assert_selector "p", text: "ТП-1"
    assert_selector "p", text: "ул. Партизанская"
    assert_selector "p", text: "15"
    assert_selector "p", text: "AD11S.1-FL-Z-R-TX(1-1-2)"
    assert_selector "p", text: "05562105"
    assert_selector "p", text: "05840463"
  end

  test "Updating a display" do
    visit ciu8_displays_path
    assert_selector "h1", text: "Дисплеи CIU8"

    click_on "Редактировать", match: :first

    fill_in "ТП", with: "ТП-7"
    fill_in "Улица", with: "ул. Вокзальная"
    fill_in "Номер дома", with: "20"
    fill_in "Модель ПУ", with: "AD13S.1-FL-Z-R-TX(1-1-2)"
    fill_in "S/N ПУ", with: "12398756"
    fill_in "S/N CIU8", with: "06035412"

    click_on "Обновить данные"

    assert_selector "h1", text: "Дисплеи CIU8"
    assert_selector "p", text: "ТП-7"
    assert_selector "p", text: "ул. Вокзальная"
    assert_selector "p", text: "20"
    assert_selector "p", text: "AD13S.1-FL-Z-R-TX(1-1-2)"
    assert_selector "p", text: "12398756"
    assert_selector "p", text: "06035412"
  end

  test "Destroying a display" do
    visit ciu8_displays_path
    assert_selector "h1", text: "Дисплеи CIU8"
    assert_text @ciu8_display.meter_serial_number

    accept_alert do
      click_on "Удалить", match: :first
    end

    assert_no_text @ciu8_display.meter_serial_number
  end
end
