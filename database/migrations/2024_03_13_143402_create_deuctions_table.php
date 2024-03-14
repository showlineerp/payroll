<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('deductions', function (Blueprint $table) {
            $table->id();
            $table->string('employee_id');
            $table->string('month_year', 191);
            $table->date('first_date')->nullable();
            $table->string('allowance_title');
            $table->string('deduction_amount');
            $table->string('currency_id');
            $table->string('currency_symbol');
            $table->boolean('is_taxable');
            $table->double('deductible_amt');
            $table->boolean('is_recurring');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('deductions');
    }
};
