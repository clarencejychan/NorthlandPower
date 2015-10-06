# -*- mode: python -*-

block_cipher = None


a = Analysis(['NorthlandPowerPasswordGen.py'],
             pathex=['c:\\Users\\cchan\\Desktop\\HardwarePass'],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=None,
             excludes=None,
             cipher=block_cipher)
pyz = PYZ(a.pure,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='NorthlandPowerPasswordGen.exe',
          debug=False,
          strip=None,
          upx=True,
          console=True )
