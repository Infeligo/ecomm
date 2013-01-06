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
            $contractDetails.find('[data-name=fullname]').text(data.firstName + " " + data.lastName);
            $contractDetails.find('[data-name=identityCode]').text(data.identityCode);

            var addresses = ensureArray(data.addresses);
            var $addresses = $contractDetails.find('[name=address]').empty();
            _.each(addresses, function (el) {
                var addr = "foo";
                $addresses.append('<option value="' + el.id + '">' + addr + '</option>');
            });

            $contractDetails.show();
        }

        $(function () {
            $customerSearch = $('#customerSearch');
            $contractDetails = $('#contractDetails');
            renderCustomers = _.template($('#customersTempl').html());

            $customerSearch.on('click', 'input:submit', function (e) {
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

            $contractDetails.on('click', 'input:submit', function (e) {
                e.preventDefault();
            });
        });
    })();
</script>

<div class="container">
    <?= View::factory("partials/header") ?>

    <h2>New contract</h2>

    <div id="customerSearch">
        <h3>Step 1. Select a customer</h3>

        <form class="form-inline" method="POST">
            <input type="text" name="name" placeholder="Full name" autofocus="autofocus"/>
            <input type="submit" class="btn btn-success" value="Search"/>
        </form>

        <div class="results"></div>
    </div>

    <div id="contractDetails" style="display: none">

        <h3>Step 2. Fill contract data</h3>

        <form class="form-horizontal" method="POST">

            <fieldset>
                <legend>Contractee</legend>

                <div class="control-group">
                    <label class="control-label">Name:</label>

                    <div class="controls">
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
                    <label class="control-label">Date of birth:</label>

                    <div class="controls">
                        <span data-name="birthDate"></span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Address:</label>

                    <div class="controls">
                        <select name="address" class="input-xlarge"></select>
                    </div>
                </div>

            </fieldset>

            <fieldset>
                <legend>Details</legend>

                <div class="control-group">
                    <label class="control-label">Contract name:</label>

                    <div class="controls">
                        <input type="text" name="name" value=""/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Description:</label>

                    <div class="controls">
                        <textarea name="description"></textarea>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Note:</label>

                    <div class="controls">
                        <input type="text" name="note" value=""/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Value amount:</label>

                    <div class="controls">
                        <input type="text" name="valueAmount" value=""/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Valid:</label>

                    <div class="controls">
                        <input type="text" name="validFrom" class="input-small" value=""/> &ndash;
                        <input type="text" name="validTo" class="input-small" value=""/>
                    </div>
                </div>
            </fieldset>

            <div class="form-actions">
                <button type="submit" id="create" class="btn btn-large btn-primary">Create contract</button>
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
