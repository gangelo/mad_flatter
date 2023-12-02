# frozen_string_literal: true

RSpec.describe MadFlatter::Service do
  subject(:service) do
    described_class.new(options: options)
  end

  let(:options) { nil }

  describe '#initialize' do
    context 'when the options argument is nil' do
      it_behaves_like 'no error is raised'

      it 'uses the default options' do
        expected_options = MadFlatter::Options.with_defaults(options)
        expect(subject.options).to eq expected_options
      end
    end

    context 'when passing invalid options' do
      context 'when options is not a Hash' do
        let(:options) { :not_a_hash }
        let(:expected_error) { "options (#{options.class}) is not a Hash" }

        it_behaves_like 'an error is raised'
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
          let(:options) { { namespace: 1 } }
          let(:expected_error) do
            'option :namespace value is invalid. ' \
              "A Symbol was expected but '1' (Integer) was received."
          end

          it_behaves_like 'an error is raised'
        end

        context 'with a bad metadata value' do
          let(:options) { { metadata: :x } }
          let(:expected_error) do
            'option :metadata value is invalid. A TrueClass/FalseClass was expected ' \
              "with the acceptable values [true, false] but 'x' (Symbol) was received."
          end

          it_behaves_like 'an error is raised'
        end
      end
    end
  end

  describe '#execute' do
    subject(:service) do
      described_class.new
    end

    context 'when options are passed to #initialize' do
      subject(:service) do
        described_class.new(options: options)
      end

      context 'and options are passed to #execute' do
        let(:hash) { { a: { b: { c: :abc } } } }
        let(:options) { { metadata: true } }

        it 'the options passed to #initialize are used' do
          expected_hash = {
            a_b_c: {
              metadata: {
                dig: [:a, :b],
                key: :c
              },
              value: :abc
            }
          }
          expect(subject.execute(hash: hash, options: options)).to \
            eq expected_hash
        end

        it 'the options passed to #execute override the options passed to the #initialize' do
          new_options = { metadata: false }
          expect(subject.execute(hash: hash, options: new_options)).to \
            eq({ a_b_c: :abc })
        end
      end
    end

    context 'when no options are passed' do
      let(:hash) { { a: { b: { c: :abc } } } }
      let (:options) { nil }

      it 'uses the default options' do
        expected_options = MadFlatter::Options.with_defaults(options)
        subject.execute(hash: hash, options: options)
        expect(subject.options).to eq expected_options
      end
    end
  end
end
