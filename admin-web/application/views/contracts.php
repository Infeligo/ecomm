<!DOCTYPE html>

<html lang="en">
<head>
    <?= View::factory("partials/head") ?>
</head>
<body>
    <div class="container">
        <?= View::factory("partials/header") ?>

        <h3>Contracts</h3>

        <div class="section">
            <a href="contracts/new" class="btn btn-large btn-primary"><i class="icon-plus"></i> Create new</a>
        </div>

        <table class="table table-bordered" style="width: auto">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Period</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach($contracts as $contract): ?>
                <tr>
                    <td><a href="/admin/contracts/<?= $contract->id ?>"><?= $contract->id ?></a></td>
                    <td><a href="/admin/contracts/<?= $contract->id ?>"><?= $contract->name ?></a></td>
                    <td><?= date_create($contract->validFrom)->format('Y-m-d'); ?> &ndash;
                        <?= date_create($contract->validTo)->format('Y-m-d'); ?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <div>
<body>
</html>
