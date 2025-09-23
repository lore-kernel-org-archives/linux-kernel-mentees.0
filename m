Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765D5695
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758634264; cv=none; b=LDwB6eijOYvyC/pp8vsOAZoHZjKF9+oUJmLCZlCzfpOYjuAk2q4ALlaFN43JvbOLk7Fs8MJZFOcXRlD5Zl8byqYt9HTJOe2qzat8/cOT47syy4sIpscdOFAD9jxf7Ewq6neh2la19nhWxoOsHd1ooIGrhKBU6l1yz0o8wO532+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758634264; c=relaxed/simple;
	bh=8V7qNMYmqmW763GV+RmYh7nchonJ2A54SiLgvLE3h+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4o/VnBQkm0IcSeXj8V/PVZz1CCHe8NgJaTofYkzGVicbL15Z1f8W/cKbP5M3oAKWi5KexCKmP7T4U6J6t4p+GTbRHlBBKo28NoBBzLhFueA9B6P2nEg6X9qaxD9UG38Yxw36W7jji/ezHj+55ULjJf90XLHP3KY+macDGNuEk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0O39IKe; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0O39IKe"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F1B403B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN1DO_p4W5Yf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 13:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=deepak.sharma.472935@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BF0640062
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BF0640062
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D0O39IKe
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7BF0640062
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:31:01 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-77f32d99a97so2059818b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758634260; x=1759239060; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tRIuI240VxoL1i6yBF368B0vqwfoxg8/jQr7RxkgoA0=;
        b=D0O39IKeIBh7TU7ruLdDkfpuuUwr4PHXnZl4DcsVrIC3g/Mn2vPIKfyuNoEbbj9lxv
         Jk3YSnANEKPsW1SJcf16W+LIcJigRAsVmk6xXUUWOPdPN+mWij85z7gOYG+Ul8YEgqUx
         ujwAOQuTiqo+TDXv7DjcY5C5W4i+DHb0kJrRJp4l9fc1+8jKmxo0rMAymrjHq2vM8iNt
         N+V4kxAbiMhctiouZbkfohLTfWUStdtg1v3GOHblia1+Ab5rpf5+7dlv0Wv+CUjFm13r
         1mRTuNFDmY1Nif8JWopQIj0YO4YcYExvxQRnJTJYH/SzgMSq16lpgTzDWZADUY6gLDSt
         sKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758634260; x=1759239060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRIuI240VxoL1i6yBF368B0vqwfoxg8/jQr7RxkgoA0=;
        b=ScjCVmzhvABUTZTIK7QJiAJJKiI3+SoMofcJpFQ6EHgHKE43FG+0VJFUkiwjl6yD9f
         CfEpKaiUDsY9Qe6N8j4YTMjjsC7NSLHI5Y0CnpY9PlaVkCvayTi0x4qkLq+bJij6o8Kl
         oygTMvFGSZ6mwsM+0DFAgj/GlHjMhjDh6J9kMrMtQVL355iXqOS4pVa5bG1Fosp+f6KQ
         RZWKKfVGH1OTvEqA2Z4WAvQYBwfA86/hNbXdD/a7e8Ezf5Cgs7mv/k0Hl1deArHyJ6cO
         dJgtb3ZYFtrdPs56q1LyEaeMTMheuGGGWUOTZZAYDl+CYmh1l0bkq+MvlmIf/gRx6fFw
         PwzA==
X-Gm-Message-State: AOJu0YyjZZgi7l4iPse0IcXrFj+9zYIgA5nekB+oRgQBvcndIvTi+Aaf
	wfdq1jQJNpSfFGukJZfexlvNbMQM+jDm1aEiN3Y7L7Jpowk21w2qL5C/
X-Gm-Gg: ASbGncvzUmkknEvnia0ZdZuOXDNZWH/sSvi795hWBqwfA/Sos2Cox67LeUyMYI1tGUj
	ikRXo39T6cz75MoYSBfpO57PICbGkIho1zvbF8NhTvhbnusvSkAszPva4lHeJraD3UewzrMM043
	bVejr5pf0METP4An0O2EhwGGSvxkBUkeDbyz/pBh7Qy5bEAniPa7KC3YbA5bkkKHz4fWWry1rCQ
	aHB9RPxvSNE3g5LMMyJovFw70hnbOqYfwN0/v6Iyz33eLaSGnqRDeqIG57wf6iUAcsCi33UHUxK
	5SRFfny7s4vrxvLV0RpLC4nR79K3GqvcUTjJe//VmXCCpwjE4G8lfo4gerks3+YN0fLgkAtVLoY
	pxS8rRIPiDode1S+OWB43bOGAUFPvpfdQ46RVzU8=
X-Google-Smtp-Source: AGHT+IFJU7OGiOiz8smnOuMe/qag1APECoApgXHtPS4DEvj2kDTQsLgjHsYgepGdrf3ZesppDGlA3w==
X-Received: by 2002:a05:6a00:b4c:b0:777:b207:47b2 with SMTP id d2e1a72fcca58-77f53865e65mr3184350b3a.2.1758634260135;
        Tue, 23 Sep 2025 06:31:00 -0700 (PDT)
Received: from cortexauth ([2402:e280:2313:10b:d917:bfec:531b:9193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f315254edsm6751579b3a.84.2025.09.23.06.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 06:30:59 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: david.hunter.linux@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Subject: [PATCH] Fix the cleanup on alloc_mpc failure in atm_mpoa_mpoad_attach
Date: Tue, 23 Sep 2025 18:58:59 +0530
Message-ID: <20250923132859.74470-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a warning at `add_timer`, which is called from the
`atm_mpoa_mpoad_attach` function

The reason for this warning is that in the allocation failure by `alloc_mpc`,
there is lack of proper cleanup. And in the event that ATMMPC_CTRL ioctl is
called on to again, it will lead to the attempt of starting an already 
started timer from the previous ioctl call

Do a `timer_delete` before returning from the `alloc_mpc` failure

Reported-by: syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=07b635b9c111c566af8b
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 net/atm/mpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/atm/mpc.c b/net/atm/mpc.c
index f6b447bba329..cd3295c3c480 100644
--- a/net/atm/mpc.c
+++ b/net/atm/mpc.c
@@ -814,7 +814,10 @@ static int atm_mpoa_mpoad_attach(struct atm_vcc *vcc, int arg)
 		dprintk("allocating new mpc for itf %d\n", arg);
 		mpc = alloc_mpc();
 		if (mpc == NULL)
+		{
+			timer_delete(&mpc_timer);
 			return -ENOMEM;
+		}
 		mpc->dev_num = arg;
 		mpc->dev = find_lec_by_itfnum(arg);
 					/* NULL if there was no lec */
-- 
2.51.0

