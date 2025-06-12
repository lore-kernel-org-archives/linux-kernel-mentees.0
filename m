Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461251442F4
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728956; cv=none; b=BKl6NHAKntFOYQcvrsSSyGen0Vt0aKtjAyR8DYwrW3c41p06FQkHKF72SPcp3s0Vs1zUWqvSsDV3fYucsEx5GM42nAzb26nBK4i3ukI/XCMv5dLYg5uFkCJ3wawNYMw2wBxVEO1yht0LygalUpMi/LU2vKQhXtdyBNQa4gyajNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728956; c=relaxed/simple;
	bh=z+jyBC0rDsvIMFnB2CX5hTuZkM0uQU8PSDEQ97J9Fms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSnvlEN8LWpMwgHa8JWDfnNYpbSbG5fX1aPlMwlcEKwntSYwnExPMDYoc43e+oyfQZa01blxtluFhnBMUhima9zMQR4PoMSouSYq1LOglnfkTshOGIkIjbnaewVx4T4h0qclWccThozcLxGMAB+0tczD2KXQ8W5FqfDahPcOEbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LddMbLzl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LddMbLzl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234f17910d8so8607375ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749728954; x=1750333754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+c2fxGTrOu+gHD3RHbFZi/o0nuFFUaAiSBwnrt9ygdg=;
        b=LddMbLzlugDin64zGjwZcZCnFJJRJMBaa1X7cd5pMc+Z7jgyEDh1+Uu/Xb+kUMoar4
         DU3O7iqzWvKz9oyaxZ3r2YzeU/1Ook/xwsi9EQwYtVOUAeGLnltoGrXIFxN+J/tEFvlA
         nMTasxvYiKfhTjSzMKsTkktSXcsKaedAbS4WWvoJMuime7aRFBXjKOj7lGYn4pjpfCxv
         7WUEs5gU1SAWpzD9F6pzUb6OrJ2sjiPxaYBCtuMIVfD0xgVvxotipJYlOrZonEygoU/M
         88ShK+jdsSm0wpsqVoHRQHNaofFF7bFhPbdAvXGqa6S/TPfB9BgqLy3io+BAgXMyJaZa
         JEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728954; x=1750333754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c2fxGTrOu+gHD3RHbFZi/o0nuFFUaAiSBwnrt9ygdg=;
        b=npiapuVbNCLuTO+3zmn7t2ibwMrvXozdTscd0xHldHE1Ku7SlJE9ldmqSxrvooYkVD
         rWkjwDkDI2+fqRxxEQqmZUDSrMmMPJSsnovceg4Hqb8q0S+rLi08Pq07eRe6qteTL0qg
         1SQSpwM31rjjGj3eFNd6QeXYHz0C+Biosgdf+qNuK4ut707zIC1mV83/l8/qozzZdgcC
         OwkOkERaBQB0oeTqL3reHiGEr2ASObb2H172jdEGlkfMzY/JEDpRxtfipyIk8ZZ6BRK3
         vdOGHt2Ht2JXWozhnByKGz/YsrH4os1HVPqh3tZpt8QRfninDH92wWCQ8eQZJUJknPln
         3JLg==
X-Forwarded-Encrypted: i=1; AJvYcCVJZAHFFDe1g0+IFyk3OYRuirtjxPfhddy0U4ypUg1MATry+hHT8GqkBVzue+Y2J4i4mAzpJq7xx25DOUYmx4QIGTmhgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxM5WkJrWIAuuo56WOdkTnMRvJsiqgtVKxxdRsN1jkKU7yj6efK
	TVi1j1n+dg/9ATZy3lE5Bxw2laSfo0YnrbwxV4RFEVNfed/qzBHTQz6o
X-Gm-Gg: ASbGncvafmrPGbYNbLzsy+slFwAjF4OqD5hJJwQXnC8Cm3RVmKGiEeiemMA6NU6KET8
	4i6QtCHttjzEsG4AbKs4rTcgvPokghAH3DxnZA7867VlEUJiCsSBvWPN9tlFoly7raOslCRWZn8
	vN1dXgtkU8HRjakt2I3PKVBHBeBTpPNUmQ08Ju3rBUy6cvPRImnHQUD9gA67u8hHJcTxqqqhiP6
	bJ1+hBGR0BANDrLdRV08ZlauuEJJNlwzHZBaxphAL3jmDM9UC2K0WO0kkadrIsrB8m1fyxjcsV7
	a57OsqnEikW00CYMa+kuT/QJVXQjEQQufcqE3MIE/KEEAaJui7pD8hzwVWdRC39NgMyuhDQZpNa
	7goyNaw==
X-Google-Smtp-Source: AGHT+IF+iRobvx4n3EdTVD6DvuQh7mzj9PkD4pyqkWGBI3vAZmXIXO/ynMbvEebXoFzhjKLmEwsN1A==
X-Received: by 2002:a17:903:2ace:b0:234:8a4a:adad with SMTP id d9443c01a7336-2364ca857e7mr46686155ad.26.1749728954393;
        Thu, 12 Jun 2025 04:49:14 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:6c31:5551:ae55:e297:cf31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd613cfa3sm979731a12.21.2025.06.12.04.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 04:49:13 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: skhan@linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH v2 net-next] net: ipconfig: replace strncpy with strscpy
Date: Thu, 12 Jun 2025 17:18:59 +0530
Message-ID: <20250612114859.2163-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with strscpy() as the destination
buffer is NUL-terminated and does not require any
trailing NUL-padding. Also increase the length to 252
as NUL-termination is guaranteed.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/ipv4/ipconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index c56b6fe6f0d7..eb9b32214e60 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -1690,7 +1690,7 @@ static int __init ic_proto_name(char *name)
 			*v = 0;
 			if (kstrtou8(client_id, 0, dhcp_client_identifier))
 				pr_debug("DHCP: Invalid client identifier type\n");
-			strncpy(dhcp_client_identifier + 1, v + 1, 251);
+			strscpy(dhcp_client_identifier + 1, v + 1, 252);
 			*v = ',';
 		}
 		return 1;
-- 
2.49.0
