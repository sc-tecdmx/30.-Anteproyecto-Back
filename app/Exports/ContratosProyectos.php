<?php

declare(strict_types=1);

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class ContratosProyectos implements FromView, ShouldAutoSize, WithColumnFormatting, WithColumnWidths
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

    public function columnWidths(): array
    {
        return [
            'B' => 165
        ];
    }

    public function columnFormats(): array
    {
        return [
            'C' => NumberFormat::FORMAT_NUMBER
        ];
    }

    public function view() : View
    {
        return view('projects', [
            'agreements' => $this->agreements,
            'budget' => $this->budget
        ]);
    }
}
