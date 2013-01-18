<!DOCTYPE html>

<html lang="en">
<head>
    <?= View::factory("partials/head") ?>
    <style>
        .form-horizontal .control-group:last-child {
            margin-bottom: 0;
        }
    </style>

    <script>
        $(function () {
            $('#contract').validate();
            $('#save').on('click', function (e) {
                e.preventDefault();
                if ($('#contract').valid()) {
                    $.ajax({
                        url: "update",
                        type: "POST",
                        dataType: "json",
                        data: $('#contract').serialize()
                    }).done(function (result) {
                            console.log(result);
                            alert("Contract was successfully saved!");
                        }).fail(function () {
                            alert("Error saving contract");
                        });
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <?= View::factory("partials/header") ?>

    <h3><a href="/admin/contracts">Contracts</a> &rarr; Contract <?= $contract->id ?></h3>

    <form id="contract" class="form-horizontal" method="POST">

        <fieldset>
            <legend>Customer</legend>

            <div class="control-group">
                <label class="control-label">Name:</label>

                <div class="controls">
                    <input type="hidden" name="customerId" value=""/>
                    <span><?= $contract->customer->firstName ?> <?= $contract->customer->lastName ?></span>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Reg. code:</label>

                <div class="controls">
                    <span><?= $contract->customer->identityCode ?></span>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Address:</label>

                <div class="controls">
                    <span><?= $contract->address->address ?> <?= $contract->address->house ?> <?= $contract->address->townCounty ?></span>
                </div>
            </div>

        </fieldset>

        <fieldset>
            <legend>Details</legend>

            <div class="control-group">
                <label class="control-label">Name:</label>

                <div class="controls">
                    <input type="hidden" name="id" value="<?= $contract->id ?>"/>
                    <input type="text" name="name" class="input-xlarge required" value="<?= $contract->name ?>"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Value amount:</label>

                <div class="controls">
                    <span id="valueAmount"><?= $contract->valueAmount ?></span> <span>EUR</span>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Period:</label>

                <div class="controls">
                    <span><?= date_create($contract->validFrom)->format('Y-m-d'); ?> &ndash;
                        <?= date_create($contract->validTo)->format('Y-m-d'); ?></span>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Description:</label>

                <div class="controls">
                    <textarea name="description" class="input-xlarge" rows="4"><?= $contract->description ?></textarea>
                </div>
            </div>
        </fieldset>

        <div class="form-actions">
            <button type="submit" id="save" class="btn btn-large btn-primary">Save</button>
        </div>
    </form>

    <script>
        $(function () {
            $('#valueAmount').autoNumeric('init', {
                vMin: 0.00,
                vMax: 999999999.00
            });
        });
    </script>

</div>

</body>
</html>
