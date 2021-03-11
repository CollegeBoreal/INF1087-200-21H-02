from manager import Manager

manager = Manager()

@manager.command
def echo(text, capitalyze=False):
    """print the given <name>"""
    if capitalyze:
        text = text.upper()
    return text

if __name__ == '__main__':
    manager.main()
