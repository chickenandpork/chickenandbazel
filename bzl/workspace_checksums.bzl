shasums = {
    "ibazel": {
        "0.13.1": { "shasum": "a46d89eef5ad54890366621f3c94d70b891fd1fa24e7e60e0298191e488d07aa" },

        "0.15.0": {
            "commit": "baddb5bb4f189aaf19cd66e6117bd82bf9ad6ce1",
            "shallow_since": "1612573069 -0700",
	    "shasum": "e0d2ab8b8ff4c75c171a0cf11207d601a81a0351fcc4b64191763d99dad7901d",
	}
    },
    "bazelisk": {
        "1.5.0": "53c1c3b0f5b5c6b8e57ef2419a2ffb36a43ca361466033516fdfdbc1a24e1967",
        "1.7.5": {
            "commit": "089a39a3f896a43e759e0b494e4acfe2982aca7e",
            "shallow_since": "1613003520 +0100",
            "shasum": "c0eb71540aa6b9eece7f3d36d5857adb73e7cd92c496028ef8d1c3a4f9f23d60",
	}
    },
}


def versions():
    # max will fall apart here when the semver versions are no longer strcmp() compared
    return { k:max(v.keys()) for k,v in shasums.items() }

