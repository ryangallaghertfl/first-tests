require 'task_tracker'

 RSpec.describe 'task_tracker method' do
     context 'given a string' do
         it 'returns true' do
             result = task_tracker('#TODO')
             expect(result).to eq true 
         end
     end

     context 'given an empty string' do
         it 'returns false' do
             result = task_tracker('')
             expect(result).to eq false
         end
     end

     context 'given an argument with no #' do 
         it 'returns false' do 
             result = task_tracker('TODO')
             expect(result).to eq false
         end
     end

     context 'given an argument with lowercase letters' do 
         it 'returns false' do
             result = task_tracker('#todo')
             expect(result).to eq false 
         end
     end

     context 'given a string containing #TODO' do
         it 'returns true' do
             result = task_tracker('This is my #TODO list')
             expect(result).to eq true 
         end
     end

     context 'given a argument containing integer 0 instead of letter O' do
         it 'returns false' do 
             result = task_tracker('This is my #T0D0 list')
             expect(result).to eq false
         end
     end
    end