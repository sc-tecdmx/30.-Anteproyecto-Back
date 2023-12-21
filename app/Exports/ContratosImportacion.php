<?php

declare(strict_types=1);

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class ContratosImportacion implements FromView, ShouldAutoSize
{
    use Exportable;

    public function view() : View
    {
        return view('agreementsimport');
    }
}
