<?php

declare(strict_types=1);

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class CapitulosConceptos implements FromView, ShouldAutoSize
{
    use Exportable;

   /** @var array **/
    private $data;

    public function __construct(array $data)
    {
        $this->data = $data;
    }

    public function view() : View
    {
        return view('chapterconcept', [
            'data' => $this->data
        ]);
    }
}
