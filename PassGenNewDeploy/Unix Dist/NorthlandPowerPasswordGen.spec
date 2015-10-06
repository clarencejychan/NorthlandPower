# -*- mode: python -*-
a = Analysis(['NorthlandPowerPasswordGen.py'],
             pathex=['/Users/Clarence/Documents/Coding Work/BatchScriptsNorthlandPower/NorthlandPower-BatchScripts/PassGenNewDeploy/Unix Dist'],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=None)
pyz = PYZ(a.pure)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='NorthlandPowerPasswordGen',
          debug=False,
          strip=None,
          upx=True,
          console=True )
