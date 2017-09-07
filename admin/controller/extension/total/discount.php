<?php

class ControllerExtensionTotalDiscount extends Controller
{

    private $error = array();

    public function index()
    {
        $this->load->language('extension/total/discount');

        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('customer/customer_group');
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
        {
            $this->model_setting_setting->editSetting('discount', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_guests'] = $this->language->get('text_guests');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['entry_from_summ'] = $this->language->get('entry_from_summ');
        $data['entry_to_summ'] = $this->language->get('entry_to_summ');
        $data['entry_discount_value'] = $this->language->get('entry_discount_value');
        $data['entry_discount_type'] = $this->language->get('entry_discount_type');
        $data['entry_discount_type_precent'] = $this->language->get('entry_discount_type_precent');
        $data['entry_discount_type_fixed_summ'] = $this->language->get('entry_discount_type_fixed_summ');
        $data['entry_delete_discount'] = $this->language->get('entry_delete_discount');
        $data['entry_incentive_program'] = $this->language->get('entry_incentive_program');
        $data['entry_incentive_program_accamulation'] = $this->language->get('entry_incentive_program_accamulation');
        $data['entry_incentive_program_summ_current_order'] = $this->language->get('entry_incentive_program_summ_current_order');
        $data['entry_customer_group'] = $this->language->get('entry_customer_group');
        $data['entry_exclude_ids'] = $this->language->get('entry_exclude_ids');
        $data['entry_exclude_promotional_items'] = $this->language->get('entry_exclude_promotional_items');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['html_option_selected'] = "selected='selected'";


        if (isset($this->error['warning']))
        {
            $data['error_warning'] = $this->error['warning'];
        } else
        {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_total'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/total/discount', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['action'] = $this->url->link('extension/total/discount', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=total', true);


        if (isset($this->request->post['discount_status']))
            $data['discount_status'] = $this->request->post['discount_status'];
        else
            $data['discount_status'] = $this->config->get('discount_status');

        if (isset($this->request->post['discount_sort_order']))
            $data['discount_sort_order'] = $this->request->post['discount_sort_order'];
        else
            $data['discount_sort_order'] = $this->config->get('discount_sort_order');

        if (isset($this->request->post['discount_value']))
            $data['discount_value'] = $this->request->post['discount_value'];
        else
            $data['discount_value'] = $this->config->get('discount_value');

        if (isset($this->request->post['discount_from_summ']))
            $data['discount_from_summ'] = $this->request->post['discount_from_summ'];
        else
            $data['discount_from_summ'] = $this->config->get('discount_from_summ');

        if (isset($this->request->post['discount_to_summ']))
            $data['discount_to_summ'] = $this->request->post['discount_to_summ'];
        else
            $data['discount_to_summ'] = $this->config->get('discount_to_summ');

        if (isset($this->request->post['discount_value']))
            $data['discount_value'] = $this->request->post['discount_value'];
        else
            $data['discount_value'] = $this->config->get('discount_value');

        if (isset($this->request->post['discount_type']))
            $data['discount_type'] = $this->request->post['discount_type'];
        else
            $data['discount_type'] = $this->config->get('discount_type');

        if (isset($this->request->post['discount_incentive_program']))
            $data['discount_incentive_program'] = $this->request->post['discount_incentive_program'];
        else
            $data['discount_incentive_program'] = $this->config->get('discount_incentive_program');

        if (isset($this->request->post['discount_customer_group']))
            $data['discount_customer_group'] = $this->request->post['discount_customer_group'];
        else
            $data['discount_customer_group'] = $this->config->get('discount_customer_group');

        if (isset($this->request->post['discount_exclude_ids']))
            $data['discount_exclude_ids'] = $this->request->post['discount_exclude_ids'];
        else
            $data['discount_exclude_ids'] = $this->config->get('discount_exclude_ids');

        if (isset($this->request->post['discount_promotional_items']))
            $data['discount_promotional_items'] = $this->request->post['discount_promotional_items'];
        else
            $data['discount_promotional_items'] = $this->config->get('discount_promotional_items');
        

        $data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

        $data['text_all_group'] = $this->language->get('text_all_group');

        $data['customer_groups_html'] = "<option value='all'>" . $data['text_all_group'] . "</option>";
        $data['customer_groups_html'] .= "<option value='guests'>" . $data['text_guests'] . "</option>";

        foreach ($data['customer_groups'] as $group)
            $data['customer_groups_html'] .= "<option value='" . $group['customer_group_id'] . "'>" . $group['name'] . "</option>";

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');


        $this->response->setOutput($this->load->view('extension/total/discount', $data));
    }

    protected function validate()
    {
        $data = $this->request->post;

        if (!$this->user->hasPermission('modify', 'extension/total/discount'))
            $this->error['warning'] = $this->language->get('error_permission');
        else if (
                !isset($data['discount_to_summ']) ||
                !isset($data['discount_from_summ']) ||
                !isset($data['discount_value']) ||
                !isset($data['discount_type']) ||
                !isset($data['discount_incentive_program']) ||
                !isset($data['discount_customer_group'])
        )
            $this->error['warning'] = $this->language->get('error_one_discount');
        else if (
                count($data['discount_from_summ']) != count($data['discount_to_summ']) ||
                count($data['discount_from_summ']) != count($data['discount_value']) ||
                count($data['discount_from_summ']) != count($data['discount_type']) ||
                count($data['discount_from_summ']) != count($data['discount_incentive_program']) ||
                count($data['discount_from_summ']) != count($data['discount_customer_group'])
        )
            $this->error['warning'] = $this->language->get('error_field_absence');
        else
        {
            if (!empty($this->request->post['discount_exclude_ids']))
                $this->request->post['discount_exclude_ids'] = preg_replace('/[^0-9\,]/', '', $this->request->post['discount_exclude_ids']);

            $len = count($data['discount_value']);
            for ($i = 0; $i < $len; $i++)
            {
                if (!(is_numeric($data['discount_to_summ'][$i]) && is_numeric($data['discount_from_summ'][$i]) && is_numeric($data['discount_value'][$i])))
                {
                    $this->error['warning'] = $this->language->get('error_empty_values');
                    break;
                } else if (!($data['discount_incentive_program'][$i] == 'accumulation' || $data['discount_incentive_program'][$i] == 'summ_current_order'))
                {
                    $this->error['warning'] = $this->language->get('error_select_incentive_program');
                    break;
                } else if (!($data['discount_type'][$i] == 'precent' || $data['discount_type'][$i] == 'fixed_summ'))
                {
                    $this->error['warning'] = $this->language->get('error_select_discount_type');
                    break;
                } else if (!($data['discount_to_summ'][$i] > 0 && $data['discount_from_summ'][$i] > 0 && $data['discount_value'][$i] > 0))
                {
                    $this->error['warning'] = $this->language->get('error_zero_values');
                    break;
                } else if ($data['discount_value'][$i] > 100 && $data['discount_type'][$i] == 'precent')
                {
                    $this->error['warning'] = $this->language->get('error_precent');
                    break;
                } else if ($data['discount_to_summ'][$i] <= $data['discount_from_summ'][$i])
                {
                    $this->error['warning'] = $this->language->get('error_from_>_to');
                    break;
                }
            }
        }



        return !$this->error;
    }

}
