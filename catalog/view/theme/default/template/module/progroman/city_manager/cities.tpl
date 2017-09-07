<div class="modal fade prmn-cmngr-cities" id="prmn-cmngr-cities" tabindex="-1" role="dialog" data-show="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <h4 class="modal-title"><?= $text_choose_region; ?></h4>
            </div>
            <div class="modal-body">
                <div class="prmn-cmngr-cities__search-block form-inline">
                    <div class="form-group">
                        <label class="prmn-cmngr-cities__search-label"><?= $text_search; ?></label>
                        <input class="prmn-cmngr-cities__search form-control" type="text" placeholder="<?= $text_search_placeholder; ?>">
                    </div>
                </div>
                <div class="row">
                <?php foreach ($columns as $column) { ?>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <?php foreach ($column as $city) { ?>
                        <div class="prmn-cmngr-cities__city">
                            <a class="prmn-cmngr-cities__city-name" data-id="<?= $city['fias_id']; ?>">
                                <?= $city['name']; ?>
                            </a>
                        </div>
                    <?php } ?>
                    </div>
                <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>
