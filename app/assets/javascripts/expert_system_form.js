function addStandardRow(){
    var num = $('div.row.state').length; // how many standard rows we currently have

    var newStandardRow = $('div.row.state:first').clone();
    customReplace(newStandardRow, "standards", num);

    // insert the new element after the last standard row
    $('div.row.state:last').after(newStandardRow);

    buttonsDisableLogic(num+1,$('div.row.state:first').find('.fl.number').length);

    // after all fill in all standards variables with new values
    fillStandards();
}

function removeStandardRow(){
    $('div.row.state:last').remove();     // remove the last state row
    var num = $('div.row.state').length; // how many "duplicatable" state rows we currently have

    buttonsDisableLogic(num,$('div.row.state:first').find('.fl.number').length);

    // after all fill in all standards variables with new values
    fillStandards();
}

function addDiagnosticVariable(){
    var num = $('div.row.state:first').find('.fl.number').length; // how many diagnostic variables we currently have
    $('div.row.state').each(function(){
        var newDiagnosticVariable = $(this).find('.fl.number:first').clone();
        customReplace(newDiagnosticVariable, "diagnostic_variables", num);
        var beef = $(this).find('.boolean:first').clone();
        customReplace(beef, "diagnostic_variables", num);

        // insert the new element after the last diagnostic variable
        $(this).find('.boolean:last').after(newDiagnosticVariable);
        $(this).find('.fl.number:last').after(beef);
    });
    // add the last number header
    var newVariableNumber = $('.variable-number:first').clone();
    newVariableNumber.find('.number').html(num+1);
    $('.variable-number:last').after(newVariableNumber);

    buttonsDisableLogic($('div.row.state').length,num+1);

    // after all fill in all standards variables with new values
    fillStandards();
}

function removeDiagnosticVariable(){
    $('.variable-number:last').remove(); // remove the last number header
    $('div.row.state').each(function(){
        $(this).find('.fl.number:last').remove(); // remove the last diagnostic variable
        $(this).find('.boolean:last').remove();
        $(this).find('fieldset input:last').remove();
    });
    var num = $('div.row.state:first').find('.fl.number').length; // how many diagnostic variables we currently have

    buttonsDisableLogic($('div.row.state').length,num);
}

function changeBeefs(){
    removeBeefs();
    var str = $('#beefs-input').val();
    var ptrn = /\d+(?:\.\d+)?/g;
    var match;
    while ( ( match = ptrn.exec(str) ) != null ){
        changeBeef(match);
    }
}

function changeBeef(n){
    $(".variable-number:eq("+(n-1)+") h3").addClass("beef");
    $('div.state').each(function(){
        $(this).find(".variable:eq("+(n-1)+")").addClass("beef");
        $(this).find(".beef-checkbox:eq("+(n-1)+")").attr("checked","checked");
    });
}

function removeBeefs(){
    $(".variable-number h3").removeClass("beef");
    $('div.state').each(function(){
        $(this).find(".variable").removeClass("beef");
        $(this).find(".beef-checkbox").removeAttr("checked","checked");
    });
}

/* buttons business logic BEGIN */
function buttonsDisableLogic(standards, variables){
    enableAll();
    if ( standards >= 7 ) {
        disableAddButton();
        disableAddStandard();
    } else if ( standards <= 3 ) {
        disableRemoveButton();
        disableRemoveStandard();
    }
    if ( variables >= 9 ) {
        disableAddDiagnosticVariable();
    } else if ( variables <= 3 ) {
        disableRemoveDiagnosticVariable();
    }
    if ( standards >= 7 && variables >= 9 ) {
        disableAddDropdown();
    } else if ( standards <= 3 && variables <= 3 ) {
        disableRemoveDropdown();
    }
}
function enableAll(){
    enableAddButton();
    enableAddDiagnosticVariable();
    enableAddDropdown();
    enableAddStandard();
    enableRemoveButton();
    enableRemoveDiagnosticVariable();
    enableRemoveDropdown();
    enableRemoveStandard();
}
function disableAddButton(){
    $('#add').attr('disabled','disabled');
}
function disableAddDropdown(){
    $('.btn-success.dropdown-toggle').attr('disabled','disabled');
}
function disableRemoveButton(){
    $('#remove').attr('disabled','disabled');
}
function disableRemoveDropdown(){
    $('.btn-danger.dropdown-toggle').attr('disabled','disabled');
}
function disableAddStandard(){
    $('#add_standard_row').removeAttr("onclick");
}
function disableRemoveStandard(){
    $('#remove_standard_row').removeAttr("onclick");
}
function disableAddDiagnosticVariable(){
    $('#add_diagnostic_variable').removeAttr("onclick");
}
function disableRemoveDiagnosticVariable(){
    $('#remove_diagnostic_variable').removeAttr("onclick");
}
function enableAddButton(){
    $('#add').removeAttr('disabled');
}
function enableAddDropdown(){
    $('.btn-success.dropdown-toggle').removeAttr('disabled');
}
function enableRemoveButton(){
    $('#remove').removeAttr('disabled');
}
function enableRemoveDropdown(){
    $('.btn-danger.dropdown-toggle').removeAttr('disabled');
}
function enableAddStandard(){
    disableAddStandard();
    $('#add_standard_row').attr("onclick","addStandardRow();");//click(function() { return addStandardRow(); });
}
function enableRemoveStandard(){
    disableRemoveStandard();
    $('#remove_standard_row').attr("onclick","removeStandardRow();");//click(function() { return removeStandardRow(); });
}
function enableAddDiagnosticVariable(){
    disableAddDiagnosticVariable();
    $('#add_diagnostic_variable').attr("onclick","addDiagnosticVariable();");//click(function() { addDiagnosticVariable(); });
}
function enableRemoveDiagnosticVariable(){
    disableRemoveDiagnosticVariable();
    $('#remove_diagnostic_variable').attr("onclick","removeDiagnosticVariable();");//click(function() { removeDiagnosticVariable(); });
}
/* buttons business logic END */

function customReplace(object, pattern, num) {
    var regex1 = new RegExp(pattern+"_attributes_0", 'g');
    var string1 = pattern + "_attributes_" + num;
    object.html(object.html().replace( regex1, string1 ));
    var regex2 = new RegExp(pattern+"_attributes\\]\\[0\\]", 'g');
    var string2 = pattern + "_attributes][" + num + "]";
    object.html(object.html().replace( regex2, string2 ));

    var id = object.attr("id");
    if (id!=null && id.length > 0){
        object.attr( "id", id.replace( regex1, string1 ) );
    }
}

function fillBeefs() {
    var placeholder = "";
    $('.variable-number h3').each(function(index){
        if ($(this).hasClass("beef")){
            placeholder += (index+1) + ' ';
            /*$('#beefs-input').val(function(i, val) {
             return val + (index+1) + ' ';
             });*/
        }
    });
    $('#beefs-input').attr("placeholder", placeholder);
}

function fillStandards() {
    var num = $('div.row.state').length;
    var value = 0;
    var increment = 1/(num-1);
    $('.row.state').each(function(index){
        fillVariables(this, value);
        value +=increment;
    });
}

function fillVariables(parent, value) {
    $(parent).find('.variable').each(function(){
        $(this).val(value);
    });
}

function autoFill() {
    $('.object_variable').each(function(){
        $(this).val(Math.random());
    });
}