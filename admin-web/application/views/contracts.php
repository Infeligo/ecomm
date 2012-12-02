<!DOCTYPE html>

<html lang="en">
<head>
    <?= View::factory("partials/head") ?>
</head>
<body>
    <div class="container">
        <?= View::factory("partials/header") ?>

        <h3>Recent contracts</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Contract Nr.</th>
                    <th>Name</th>
                    <th>Notes</th>
                    <th>Valid</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach($contracts as $contract): ?>
                <tr>
                    <td><a href="/admin/contracts/view/<?= $contract->id ?>"><?= $contract->contractNumber ?></a></td>
                    <td><?= $contract->name ?></td>
                    <td><?= $contract->note ?></td>
                    <td><?= date_create($contract->validFrom)->format('Y-m-d'); ?> &ndash;
                        <?= date_create($contract->validTo)->format('Y-m-d'); ?></td>
                    <td><a href="/admin/contracts/view/<?= $contract->id ?>" class="btn btn-small">View</a></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <div>
<body>
</html>
