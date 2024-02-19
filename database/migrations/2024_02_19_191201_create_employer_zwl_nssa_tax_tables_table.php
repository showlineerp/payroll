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
        Schema::create('employer_zwl_nssa_tax_tables', function (Blueprint $table) {
            $table->id();
            $table->string('posb_insuarance')->nullable();
            $table->string('insuarance_ceiling')->nullable();
            $table->string('posb_contribution')->nullable();
            $table->unsignedBigInteger('currency_id')->nullable();
            $table->string('currency')->nullable();
            $table->string('last_updated_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employer_zwl_nssa_tax_tables');
    }
};
