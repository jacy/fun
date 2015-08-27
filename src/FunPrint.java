public calss FunPrint{
	public static void main(String[] args) {
		Integer[][] source = new Integer[][] { { 1, 2, 3, 4, 5 }, { 6, 7, 8, 9, 10 }, { 11, 12, 13, 14, 15 }, { 16, 17, 18, 19, 20 }, { 21, 22, 23, 24, 25 } };
		for (int i = source.length - 1; i > -1 * source.length; i--) {
			for (int j = 0, step = 0; j < source.length; j++, step++) {
				if ((i + step < source.length) && (i + step) >= 0) {
					System.out.print(source[j][i + step] + " ");
				}
			}
			System.out.println();
		}
	}
}
