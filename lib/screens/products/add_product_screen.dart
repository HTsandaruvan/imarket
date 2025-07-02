import 'package:flutter/material.dart';

class HSCode {
  final String code;
  final String description;
  final String currentRate;
  final String validUntil;

  HSCode({
    required this.code,
    required this.description,
    required this.currentRate,
    required this.validUntil,
  });
}

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  final _productNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _minOrderController = TextEditingController();
  final _unitController = TextEditingController();
  final _specificationController = TextEditingController();
  final _shippingTermsController = TextEditingController();
  final _deliveryTimeController = TextEditingController();
  final _tagsController = TextEditingController();

  bool _hasSpecialOffer = false;
  bool _isLoading = false;
  String _selectedCategory = '';
  HSCode? _selectedHSCode;

  // HS Codes data
  final List<HSCode> _hsCodes = [
    HSCode(
      code: '03.02',
      description:
          'Fish, fresh or chilled, excluding fish fillets and other fish meat of Heading 03.04',
      currentRate: '10% or Rs.400.00 per Kg, whichever is higher',
      validUntil: '14/10/2024',
    ),
    HSCode(
      code: '03.03',
      description:
          'Fish, frozen, excluding fish fillets and other meat of Heading 03.04 (other than the mackerel fish coming under HS 0303.54)',
      currentRate: '10% or Rs.400.00 per Kg, whichever is higher',
      validUntil: '14/10/2024',
    ),
    HSCode(
      code: '0303.54',
      description:
          'Mackerel(Scomber scombrus, Scomber australasicus, Scomber japonicus)',
      currentRate: '10% or Rs.400.00 per Kg, whichever is higher',
      validUntil: '14/10/2024',
    ),
  ];

  final List<String> _categories = [
    'Electronics',
    'Food & Beverages',
    'Textiles',
    'Machinery',
    'Chemicals',
    'Others',
  ];

  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _minOrderController.dispose();
    _unitController.dispose();
    _specificationController.dispose();
    _shippingTermsController.dispose();
    _deliveryTimeController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Add New Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Information Section
              _buildSectionTitle('Basic Information'),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _productNameController,
                label: 'Product Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _descriptionController,
                label: 'Description',
                maxLines: 4,
                hintText:
                    'Enter product description, features, and specifications...',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // HS Code Selection
              _buildHSCodeDropdown(),

              const SizedBox(height: 16),

              // Category Selection
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF4A6CF7)
                            : Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF4A6CF7)
                              : Colors.grey[300]!,
                        ),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[700],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 32),

              // Pricing & Offers Section
              _buildSectionTitle('Pricing & Offers'),
              const SizedBox(height: 16),

              // Special Offer Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Special Offer',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Switch(
                    value: _hasSpecialOffer,
                    onChanged: (value) {
                      setState(() {
                        _hasSpecialOffer = value;
                      });
                    },
                    activeColor: const Color(0xFF4A6CF7),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _priceController,
                label: 'Price',
                keyboardType: TextInputType.number,
                prefixText: '\$ ',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Min Order Quantity and Unit
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildTextField(
                      controller: _minOrderController,
                      label: 'Min Order Quantity',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      controller: _unitController,
                      label: 'Unit',
                      hintText: 'Kg',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Product Media Section
              _buildSectionTitle('Product Media'),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildMediaUpload('Images', Icons.image_outlined),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildMediaUpload(
                      'Videos (optional)',
                      Icons.videocam_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Additional Details Section
              _buildSectionTitle('Additional Details'),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _specificationController,
                label: 'Specification',
                maxLines: 3,
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _shippingTermsController,
                label: 'Shipping Terms',
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _deliveryTimeController,
                label: 'Delivery Time',
                hintText: 'e.g., 7-10 business days',
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _tagsController,
                label: 'Tags',
                hintText: 'Enter tags separated by commas',
              ),

              const SizedBox(height: 40),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A6CF7),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Submit For Review',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    String? prefixText,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            prefixText: prefixText,
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF4A6CF7)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHSCodeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HS Code & Rate',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<HSCode>(
              value: _selectedHSCode,
              hint: const Text('Select HS Code'),
              isExpanded: true,
              items: _hsCodes.map((hsCode) {
                return DropdownMenuItem<HSCode>(
                  value: hsCode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        hsCode.code,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        hsCode.description,
                        style: TextStyle(fontSize: 9, color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (HSCode? value) {
                setState(() {
                  _selectedHSCode = value;
                });
              },
            ),
          ),
        ),
        if (_selectedHSCode != null) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Rate: ${_selectedHSCode!.currentRate}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Valid Until: ${_selectedHSCode!.validUntil}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMediaUpload(String title, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            // Handle media upload
          },
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey[300]!,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.grey[400], size: 24),
                const SizedBox(height: 4),
                Icon(Icons.add, color: Colors.grey[400], size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedCategory.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product submitted for review successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit product: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
