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
            $('#save').on('click', function (e) {
                e.preventDefault();
                $.ajax({
                    url: "/admin/contracts/edit",
                    type: "POST",
                    dataType: "json",
                    data: $('#contract').serialize()
                }).done(function (result) {
                    console.log(result);
                    alert("Contract was successfully saved!");
                }).fail(function () {
                    alert("Error saving contract");
                });
            });

            $('#accept').on('click', function (e) {
                e.preventDefault();
                $.ajax({
                    url: "/admin/contracts/accept",
                    type: "post",
                    dataType: "json",
                    data: { id: $().val() }
                }).done(function (result) {
                    console.log(result);
                    alert("Contract was accepted!");
                }).fail(function () {
                    alert("Error accepting the contract!");
                });
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <?= View::factory("partials/header") ?>

        <h3>Contract nr. <?= $contract->contractNumber ?></h3>

        <form id="contract" class="form-horizontal" method="POST">

            <div class="control-group">
                <label class="control-label">ID:</label>
                <div class="controls">
                    <span class="uneditable-input"><?= $contract->id ?></span>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Name:</label>
                <div class="controls">
                    <input type="text" name="name" value="<?= $contract->name ?>"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Description:</label>
                <div class="controls">
                    <textarea name="description"><?= $contract->description ?></textarea>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Note:</label>
                <div class="controls">
                    <input type="text" name="note" value="<?= $contract->note ?>"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Value amount:</label>
                <div class="controls">
                    <input type="text" name="valueAmount" value="<?= $contract->valueAmount ?>"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Valid:</label>
                <div class="controls">
                    <input type="text" name="validFrom" class="input-small" value="<?= date_create($contract->validFrom)->format('Y-m-d'); ?>"/> &ndash;
                    <input type="text" name="validTo" class="input-small" value="<?= date_create($contract->validTo)->format('Y-m-d'); ?>"/>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" id="save" class="btn btn-primary">Save changes</button>
                <button type="button" id="accept" class="btn btn-success">Accept</button>
                <button type="button" id="reject" class="btn btn-danger">Reject</button>
            </div>
        </form>

    </div>

</body>
</html>
