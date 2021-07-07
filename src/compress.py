class CompressString:
	def __init__(self, string='', letter=None, compression='', count=0):
		self.string = string
		self.compression = compression
		self.letter = letter
		self.count = count
	
	def _is_letter(self):
		return self.letter.isalpha()
	
	def _is_previous_letter_same(self):
		if self.compression == '':
			return False
		prev_letter = self.compression[-1]
		return prev_letter == self.letter
	
	def _add_letter(self):
		self.compression += self.letter
	
	def _add_count(self):
		self.compression += str(self.count)
	
	def _increment_count(self):
		self.count += 1
	
	def _reset_count(self):
		self.count = 0
	
	def compress(self):
		for char in self.string:
			self.letter = char
			# If we have a letter
			if self._is_letter():
				# If current letter is not same as previous
				if not self._is_previous_letter_same():
					# If frequency of current letter is more than 1 add the number
					if self.count > 1:
						self._add_count()
					self._reset_count()
					self._add_letter()
					self._increment_count()
				# If current letter is same as previous letter
				elif self._is_previous_letter_same():
					self._increment_count()
		# Add last count for last letter if its more than 1
		if self.count > 1:
			self._add_count()
		return self.compression
