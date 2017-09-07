<?php
namespace progroman\Startup;

abstract class Loader {
    /** @var \Registry */
    protected $registry;

    public function __construct($registry) {
        $this->registry = $registry;
    }

    abstract protected function runLoader();

    public static function run($registry) {
        $loader = new static($registry);
        $loader->runLoader();
    }
}