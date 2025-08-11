Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C6260583
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 04:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754886586; cv=none; b=G0se7uxfczXdwj2om18Dl7+AotRsFTh7iKql38Syvi4fWW63OAuo43Ft7gk0XjUPI7Z/PDIh0nr4nfNGaV5oFnscZq9wo71pNG4wAlRVo8dRhg7x8urIT4V6PHsmlV9IkRp6U/tEKaCWCyBn0L/eyL2T76pPZx+dUVJYLtQr5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754886586; c=relaxed/simple;
	bh=asAYiJd2BPVbPq0TrnmfQDeswmedlMHPQ/HIzf4WD8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDvHSrVQUAjgKldD/ygkVym5ANDhWXQd3qm78Z49PzSdzdrj8M6dF01CIHCTtkQlhM/rEpwLMwwmGRB6AtjCK33xIyBe1W3pSspz+z1cSGuVNEwWclyx/MO5B3hTP+2i0T8qD1q72NH4PWkCJeODCsChkWVwxuzPeVAIl6CpXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6WzDbxV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6WzDbxV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31eb75f4ce1so3449278a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 21:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754886584; x=1755491384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UyfTclra65yMzd5uvao1JUKR6GowJ/GfOw5QMCSske8=;
        b=P6WzDbxV7qqgEBI+tCcv3CVM0CWdOhS9lZjNXKW/JfqSRQUXQDLNFUK2S0STw7nDC1
         Z4PENmMg9TzZeq9OgkwFLvc0dpVSzYkug4IXLnyX0mjZEsEWv4KMVCzYNViXmM8TyQlg
         lEIVCdBrA6SFpHKj2eK95oTVTouziKAHF+eBG6z5PgPj+b8ugBYlq23WMPZ285HyBAnl
         L1Ulzlgxbl/q3yeNIWVeHCoEYBeEaD7SmMB7mz5p+Aaj6jpIf4wYq7VUMOCbxzxNo+T1
         ePTy7+7dGkFKVlyhfmrVYszYrW1g9zsIKsnfwzIezFzgKhJ+to10hIlee7D4M2Plt9H0
         2bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754886584; x=1755491384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyfTclra65yMzd5uvao1JUKR6GowJ/GfOw5QMCSske8=;
        b=xJXzYz9PrrDPPmcF5vqNvXL7bthhlR1+yjjnD6EFWHtBp9Hxh40lpU28NrbiAfWz4G
         7+XBHgLh0mVA/iTV3LPyFzcCEDEqxmTsXrKs+16zNs3eGFehfMSbp+7MZ1fqabgXcgEv
         LdC51GcxqJi1gKPK0fT8L5V37Pd8AzAwpR2LjPExNOpdY+nWE5ExS3R10xtP/E8SL5Bt
         gDnhqBOHBC7bXq5YqE3EZC+1Xf843YekwmeefWYV7smE0bWYmjwyfUBzIXbUvFIBSF9b
         /JiFhJJ58Q73yWZcPvyKVn+V3brI5d57S1cqAcvRONL+5F+qqDzgBMcRGOjFkDFMfuOI
         NtYA==
X-Forwarded-Encrypted: i=1; AJvYcCVb7r5j+tgHF3iIc+eKrJfIBLUFNH5fs63JIH1r7WgKGrYjUievMrM4qtlYe2A9FuLaEmQfMMhtHZEnfFPadzUqOimhZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZSLg2obFmiOj6utstfFq3vqTBLZORaTHE+xSyz988uWf482Ut
	u47Edibax5ZvOZTfK+ApIscwQAwzP9TchWu0I/zmM4/DiY/RP/0hJoM=
X-Gm-Gg: ASbGncuDdwcfBX6jpy8Wxjd+StbscuZzsvRW6wTekVpzylgGhygZ0eYK5FjnPWMTrJ9
	r6bmG7Npgpj8EpJ3E3mOkPsB7cd7lhfB9zw1SwXCuE0hhcJ11y8wHNHX1abLVugnxic0+qFPcoI
	F2LdKIvn9DHrGqVh32y1GQQo+gAIs0htjMkS5VJ4CzCD64y4+6knhjFh909+uT9/ydRF94/mvpt
	VJxbQAPIB8Hxq1z01g60zMc5Yv9ma/8l4CwqDqk84rQCLGADo2RsIYtx46DYSNj3ZP/uaapIwBD
	INJauYRoXFDgMx5Y2aChkI/XBGl+rOt2QtP1HWDTspOkxfCZLGJVAy9DpnggDXKfu7aiyXP5anv
	SEUqwVxk0846kJfxIUsEsAIoz8GxpCo0qzhddSl6dwZ9azUTh4g==
X-Google-Smtp-Source: AGHT+IF32WnIAqQMfkdBLhJzzL+vsh7maHs2RRXoBX/ACxt8kloDd33fVoTNUpB1P6ihoXwRx79luA==
X-Received: by 2002:a17:90b:4c8a:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-32183b4382cmr15867750a91.21.1754886583965;
        Sun, 10 Aug 2025 21:29:43 -0700 (PDT)
Received: from kerneldocs.. ([117.231.194.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611dd694sm13412186a91.1.2025.08.10.21.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:29:43 -0700 (PDT)
From: Nikil <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Nikil <snikilpaul@gmail.com>
Subject: [PATCH] docs: fix broken link in Documentation/RCU/RTFP.txt
Date: Mon, 11 Aug 2025 04:23:58 +0000
Message-ID: <20250811042357.7470-2-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The original link to the Linux Symposium 2001 abstract is no longer valid,
as the Linux Symposium website is no longer active. Replaced it with an updated
link to the read-copy document available on kernel.org

This ensures that readers can still access relevant resources without encountering
a dead link.

---
 Documentation/RCU/RTFP.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index db8f16b392aa..87b1c97c3ec3 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Month="July"
 ,Year="2001"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
 [Viewed June 23, 2004]"
 ,annotation={
-- 
2.43.0
Signed-off-by: Nikil <snikilpaul@gmail.com>
