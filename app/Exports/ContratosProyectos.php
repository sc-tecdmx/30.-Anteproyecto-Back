<?php

declare(strict_types=1);

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class ContratosProyectos implements FromView, ShouldAutoSize
{
    use Exportable;

   /** @var array **/
    private $agreements;
    private $budget;

    public function __construct(array $agreements, float $budget)
    {
        $this->agreements = $agreements;
        $this->budget = $budget;
    }

    public function view() : View
    {
        return view('projects', [
            'agreements' => $this->agreements,
            'budget' => $this->budget
        ]);
    }
}
