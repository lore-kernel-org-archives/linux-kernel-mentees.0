Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E619755B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 23:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739746944; cv=none; b=EXO74QORBT6VzTwdXIDI2jkpd4nUDRXOZI67izL4B/WJnN7ovq7FjbiaCA1bSQ/SY39gAfAz/mF/eFZQUMQELdGX2PKu3D4aHVuJmUWO8heb3lNDPkZ5fdfVp6xdaL1G0XkRUVkEvHDD9g/wYW3NpONPL2pX+p63AMQdTEJbSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739746944; c=relaxed/simple;
	bh=xiWjpdFF9XPpfEzPoyR7xsudrR7wH3BjMki1l9XEEus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sb2m30USZ6SUkPWOeQSVQhz7DBmPyjkKDF7GupCUQLZMGKNmZifq35lOwdLd98uE6UKFGO+eVKimHglWmGiPwrsoH2igO0g5QyHk1uKKgClOKQwo+6rNw5P1ev7+fjul9mBTfahZkVcPQnGPjM7WmrIVfMDugHUe2hDHtFQDNJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt0VqnOd; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt0VqnOd"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22121403F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 23:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXZoOHJ2A3Rm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2025 23:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A68B40236
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A68B40236
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tt0VqnOd
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2A68B40236
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 23:02:22 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso1295236a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 15:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739746940; x=1740351740; darn=lists.linuxfoundation.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pULEHnKU9mg3MmXXhbc40zoqPwIpVwyHncuHvzBebGo=;
        b=Tt0VqnOdAQQjs2i0mIxHnBjwwrBYdzk9Bya1MQaGnCtr1itIAbuTgqHB72wmoAWeXE
         9Vrcfw8uMD4sDIbqhOE5302bUhosHDnOZrakm8OKJewBYL4QX7AVPkhv1CLNoWnz62B1
         uhWlFWFqWClIFohSsGVETsCkCzcRXps7uUjvFqFU0Bt0DFn8HnbILWNRIZAosQVNHFfa
         RlIagIygF9jCwOnBZVTGFnWL+oiUPWERFjA3Uv3vQaE1Yw/E3FzzEXr4DjJ6NGLikNuA
         iAGQemCX6YM1P2Vs+WY5VGFjsDD2GCYP58/LGMsawRCB0DpbcYHHEKdZrmTM/6jTvmhf
         Zthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739746940; x=1740351740;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pULEHnKU9mg3MmXXhbc40zoqPwIpVwyHncuHvzBebGo=;
        b=vMq2jCBhvpibb8wF1i8A/OrqmUMpqVE/xU18GW6CICYopJdy95iZFy7vY9KGRvNBkJ
         3/Vytj/x6+CRrNI92ljjLiCwvuUVw/rq9C5NBAi/zrQUfujwMYWJX4PkGp6QTnpcgS4a
         4Iyd63qTNOjtq5krMOhM8xs77OwbRdMEZ2FFjW6/Ls8LbH4BE9NUp2xkEcbDzgaVSqGf
         fCxrNWBG8ZQPEgLTcoK+TE5ugxOCNoHpEezAs/pq4w0TWlQQo+PPis3T01W55X+CgkGF
         BCTjucpvFhZMo/5+KaZQmWlFvgL5GiE1W8yT6G8ipNZ2Ci2p0Gww4EZn8XCKH0eaBj3Z
         sUxw==
X-Forwarded-Encrypted: i=1; AJvYcCXzdtcg9zkIL36nFBBR1xU9TDRAql1j1NT7gAOJaLmv/xkX7oDJjmbIgdGjnWtqsjOIRGOpUR5Hpn5hBgAfV/9CwhIgpA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx/kuAwVN59G1iqwxAahWGPxlp2pSErUn+VAIGmS9vGME2s1Blc
	P57hDGXf+UNGfJ0NICPVbeReXyBUzlir4wy7+s1r9DxoGY5gq0TK
X-Gm-Gg: ASbGnctFbx2UcEoiSAoC44zep0sk6X6HAveQLrnSwpUNKtkBdBZOIOItB+apBlFsD9k
	w5f2LLwDfn+zRoKCUK5KJGyuk8uQKKZl+9tgohl81bs+LG/zi/gD90DmGAtDfu0h2hau5GcPGIq
	ep6h+vQZImWWZXVw5Sisud2nsWHAqrfuT7keOIlLj2hRmf7QFY4tjVlql7GD6bKFF6fcEjkLQuv
	p4x9TDJwDx5bM3R6cVYJ0u5osssIca0JVQprTDL207+QuXURfE4HMvZwZm8/0Hua0eCAu31Xkp4
	njv2DXxgOi1e9iR+7TrMZauv2pa6MDYk9Dv7iQ41L6wE0i0kv7BrH8vXzaDwlzhyET0=
X-Google-Smtp-Source: AGHT+IEDhflJ8TI3JTu/3Qpma6Hf+3TN6GhltgTMaA6tvwex9j7VHTgILpfAos4CWIbCjd0k46sSLw==
X-Received: by 2002:a17:907:6d17:b0:ab6:df79:f577 with SMTP id a640c23a62f3a-abb7092f7bcmr701221266b.9.1739746939745;
        Sun, 16 Feb 2025 15:02:19 -0800 (PST)
Received: from localhost (tor-exit-38.for-privacy.net. [185.220.101.38])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb86c9320csm264451866b.55.2025.02.16.15.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 15:02:19 -0800 (PST)
Date: Mon, 17 Feb 2025 01:02:11 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Documentation: ABI: sysfs-class-tpm: Fix typo
Message-ID: <z45phn5t6hecgnxxoiujjxrhui4lctdnreryftlguuf3w4nmf2@wr7chdte6ip5>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix typo in sysfs-class-tpm's Documentation.

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---
 Documentation/ABI/stable/sysfs-class-tpm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-class-tpm b/Documentation/ABI/stable/sysfs-class-tpm
index 411d5895bed4..272a63213934 100644
--- a/Documentation/ABI/stable/sysfs-class-tpm
+++ b/Documentation/ABI/stable/sysfs-class-tpm
@@ -115,7 +115,7 @@ Description:	The "pubek" property will return the TPM's public endorsement
 		is version 1.2, the pubek will not be available without the
 		owner's authorization. Since the TPM driver doesn't store any
 		secrets, it can't authorize its own request for the pubek,
-		making it unaccessible. The public endorsement key is gener-
+		making it inaccessible. The public endorsement key is gener-
 		ated at TPM manufacture time and exists for the life of the
 		chip.
 
-- 
2.47.2

