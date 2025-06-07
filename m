Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F95A1DFFD
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  7 Jun 2025 15:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749310125; cv=none; b=CEI1z7sCTw+F7ZRoZzhvyWVOesjsRL7Git8gAr6pAGK88Lmz38DdXIEWnjptVx9nqTzFmt5OaekKqAHHa1St0rJSGcj5m4Dr2nkCJrB41VsSlA1Ii4E/ws8RO2ExAAyiXLnZI8ORbmypxqd1sm1NOHtuLsSpfs6isS3yRhxhBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749310125; c=relaxed/simple;
	bh=z+jyBC0rDsvIMFnB2CX5hTuZkM0uQU8PSDEQ97J9Fms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msxe/qAPqpK74NiI4tmYekdVwTZfzV+dhCbGlABqBtZ8KehCQo7ZS+yPKtP97a3KFTnkiNOpg4UV2qR94gKXpWKzOUz288L9eLgacT0S2osMMZ9q3n3kMCbMwpIk37AYxQPYir1h65XoTO6C0eS/WUWhaN1zjGUbMNuVNRFZiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eowf/WT0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eowf/WT0"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c035f2afso2224941b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 07 Jun 2025 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749310123; x=1749914923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+c2fxGTrOu+gHD3RHbFZi/o0nuFFUaAiSBwnrt9ygdg=;
        b=Eowf/WT0S11mtM+ugLf4gPzJo2LmxAUl5qYJcLMTmpXoqDVWNZ8Nu7JwvwRwG0xZX5
         ljRR17zP2vvp6e3F+XWUyePfuLj8TDLGcfaKKJcBgwPkqLigojGlBOkqGYUXabfbm6/w
         TdzHOePSwcia/0oOZKa/F31Lx2F8u6n3txqsZUtFf+xRd8B5McMiCfr2S6Gv6ofmdYZp
         SyBt8aueeUFtjK278cQXxL5NxBdaLHERg7br+aDsKbqnutIku4wjzAa+aPhWMmLVZEC2
         qwibL283N1cltbaI850YDBKsEUMK4Enbwi4ekSAGdsiDAOvDzrlXzZ/shSk7jTHU3ByL
         rYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749310123; x=1749914923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c2fxGTrOu+gHD3RHbFZi/o0nuFFUaAiSBwnrt9ygdg=;
        b=po9XhMAQeQsOIzlFSBv+R9c4cGW+jzPIcDxNXxkIyY3+zYymb/5Q1Qb68VTmE4Hhjq
         9ugZiDUx+KLl/DUFyzNfc2Bsi7eeNaHtlgQTaDKrJpipng/dUeSVDH4B/IRehCf0W8Yp
         qewz2phXDACvaAezVgeDLeg7uo3Es1wu97tF8f8NnlzxXa4mTXb/n2WyKOVgNcOS2/cA
         9KmPS8Qq/Wry/KzZy0BQMNW4ZAegI7o/t/e0wRtBTFG/fLwSaHDRaWgGnd1gqaAkBbIj
         gVUjNVCKaMmsP0VH0ADZz0mRlkTTktGDujIPXDgronymVfiO1veZLXYDhS7futz/JCOS
         yTEw==
X-Forwarded-Encrypted: i=1; AJvYcCUmaLnQwyQPVaGcp2pzJ++FVbboBPt1VXtZKtOi6FKtIJNBy5EBvxQR/px7Cs8GKWVMsoepnSt8DrFnKG5VNKj/JZLxhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yydo9xQD2sLsHhj3bgmhF6ZdYC//rs/UuQzD7O2nvxi2hwMNKZK
	uQwGpt5ZFrGLxlD5dlSgT4bOtZPJB8N9cXmHjcZxdGIzYNXK3Ycxe/u/CgFJJELp
X-Gm-Gg: ASbGncuE2kbjoNqwZsdeNy/SqdNvtxUETscUwJPjQ0zMjIJEWwS9yY09CKAkDva20iF
	r8lxtyYhgUW8NwdpKjDlFv1cehKOPWrMr3Zg21p0sc5VsGmyaajNTZjCHFiJtse3Zf8AN5RLNbd
	Ywb1sDYrJGAxGQG9rlX1oGPzms/NHllQzQBotlWbT39HPMJag2YLN5I6Wnh7dVX0/Cs3o2uxNcr
	drFrHM/d2dpw0MATd0Zs49ZHylJm8Q9lBvTpwslWPeQ0WdX3FlT0neY6AwP+JnP9GCoCuvQ91l2
	xK4zypzBe8hiedAtxSUVnG+z+fYgVczeWBUD/+drYdPdOlhquyI+KL9mrTIcIjyAYm0RbeI=
X-Google-Smtp-Source: AGHT+IGe5PvLLkyfOcvRfGoQZO2yM5rs9oLpWj19Gd+8+aRM/ZSBmC4cTKl3EgRRwqh8R4Ru25G9lw==
X-Received: by 2002:a05:6a00:4612:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-74827fa2840mr8940461b3a.5.1749310123426;
        Sat, 07 Jun 2025 08:28:43 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:bf5b:2e56:6e66:c9ef:ed1b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3831esm2965754b3a.13.2025.06.07.08.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 08:28:42 -0700 (PDT)
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
Subject: [PATCH] net: ipconfig: replace strncpy with strscpy
Date: Sat,  7 Jun 2025 20:58:30 +0530
Message-ID: <20250607152830.26597-1-pranav.tyagi03@gmail.com>
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

