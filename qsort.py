def qsort(nums):
	if nums == []:
		return []
	elif len(nums) == 1:
		return nums
	else:
		return (qsort([i for i in nums[1:] if i<nums[0]]) \
			+ [nums[0]] \
			+ qsort([i for i in nums[1:] if i > nums[0]]))

def test():
	import random

	randnums = random.sample(range(20), 8)
	return qsort(randnums)
