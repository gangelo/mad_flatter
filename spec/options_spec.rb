# frozen_string_literal: true

RSpec.shared_examples 'no error is raised' do
  it 'does not raise an error' do
    expect { subject }.to_not raise_error
  end
end

RSpec.shared_examples 'an error is raised' do
  it 'raises an error' do
    expect { subject }.to raise_error expected_error
  end
end

RSpec.describe MadFlatter::Options, type: :module do
  let(:options) { {} }

  describe '#new' do
    subject { described_class.new(**options) }

    context 'when an option is missing' do
      context 'when the :namespace option is missing' do
        let(:options) { { metadata: true } }

        it_behaves_like 'no error is raised'
      end

      context 'when the :metadata option is missing' do
        let(:options) { { namespace: :namespace } }
        let(:expected_error) do
          'option :metadata value is invalid. A TrueClass/FalseClass was expected ' \
            "with the acceptable values [true, false] but '' " \
            '(NilClass) was received.'
        end

        it_behaves_like 'an error is raised'
      end
    end

    context 'when an option is invalid' do
      let(:options) { { bad_option: :bad_option_value } }
      let(:expected_error) do
        "One or more option keys were unrecognized. " \
          "[:metadata, :namespace] was expected but '[:bad_option]' was received."
      end

      it_behaves_like 'an error is raised'
    end

    context 'when an option value is invalid' do
      context 'with a bad namespace value' do
        let(:options) { { metadata: false, namespace: 1 } }
        let(:expected_error) do
          'option :namespace value is invalid. ' \
            "A Symbol was expected but '1' (Integer) was received."
        end

        it_behaves_like 'an error is raised'
      end

      context 'with a bad metadata value' do
        let(:options) { { metadata: :x, namespace: :namespace } }
        let(:expected_error) do
          'option :metadata value is invalid. A TrueClass/FalseClass was expected ' \
            "with the acceptable values [true, false] but 'x' (Symbol) was received."
        end

        it_behaves_like 'an error is raised'
      end
    end

    context 'when the options are valid' do
      context 'when the :namespace option is not present' do
        let(:options) { { metadata: true } }

        describe '#namespace?' do
          it 'return false' do
            expect(subject.namespace?).to be false
          end
        end
      end

      context 'when :namespace is present' do
        let(:options) { { metadata: true, namespace: :namespace } }

        describe '#namespace?' do
          it 'return true' do
            expect(subject.namespace?).to be_truthy
          end
        end
      end

      describe '#metadata?' do
        context 'when true' do
          let(:options) { { metadata: true, namespace: :namespace } }

          it 'returns true' do
            expect(subject.metadata?).to be_truthy
          end
        end

        context 'when false' do
          let(:options) { { metadata: false, namespace: :namespace } }

          it 'returns false' do
            expect(subject.metadata?).to eq false
          end
        end
      end
    end
  end

  describe '#with_defaults' do
    it 'does something awesome'
  end

  describe '#default' do
    subject { described_class.default }

    it 'returns the default options' do
      expect(subject).to eq MadFlatter::OptionsDefaultable::DEFAULT_OPTIONS
    end
  end
end
