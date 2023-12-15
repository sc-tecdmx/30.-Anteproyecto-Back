<?php

declare(strict_types=1);

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class ContratosVersiones implements FromView, ShouldAutoSize
{
    use Exportable;

   /** @var array **/
    private $agreements;

    public function __construct(array $agreements)
    {
        $this->agreements = $agreements;
    }

    public function view() : View
    {
        return view('specialagreements', [
            'agreements' => $this->agreements
        ]);
    }
}
