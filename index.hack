<<__EntryPoint>>
function boot(): void {
    require_once(__DIR__.'/vendor/autoload.hack');  
    \Facebook\AutoloadMap\initialize();
    main();
}