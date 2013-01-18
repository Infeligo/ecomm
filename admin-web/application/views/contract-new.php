<!DOCTYPE html>

<html lang="en">
<head>
    <?= View::factory("partials/head") ?>
</head>
<body>

<script>
    (function () {
        var $customerSearch,
            $contractDetails,
            renderCustomers,
            renderCustomer;

        var findCustomers = function (query) {
            return $.getJSON("find_customers", { query: query });
        }

        var displayCustomers = function (data) {
            $customerSearch.find('.results').html(renderCustomers({
                customers: ensureArray(data.return)
            }));
        }

        var getCustomer = function (customerId) {
            return $.getJSON("get_customer", { customerId: customerId });
        }

        var displayContractDetails = function (data) {
            console.debug("Displaying customer details", data);
            $contractDetails.find('[name=customerId]').val(data.id);
            $contractDetails.find('[data-name=fullname]').text(data.firstName + " " + data.lastName);
            $contractDetails.find('[data-name=identityCode]').text(data.identityCode);

            var addresses = ensureArray(data.addresses);
            var $addresses = $contractDetails.find('[name=addressId]').empty();
            _.each(addresses, function (el) {
                $addresses.append('<option value="{id}">{address}, {house}, {townCounty}</option>'.assign(el));
            });

            $contractDetails.show();
            $contractDetails.find('[name=name]').focus();
        }

        $(function () {
            $customerSearch = $('#customerSearch');
            $contractDetails = $('#contractDetails');
            renderCustomers = _.template($('#customersTempl').html());

            $customerSearch.on('click', '#search', function (e) {
                e.preventDefault();
                var query = $customerSearch.find('[name="name"]').val();
                findCustomers(query).done(displayCustomers);
            });

            $customerSearch.on('click', 'a[data-rel]', function (e) {
                e.preventDefault();
                var customerId = $(this).attr('data-rel');
                $customerSearch.hide();
                getCustomer(customerId).done(displayContractDetails);
            });

            $contractDetails.on('click', '#create', function (e) {
                e.preventDefault();
                console.log('Creating');
                if ($contractDetails.find('form').valid()) {
                    $.ajax({
                        url: "create",
                        type: "POST",
                        data: $contractDetails.find('form').serialize(),
                        dataType: "json"
                    }).done(function (result) {
                        console.log(result);
                        alert("Contract was successfully saved!");
                        window.location = result.return;
                    }).fail(function () {
                        alert("Error saving contract");
                    });
                }
            });

            $('[name="valueAmount"]').autoNumeric('init', {
                aSep: "",
                vMin: -0.00,
                vMax: 999999999.99
            });

            $contractDetails.find('form').validate();

            $('#search').popover({
                placement: 'right',
                trigger: 'hover',
                html: true,
                title: "Suggestions",
                content: "Try <i>tamm</i>, <i>maarika</i>, <i>maarika tamm</i>"
            })

        });
    })();
</script>

<div class="container">
    <?= View::factory("partials/header") ?>

    <h3><a href="/admin/contracts">Contracts</a> &rarr; New contract</h3>
    <br/>

    <div id="customerSearch">
        <h4>Step 1. Select a customer</h4>

        <form class="form-inline" method="POST">
            <input type="text" name="name" placeholder="Search by name" autofocus="autofocus"/>
            <input type="submit" id="search" class="btn btn-success" value="Search"/>
        </form>

        <div class="results"></div>
    </div>

    <div id="contractDetails" style="display: none">

        <h4>Step 2. Fill contract data</h4>
        <br/>
        <form class="form-horizontal" method="POST">

            <fieldset>
                <legend>Customer</legend>

                <div class="control-group">
                    <label class="control-label">Name:</label>

                    <div class="controls">
                        <input type="hidden" name="customerId" value=""/>
                        <span data-name="fullname">Maarika Tamm</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Reg. code:</label>

                    <div class="controls">
                        <span data-name="identityCode"></span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Address:</label>

                    <div class="controls">
                        <select name="addressId" class="input-xlarge"></select>
                    </div>
                </div>

            </fieldset>

            <fieldset>
                <legend>Details</legend>

                <div class="control-group">
                    <label class="control-label">Contract name:</label>

                    <div class="controls">
                        <input type="text" name="name" class="input-xlarge required" value=""/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Value amount:</label>

                    <div class="controls">
                        <input type="text" name="valueAmount" class="input-small required" value=""/> EUR
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Valid since:</label>

                    <div class="controls">
                        <input type="text" name="validFrom" class="input-small date today required" data-date-format="yyyy-mm-dd" value=""/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Period:</label>

                    <div class="controls">
                        <select name="period" class="input-small">
                            <option value="6">6 month</option>
                            <option value="12">1 year</option>
                            <option value="24">2 years</option>
                            <option value="60">5 years</option>
                        </select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Description:</label>

                    <div class="controls">
                        <textarea name="description" class="input-xlarge"></textarea>
                    </div>
                </div>
            </fieldset>

            <div class="form-actions">
                <input type="submit" id="create" class="btn btn-large btn-primary" value="Create contract"/>
                <a href="" class="btn btn-large">Cancel</a>
            </div>
        </form>

        <script id="customersTempl" type="text/template">
            <@ if (!customers.length) { @>
                <div class="alert alert-danger">
                    No customers found
                </div>
            <@ } else { @>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th class="column-id">ID</th>
                        <th class="column-fullname">Name</th>
                        <th>Reg. code</th>
                    </tr>
                    </thead>
                    <tbody>
                    <@ _ . each(customers, function (customer) { @>
                        <tr>
                            <td><@= customer.id @></td>
                            <td><a href="#"
                                   data-rel="<@= customer.id @>"><@= customer.firstName @> <@= customer.lastName @></a>
                            </td>
                            <td><@= customer.note @></td>
                        </tr>
                    <@ }); @>
                    </tbody>
                </table>
            <@ } @>
        </script>

    </div>

</div>

</body>
</html>
