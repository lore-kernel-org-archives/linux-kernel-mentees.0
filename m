Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2014F334715
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705600; cv=none; b=cxbClKMpKTLZSD0YZto8c48btXq2LTWpb09NJta2I9g702bGgz3yAaRaI0mdMzY/oq5HguPVoVduolQJpBZG0bPONVH2yoGkz6WZ72pYXwcLZT6MlrA3gmmy83DlR9nvTvNtjWbjO6jACyGZtgB8Sjto4n/IUXjP2chflPpv7mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705600; c=relaxed/simple;
	bh=nIypl1ykODERwxC+sJ9vhNg0TKnMww6pPFYnDB3p4Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uDcsGJCBQrNCEWB5RiDREKSiSlmIjXBy7wTSxmZOueZVelPqYJcKkOsq7rBdiMDo+b9DNcgpK8e+repJw2MB4+09vmhYTDHuCaS83Of9AFm2taHgVyIAD+BiegWIpm1uyP08ulb0uYqW5XNUsidDwgF92d+yO4Ua4B+MNNI8OSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjMKphmI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjMKphmI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78e70c5so4173266b.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755705596; x=1756310396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/kD6SDXu00rWD2E4zF7s0LVKDHyHggVTHrfvP7QIfM=;
        b=QjMKphmIqsJMaJHcls5MWgWmA6PAeF5XH0HQKU8ZvVplN8nD1wMyD0qTTnkwVvmJps
         kfRwd9nnq6DEGwuI8HwG6tyQ1w503NUbnmlt5mzCVVEoVqZTqxdluqAyguThyhnx2BPP
         rRLvHr56uVhVf8f/a7sr/PDCLEoecx6EYAvtoArqzgB4Ss9CwKBb85CxD3WfCvNH5E/V
         Rottwzun5LK6BL6YIJ7loMpHSXXt5+l5Z+ZyePqXYoyrUPQ+EEZfM7lH6brSUMIaeLEZ
         eaGAKOv+sk7ZOKVC3fF1/L1aF4Tnk9m8vhIBKruRRPIwB+SSlis/k5ow5R9mKAXnvWGJ
         1dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705596; x=1756310396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/kD6SDXu00rWD2E4zF7s0LVKDHyHggVTHrfvP7QIfM=;
        b=WKCst7/7K5paJQAi+9wBugKdMlNRjOEYw/0+gqsq+o/kM0oZyRt+vH98Z1t+sZRTRG
         /6v1ubeBiQ6yjMMHgtlKV7N+rgnZ31vylRFDvsVXPAj2p74n46fepzpx9zEvUG29QgKs
         TAVO3qhfSyBZW/XVFg688L44ivLzcXI+N9RJ59oK19k7UzxmeOoBrNMuaFqSYmHAgOd1
         xHayHxbMeTvEq14OcOf4ZvK5n0W922vNquPGg41Z4vT1CorilsifRX2M+resIJqukueT
         RIROqEqgBv2I0UfEX8jSY2+F6N91GaUtt8QrdT5RfZPWmQw99g7C39onx/j0HXSEhhHW
         cG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYk8099X+QvW4Haxtp6a2X+CGD47UrhFPQxKoAYzYOn8cLIo6exfTREqfS1x007oNIYMHHI0uK3tF27hkbjjauVN5OqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf9G1tSG0jy8NQk1DzhA/V0DPaUTV8N8sc19HqKbY7CHZ51/na
	qRQGAb77//Do1+TEdNhFjZw/x2Dj0IIkDP6f9Fa92xKER2d7qGWQqIQs
X-Gm-Gg: ASbGncuQ9yVoFQhK38mviD5nlrCPLT7i7fg4nDTFsNoNxRrThIILRr4OccSS7HmtmYi
	IwY+QxC0aCyrDYXNFmOC3BB4fjex+Fevuj9DdhITm+GJJbkrnxiKz06sXan80UQik6wAFTN5dzZ
	3+Cco0pa6btRkybJGnFSe0p9EKk/Tl5tvkG5pYS0oagNbaZNomJU9XCcfpI1/F46+HhiSA87/Yx
	2eGt/U1sRDYQAR2MpFNfOi0PFshzuQeuQqIkxdObBMITB5lUJ54yoVnfAg5p/VdAnjGC/T1sftd
	YxWit1EP7EhtdTL0bRV1lnkbcp4+98NfqXRL0hUxxuTPExLpYQpipiMtRgqYk74k9n4dfhpIlJP
	wKhhtsxpg+LF/n1PIvuSFZ5UFq9PH
X-Google-Smtp-Source: AGHT+IH9aBKzJZPrEV7YyFfECG8WNpeoRRWd+CwdR5R3M8ebRmWchAAgVtuOQEsWT5L/zd16l3z4uA==
X-Received: by 2002:a17:907:6d04:b0:afc:d209:37f2 with SMTP id a640c23a62f3a-afdf0284ebdmr270162966b.61.1755705596334;
        Wed, 20 Aug 2025 08:59:56 -0700 (PDT)
Received: from vagrant.. ([31.223.98.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2ba596sm200912566b.8.2025.08.20.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:59:56 -0700 (PDT)
From: Alperen Aksu <aksulperen@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Alperen Aksu <aksulperen@gmail.com>
Subject: [PATCH] Documentation/wmi: Fix Typo Error in doc
Date: Wed, 20 Aug 2025 15:58:35 +0000
Message-ID: <20250820155904.32685-2-aksulperen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix to correct spelling of "Hardware"

Signed-off-by: Alperen Aksu <aksulperen@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 997263e51a7d..24b027362e93 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -126,7 +126,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Description("return code")] UINT32 Data);
     [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, Description("return code")] UINT32 Data);
     [WmiMethodId(67), Implemented, Description("Is changed Y log")] void IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
-    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
+    [WmiMethodId(68), Implemented, Description("Get DGPU Hardware ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
   };
 
   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C628FBD2}")]
-- 
2.43.0

