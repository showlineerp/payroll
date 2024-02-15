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
        Schema::create('salary_tax_credits', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('employee_id');
            $table->string('month_year', 50);
            $table->date('first_date')->nullable();
            $table->string('deduction_title', 191);
            $table->string('deduction_amount', 191);
            $table->string('deduction_type', 191);
            $table->unsignedBigInteger('currency_id')->nullable();
            $table->string('currency_symbol')->default('$');
            $table->foreign('employee_id', 'salary_tax_credits_employee_id_foreign')->references('id')->on('employees')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('salary_tax_credits');
    }
};
