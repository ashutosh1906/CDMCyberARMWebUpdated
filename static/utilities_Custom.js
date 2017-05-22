/**
 * Created by Ashutosh on 2/17/2017.
 */
function ajaxCall(search_parameter,url) {
    // alert("Nice");
    console.log(search_parameter);
    search_parameter['csrfmiddlewaretoken'] = '{{ csrf_token }}';
    var send_data = JSON.stringify(search_parameter);
    var rec_data;
    $.ajax({
        type: "POST",
        url: url,
        contentType: 'application/json',
        dataType: 'json',
        data:send_data,
        "beforeSend": function(xhr, settings) {
            console.log("Before Send");
            $.ajaxSettings.beforeSend(xhr, settings);

        },

        success: function (data_received) {
            alert("test");
            console.log("&&& --->"+data_received);
            loadDataGrid(data_received);

        },
        error: function () {
            alert("Error");
        }
    });

}


function ajaxCallThreatAction(search_parameter,url) {
    // alert("Nice");
    console.log(search_parameter);
    search_parameter['csrfmiddlewaretoken'] = '{{ csrf_token }}';
    var send_data = JSON.stringify(search_parameter);
    var rec_data;
    $.ajax({
        type: "POST",
        url: url,
        contentType: 'application/json',
        dataType: 'json',
        data:send_data,
        "beforeSend": function(xhr, settings) {
            console.log("Before Send");
            $.ajaxSettings.beforeSend(xhr, settings);

        },

        success: function (data_received) {
            alert("test");
            console.log("&&& --->"+data_received);
            loadDataGrid(data_received);

        },
        error: function () {
            alert("Error");
        }
    });

}

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

$.ajaxSetup({
    beforeSend: function(xhr, settings) {
        if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
            // Only send the token to relative URLs i.e. locally.
            xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
        }
    }
});

function loadDataGrid(dataLoad){
            console.log("(...)(..)(..)(..)"+dataLoad);
            var source =
            {
                localdata: dataLoad,
                datatype: "array",
                datafields: [{ name: 'sc_control'},
                  { name: 'id',type:'float'},
                  { name: 'sec_func',},
                  { name: 'en_level',},
                  { name: 'kill_phase', },

           ] };

            var dataAdapter = new $.jqx.dataAdapter(source, {
                loadComplete: function (data) { },
                loadError: function (xhr, status, error) { }
            });
            $("#jqxgrid").jqxGrid(
            {
                source: dataAdapter,
                autowidth: true,
                autoheight:true,
                pageable:true,
                sortable: true,
                columns: [
                  { text: 'Security Control', datafield: 'sc_control', width: 450,renderer:columnrenderer,cellsrenderer:cellsrenderer},
                  { text: 'Id', datafield:'id', width:  70,renderer:columnrenderer,cellsrenderer:cellsrenderer},
                  { text: 'Security Function', datafield: 'sec_func', width: 180,renderer:columnrenderer,cellsrenderer:cellsrenderer },
                  { text: 'Enforcement Level', datafield: 'en_level', width: 180, cellsalign: 'right',renderer:columnrenderer,cellsrenderer:cellsrenderer },
                  { text: 'Kill Chain Phase', datafield: 'kill_phase', width: 180, cellsalign: 'right', cellsformat: 'c2',renderer:columnrenderer,cellsrenderer:cellsrenderer },

                ]
            });
    }

    function loadDataGridThreatAction(dataLoad){
            console.log(dataLoad);
            var source =
            {
                localdata: dataLoad,
                datatype: "array",
                datafields: [{ name: 'sc_version'},
                  { name: 'security_control_name'},
                  { name: 'threat_action'},

           ] };

            var dataAdapter = new $.jqx.dataAdapter(source, {
                loadComplete: function (data) { },
                loadError: function (xhr, status, error) { }
            });
            $("#jqxgrid").jqxGrid(
            {
                source: dataAdapter,
                autowidth: true,
                autoheight:true,
                pageable:true,
                sortable: true,
                filterable: true,
    // cellValue - cell's current value, row data - row's data, data field - column's data field, filterGroup - group of filters, defaultFilterResult - the built-in boolean evaluated result-

                columns: [
                    {text: 'Security Control Version', datafield: 'sc_version', width:250,renderer:columnrenderer,cellsrenderer:cellsrenderer},
                  { text: 'Security Control', datafield: 'security_control_name', width:450,renderer:columnrenderer,cellsrenderer:cellsrenderer},
                  { text: 'Threat Action', datafield:'threat_action', width:370,renderer:columnrenderer,cellsrenderer:cellsrenderer},

                ]
            });
    }

    function loadDataGridWithName(dataLoad,name){
            console.log("(...)(..)(..)(..)"+dataLoad);
            var source =
            {
                localdata: dataLoad,
                datatype: "array",
                datafields: [{ name: 'sc_control'},
                  { name: 'id',type:'float'},
                  { name: 'sec_func',},
                  { name: 'en_level',},
                  { name: 'kill_phase', },

           ] };

            var dataAdapter = new $.jqx.dataAdapter(source, {
                loadComplete: function (data) { },
                loadError: function (xhr, status, error) { }
            });
            $("#"+name).jqxGrid(
            {
                source: dataAdapter,
                autowidth: true,
                autoheight:true,
                pageable:true,
                sortable: true,
                columns: [
                  { text: 'Security Control', datafield: 'sc_control', width: 450,renderer:columnrenderer,cellsrenderer:cellsrenderer},
                  { text: 'Id', datafield:'id', width:  70,renderer:columnrenderer,cellsrenderer:cellsrenderer},
                  { text: 'Security Function', datafield: 'sec_func', width: 180,renderer:columnrenderer,cellsrenderer:cellsrenderer },
                  { text: 'Enforcement Level', datafield: 'en_level', width: 180, cellsalign: 'right',renderer:columnrenderer,cellsrenderer:cellsrenderer },
                  { text: 'Kill Chain Phase', datafield: 'kill_phase', width: 180, cellsalign: 'right', cellsformat: 'c2',renderer:columnrenderer,cellsrenderer:cellsrenderer },

                ]
            });
    }
