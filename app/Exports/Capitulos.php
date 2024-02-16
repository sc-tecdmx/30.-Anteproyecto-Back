<?php

declare(strict_types=1);

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class Capitulos implements FromView, ShouldAutoSize, WithColumnFormatting
{
    use Exportable;

   /** @var array **/
    private $chapters;

    public function __construct(array $chapters)
    {
        $this->chapters = $chapters;
    }

    public function columnFormats(): array
    {
        return [
            'D' => NumberFormat::FORMAT_NUMBER,
            'E' => NumberFormat::FORMAT_NUMBER
        ];
    }

    public function view() : View
    {
        return view('integrationagreements', [
            'chapters' => $this->chapters
        ]);
    }
}
