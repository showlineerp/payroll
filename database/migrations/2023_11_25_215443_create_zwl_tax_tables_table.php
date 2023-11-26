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
        Schema::create('zwl_tax_tables', function (Blueprint $table) {
            $table->id();
            $table->string('table_type');
            $table->double('lower_range');
            $table->double('upper_range');
            $table->double('multiply_by');
            $table->double('deduct');
            $table->string('calculation_info');
            $table->boolean('is_active')->default(true);
            $table->boolean('is_above')->default(false);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('zwl_tax_tables');
    }
};
