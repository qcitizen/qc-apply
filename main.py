def compress(message: str) -> str:
    """Compress an alphanumeric  by collapsing consecutive values.

    Args:
        message: The message to compress

    Returns:
        str: The compressed message

    >>> compress('aaabccccdd')
    a3bc4d2
    >>> compress('aaaaaffffffffffc')
    a5f10c
    """
    pass
