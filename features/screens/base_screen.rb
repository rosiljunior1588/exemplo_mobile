# Classe genérica com funções que usamos repetidas vezes
# para reuso de código.

class BaseScreen

    def get_text_for_xpath(xpath)
        name = $driver.find_element(xpath: xpath).text
        return name
    end

    def get_text_for_id(id)
        name = $driver.find_element(:id id).text
        return name
    end
    
    def click_by_accessibility_id(id)
        $driver.find_element(:accessibility_id, id).click
    end
    
    def click_by_elements_id(id)
        el = $driver.find_elements(:id, id)
        el.click
    end
    
    def click_by_elements_xpath(id)
        el = $driver.find_elements(:xpath, id)
        el.click
    end
    
    def wait_for_xpath (xpath,time)
        $driver.wait_true(time) { $driver.exists { $driver.find_element(xpath: xpath) }}
    end

    def wait_for_id_displayed (id,time)
        $driver.wait_true(time) { $driver.find_element(:id, id).displayed? }
    end

    def wait_for_id_enabled (id,time)
        $driver.wait_true(time) { $driver.find_element(:id, id).enabled? }
    end

    def wait_for_xpath_enabled (xpath,time)
        $driver.wait_true(time) { $driver.find_element(xpath: xpath).enabled? }
    end

    def wait_for_xpath_displayed (xpath,time)
        $driver.wait_true(time) { $driver.find_element(xpath: xpath).displayed? }
    end

    def wait_for_resource_id (resourceId,time)
        $driver.wait_true(time) { $driver.exists { $driver.find_element(xpath: "//*[@resource-id = '#{resourceId}']") }}
    end
    
    def wait_for_accessibility_id (id,time)
        $driver.wait_true(time) { $driver.exists { $driver.find_element(:accessibility_id, id) }}
    end

    def get_attribute_by_resource_id(resource_id,attribute)
        attribute = $driver.find_element(xpath: "//*[@resource-id = #{resource_id}]").attribute("#{attribute}")
        return attribute
    end
    
    def wait_for_id (id,time)
        $driver.wait_true(time) { $driver.exists { $driver.find_element(:id, id) }}
    end
    
    def click_by_id (id)
        $driver.find_element(:id, id).click
    end

    def click_by_resource_id (resource_id)
        $driver.find_element(xpath: "//*[@resource-id = '#{resource_id}']").click
    end
    
    def click_by_xpath(xpath)
        $driver.find_element(xpath: xpath).click
    end
    
    def send_keys_by_id(id,msg)
        
        #name = $driver.find_element(:id, id).text
        
        
        #if name.nil? || name == ""
        #    $driver.find_element(:id, id).send_keys(msg)
        #    
        #    if $driver.is_keyboard_shown
        #        $driver.hide_keyboard
        #    end
        #end

        $driver.find_element(:id, id).send_keys(msg)
        
    end
    
    def send_keys_by_accessibility_id(xpath,msg)
        
        name = $driver.find_element(:accessibility_id, xpath).text
        
        if name.nil? || name == ""
            $driver.find_element(:accessibility_id, xpath).send_keys(msg)
            
            if $driver.is_keyboard_shown
                $driver.hide_keyboard
            end
        end
    end
    
    def send_keys_by_xpath(xpath,msg)
        
        #name = $driver.find_element(xpath: xpath).text
        
        #if name.nil? || name == ""
        #    $driver.find_element(xpath: xpath).send_keys(msg)
        #    
        #    if $driver.is_keyboard_shown
        #        $driver.hide_keyboard
        #    end
        #end

        $driver.find_element(xpath: xpath).send_keys(msg)

    end
    
    #função de manipular tag filho atraves do pai
    def send_keys_for_child (resource_id_pai, class_filho, valor_input)
       
     elementoPai = $driver.find_element(xpath: "//*[@resource-id = '#{resource_id_pai}']")
     elementoFilho = elementoPai.find_element(:class, "#{class_filho}")
     elementoFilho.send_keys(valor_input)
    
    end

    def find_element_by_id(id)
        $driver.find_element(:id, id)
    end

    def find_element_by_xpath(xpath)
        $driver.find_element(xpath: xpath)
    end

    def find_elements_by_xpath(xpath)
        $driver.find_elements(xpath: xpath)
    end

    def find_elements_by_id(id)
        $driver.find_elements(:id, id)
    end

    def send_keys_elements_by_xpath(xpath, msg)
        el = $driver.find_elements(:xpath, xpath)
        el_name = el.text

        if el_name.nil? || el.name == ""
            el.send_keys(msg)
            $driver.hide_keyboard
        end
    end

    def touch_actions_press(coord_x, coord_y)
      Appium::TouchAction.new.press(x:coord_x, y:coord_y, count: 1).perform
    end

    def touch_actions_move_to(coord_x, coord_y)
        Appium::TouchAction.new.move_to(x:coord_x, y:coord_y, count: 10).perform
    end

    def touch_actions_tap(coord_x, coord_y)
        Appium::TouchAction.new.tap(x: coord_x, y: coord_y).perform
    end

    def touch_actions_swipe(start_x,start_y,end_x,end_y, duration)
        Appium::TouchAction.new.swipe(start_x: start_x, start_y: start_y, end_x: end_x, end_y: end_y, duration: duration).perform #TO_DO
    end
    
    def is_displayed_by_id (id)
        el = $driver.find_element(:id, id).displayed?
        return el
    end

    def clear_by_xpath(xpath)
        $driver.find_element(xpath: xpath).clear
    end

    def scroll_to_element_by_resource_id(resource_id, scrollable_index = 0)
        # Pass the full resource-id into the param e.g.:
        # "com.example.Test:id/enter"
      
        resource_id = %("#{resource_id}")
      
        content = "new UiSelector().resourceId(#{resource_id})"
      
        $driver.find_element :uiautomator, "new UiScrollable(new UiSelector().scrollable(true).instance(#{scrollable_index})).scrollIntoView(#{content}.instance(0));"
      end


end