import json

skippedKeywords = set(['&', '&&', 'and', '|', '||', 'or', 'not', '(', ')', '=', '==', '<', '<=', '>', '>=', '+', '-', '*', '/', '%'])

class ActionContainer():
    def __init__(self, **kwargs):
        if 'specId' in kwargs:
            self.specId = kwargs['specId']
        else:
            self.specId = 'unknown'

        if 'className' in kwargs:
            self.className = kwargs['className']
        else:
            self.className = 'unknown'

        self.lists = {}
        self.keywords = []

    def __repr__(self):
        exported = {'specId': self.specId, 'className': self.className, 'lists': self.lists, 'keywords': sorted(set(self.keywords))}
        return json.dumps(exported, sort_keys=True, indent=4, separators=(',', ': '))

    def AddEntry(self, actionList, action):
        if not actionList in self.lists:
            self.lists[actionList] = []
        self.lists[actionList].append(action)

    def AddKeyword(self, keyword):
        self.keywords.append(keyword)

    def Render(self):
        s = ""

        s = s + "-- keywords: {specId}\n".format(specId=self.specId)
        for kw in sorted(self.keywords):
            s = s + "---- {kw}\n".format(kw=kw)
        s = s + "\n"

        s = s + "internal.actions['{specId}'] = {{\n".format(specId=self.specId)
        for listName in sorted(self.lists.keys()):
            s = s + ("  "*1) + listName + " = {\n"
            for action in self.lists[listName]:
                s = s + ("  "*2) + "{\n"
                for key in sorted(action.keys()):
                    if isinstance(action[key], str):
                        s = s + ("  "*3) + "{key} = '{value}',\n".format(key = key, value = action[key])
                    elif isinstance(action[key], list):
                        actionKeywords = set()
                        for kw in sorted(set(action[key])):
                            if not kw in skippedKeywords:
                                actionKeywords.add(kw)
                        if len(actionKeywords) > 0:
                            s = s + ("  "*3) + "{key} = {{\n".format(key = key)
                            for kw in sorted(actionKeywords):
                                s = s + ("  "*4) + "'{value}',\n".format(value = kw)
                            s = s + ("  "*3) + "},\n"
                    else:
                        s = s + ("  "*3) + "{key} = nil, -- not a string or a table\n".format(key = key)
                s = s + ("  "*2) + "},\n"
            s = s + ("  "*1) + "},\n"
        s = s + "}\n"
        return s
