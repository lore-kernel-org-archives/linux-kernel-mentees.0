Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BDB466B7B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 May 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521397; cv=none; b=XSt44exdmkqvLwCX8CNq2YY1id1MBqbUPZzXUfEafneZ3O9OEjiebHGv/3UXBNpuZCpa4p5uRq+g+/eq7+kNBFEQpPDeY3Ld6XKNw8rwLNQcLZp5hAJ13ex/A6/fQcN+b9yu3PQMwsegn+VE9NC1VO6qnZo8hbZ4FTcX9sZQHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521397; c=relaxed/simple;
	bh=CArFcwjTin5095cozOfSePPZOWMOInw10+50zRtmwNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbN/S6Dv36OgAJ7CzSg2YdvkxeHi2vcDOVK/yFFBq2Z5HxEQNTFYeBYg2Be/dVUN263DNq22Lac6YBeWRBV+Cwo/pQuVNQoh0r8c0uyPCfBAe7Xp+wgb3Qs8Xn8xqoiN8LN+crizftNbomBU+ngCMRxbcqj9tY82OxuKx6KRCsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTUZq0Zm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTUZq0Zm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f8b60e485so2153335b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 May 2026 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521395; x=1779126195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ7LCTa9KTtIJAgxRtdGfVpbgkOkteisYlLfo08fBPc=;
        b=LTUZq0ZmxFfmKE3lRopgOl+fkzLKvIurZcQoKCJIj3V6uGIofHoSTGeLSJ5erqedzD
         4iJsHJUmdu/j8C4S/B38kB/IhBzk5f21kXnYlGZCbBHilIQ2Jlj72WLcVU5VeSxuqA9a
         dhsaYXe2swcwm03Qrni3y9deRCp0MF3D1OTZ46hzSUoRVJ0i03+H+6Pa0EyTZBr8MsZ9
         l98wui3dV2wRsQNIDCsIIDBWG/BuaGszaHAjgg1M1y+GuhpkqjU2yDUyCALmRhByG8QH
         go2T82d2JHy0WkfJwn/tqBgBaSLIiafaW5KRRzwbiIjG3phRrEcOFPrs9JTKKN60Nj6n
         Nr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521395; x=1779126195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ7LCTa9KTtIJAgxRtdGfVpbgkOkteisYlLfo08fBPc=;
        b=ArwRbfU8bsRnlNybWyKm3ejUvWzaM1MZkMsqMJ7cVzsCbEAzrJs6Jot+842TPKWzfQ
         ZrC8tb8nPhTBICeJovMB7fpQen/NJOgwm3IKl2GGS2P0Q9rAsllcgw+TPBgzlZcAZhiN
         LeYxLQdUL6ZzvFYo8BGsf+ClcpK9oY9dwQy4g7SA5SYem2en2qpEZF+3ChFpvRhMXRvB
         Xhgk2fdIj+VtyM1v4tcBH3KE94QvdsyxHcXqWgalVmkrk6Z1ONO+heJ+u7bY+I6a+flz
         Oy9yFAzaJGirA4H4KWoGaVjRdrtG5r3cJ8jfcuy++80b6zuyE7ihvHHlB9jnfa0H33v7
         TBRw==
X-Forwarded-Encrypted: i=1; AFNElJ///PnyKK5rFGKCZG74Yh0BfxErer5AufWBcK3ljsQnM5KnH07ffRl4kS2h3E6vitIdcNFM6r21zEZOa4SZjVIOJKLd+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYpwaD/go5ww5X16erA8QwDw8FSptzdZMHlWK68fOyNEDKra4b
	MSr0K/ONIAZJZabzZcD36paSOslOzwliVlW/r4vaQjCp9bFZWwwEdMSc
X-Gm-Gg: Acq92OHqrDom3d+D6Vt/ZDCzBcAi7+JTmOO24yVrRqgfyYAEeeHPbXjbXmN2xG/g6ea
	EZxJ6VrYm8snBDr03jweXmrN2aEeHSukHVAGKwGUZbDtvu6p8qVsqzwblG7BdaqdY8HtkShqkEx
	MLkgDFuUC6jOiXYuS15DUmaquuwFn7uZ6hgeyN7SxkvlAVHM5rYISI+uPWmiCq20+oy55ylSL0r
	iQLXd83v4XAVj3JMUFMrR7YjOC+MvSjA+uWU9GdN9GoocktNjBksoL3FUIHvLOjeSMSGbDiTED/
	/3FMxM9xHHj8GErNIQFoiOjWOHtg6WWXImQmRjGn1aQphtyZiEWJZ8ymnEoW1nAO+R0oBl/7Qzw
	SD966YMCZNi3inL76Jnl85iHtLxdCZpxQCnWnC8GpGYHwEazbjvjANAku9peQrXyaUgfz0WEf88
	yMeSL1rp+GvhL5iVM2WSVIYDjlmHtstU12wm6QE2TwmUqC9KmTLBUIf/P3ucDaKarPryNuPi2SP
	hl1Bg4=
X-Received: by 2002:a05:6a00:1f13:b0:835:a682:a6d7 with SMTP id d2e1a72fcca58-83cf4f75f4amr14356959b3a.4.1778521395343;
        Mon, 11 May 2026 10:43:15 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d34872sm21398723b3a.22.2026.05.11.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:43:14 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: pbonzini@redhat.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	seanjc@google.com,
	michael.roth@amd.com,
	liam.merwick@oracle.com,
	vannapurve@google.com
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: kvm: update links in the references section of AMD Memory Encryption
Date: Mon, 11 May 2026 23:13:02 +0530
Message-ID: <20260511174302.811918-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace non-working links in the reference section with the working ones.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/virt/kvm/x86/amd-memory-encryption.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
index b2395dd4769d..bd04a908a8db 100644
--- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
@@ -656,8 +656,8 @@ References
 See [white-paper]_, [api-spec]_, [amd-apm]_, [kvm-forum]_, and [snp-fw-abi]_
 for more info.
 
-.. [white-paper] https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
-.. [api-spec] https://support.amd.com/TechDocs/55766_SEV-KM_API_Specification.pdf
-.. [amd-apm] https://support.amd.com/TechDocs/24593.pdf (section 15.34)
+.. [white-paper] https://docs.amd.com/v/u/en-US/memory-encryption-white-paper
+.. [api-spec] https://docs.amd.com/v/u/en-US/55766_PUB_3.24_SEV_API
+.. [amd-apm] https://docs.amd.com/v/u/en-US/24593_3.44_APM_Vol2 (section 15.34)
 .. [kvm-forum]  https://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
-.. [snp-fw-abi] https://www.amd.com/system/files/TechDocs/56860.pdf
+.. [snp-fw-abi] https://www.amd.com/content/dam/amd/en/documents/developer/56860.pdf
-- 
2.54.0

