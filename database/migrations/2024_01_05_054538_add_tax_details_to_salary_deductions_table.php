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
        Schema::table('salary_deductions', function (Blueprint $table) {
            //
            $table->unsignedBigInteger('currency_id')->nullable();
            $table->boolean('is_taxable')->default(false);
            $table->string('currency_symbol')->default('$');
            $table->double('deductible_amt')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('salary_deductions', function (Blueprint $table) {
            //
        });
    }
};
