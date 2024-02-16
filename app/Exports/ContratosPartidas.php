<?php

declare(strict_types=1);

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class ContratosPartidas implements FromView, ShouldAutoSize, WithColumnFormatting
{
    use Exportable;

   /** @var array **/
    private $splits;
    private $budget;

    public function __construct(array $splits, float $budget)
    {
        $this->splits = $splits;
        $this->budget = $budget;
    }

    public function columnFormats(): array
    {
        return [
            'C' => NumberFormat::FORMAT_NUMBER
        ];
    }

    public function view() : View
    {
        return view('agreementssplits', [
            'splits' => $this->splits,
            'budget' => $this->budget
        ]);
    }
}
