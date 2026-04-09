Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5F83B6BE8
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742674; cv=none; b=LhM9bvD5qmtzFBECk+wLwYFVHRA8P2phfi6wRnvRUVgqIHm1HnhJZU5MAk8JpkN45iccAmNRUKWt82TyWIZiD1u1hBwoCBMicqRkbrlQUv8jGt7gsnAUg/aeCix7+N4XrIVI+8Rm76wXqBBMu6DqXVeIHt36SJyd0Xl/pFgjJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742674; c=relaxed/simple;
	bh=1LwJM37Q7NKIw50Cf3+KN9/jRGOQih8ktE+fD8cOp2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NQ2B4qKerK+VR0DiUPPCqgiI8GWr2qnJo2AUzRe0ZaWyS0X2hN79cKcW9y4Paa3zztG5STEcPXxKdQ5toOuQEpnGukTIZ6rm5BPwj6HpchUn58PJ/Y/TTHq6WGmeDEfY9ukptJiPYtMef5jCKl2kGEfQ+emvMSkMBg+R+YcnrlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0Z/GaaN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0Z/GaaN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b24fede2acso5358055ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 09 Apr 2026 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742673; x=1776347473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIQUUz8HJK10CN2cyTrf7XlnfenCpDOYTcZ2fDMqU78=;
        b=F0Z/GaaNotuOmx8b3XBxKW74z1l9zuZbmN6T3M6TO2pDzIOsk+trvI5ZQvKBNFIZ6t
         fgMvLufKmBtKu8wQEAwTDB520hULuniTPgBmVPIsu243taKCcizRcyYzNrjIyL5MgyLf
         CSBPLC/W/Ic6KN8tgVWqz3rWv44RTF3ZE8rH1tDA9iIoYfvVpGbdOoB5qiXKDnkM1bJt
         tHfLi/3gM9phj5uiX07pMiH7plucCVez6nRPGdDV1HWX1jQS2jp2TYbMn+mUshg3Vy+q
         o9tMaEnYmJAhLcrmVUnZjT0IYuNZWEyHKc/B4NFfJWcqRso8GbHk20Ik/8bLTmYtzLsA
         RLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742673; x=1776347473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uIQUUz8HJK10CN2cyTrf7XlnfenCpDOYTcZ2fDMqU78=;
        b=W2A+Hc38eAgdoeTYsgad4TqUxBe0NE++oOrvbDkWhRKHI/9Kd4FQNATNKDMFGPWkQX
         hqeSvsQzDN3iKfKefUUSlUpiotggtX8rPYXPx3erHBE+SLt835liQMrEk7NuFrczgvNk
         Nilsq9PPltqORlGcZGCsAA5q6nDGEty0KhlrPXnWrE3KJ+1L7KE8uDYyHQ++OJ91L6XE
         mY4omKPzFoVwfl8zh2+dgnaH7/7rXQqpxWdgzKKGeiPw9SrvixNgTtYYhNQ9Mltfg3C4
         2GN4GqAvvIz0Yie6aFzBC1EvsG/BcXW/79zZJzadrXfHjnMPr3laQLfjia/aZS5BfB+T
         EvQg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2QYL3nrVb93hE0zp2fSUWF3XwGQ81iIAub7oZ5MqLBpD1d9H3gMLI7dn7/WCJmUUisa5d3lAyZ7owQJQsVHaHBqgIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFyL2yDSarLJitgrnA1ICekN+vEuu2JOiEEqwxuWVsqNJVhnS8
	pEHR7V4pCRLxFpE8WBVhs4ZXaQWYa0X2hz6KX5cx8KFUxVYCplPa3glj
X-Gm-Gg: AeBDievi5z+oZ1rJ5S6flTFY0C29kiC9pwvMJwZGlDsrFMl9xQVI7jee+0cc+EBDi5o
	2X37eTmXEPl1gM91xHKK5fvx6g9+lXxWKbNMfhYFXzxvuYvoDeSg9ZZmzP2k0Iwr4xMEc+5VqaC
	jTyYLXMQ3tq6bRCE5VzQyRKI/AughaVsg5cbygMMd5Ym/5ee0Jn+FRBfa+iKZWZNR3mSv3xpSG/
	K0UBh1gpgbiTTYJu2CXPhN7HRbK2OBmhU+EhlTFvk/3JsaINSxEFWY5wsvEJLptParve6IG0UOS
	n2TMxEbHcHiU6cVZCqC5mfxk7BmzlIPBugk10T8beosaWFfDEm1UfQXaZk/tmiYstSDXkQahccm
	FuX5zo10lj7anjW4KlD6EWN+oJngijtsc0/38obHMLPXCvfCgHoc3iaZ/30aHKGRI/jI85un8i9
	uATqdezEwPz98xVV9KR7K22dDp+qJ3CO9rQH3fEMZU
X-Received: by 2002:a17:903:37c4:b0:2b0:7b57:830f with SMTP id d9443c01a7336-2b2818e4f2amr259026645ad.33.1775742672900;
        Thu, 09 Apr 2026 06:51:12 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:51:12 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 2/5] staging: rtl8723bs: remove empty if statement block
Date: Thu,  9 Apr 2026 19:20:23 +0530
Message-Id: <20260409135026.137904-3-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty if statement block for cleaning up code.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 0780847e287d..6ab65e9e8bee 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1415,9 +1415,6 @@ static void phy_IQCalibrate_8723B(
 		}
 	}
 
-	if (0x00 == PathAOK) {
-	}
-
 /* path B IQK */
 	if (is2T) {
 
-- 
2.34.1

