function nms(hypotheses, threshold):
    sorted = sort(hypotheses.values, key=hypotheses.scores)
    result = []
    for first in sorted:
        result.join(first)
        without_first = sorted / first
        for second in without_first:
            if IoU(first, second) > threshold:
                 sorted.remove(second)
    return result