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
            $table->double('insuarable_amount')->default(0);
            $table->boolean('is_nssa_insuarance')->default(false);
            $table->boolean('is_nssa_contribution')->default(false);
            $table->double('zimra_payable_amount')->default(0);
            $table->boolean('is_zimra_income')->default(false);
            $table->boolean('is_zimra_aids')->default(false);
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
