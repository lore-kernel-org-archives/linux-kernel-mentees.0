Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DAF217F2E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084676; cv=none; b=B51wTGcv7bkG9AFl7zTdIH+XT4E3OeLjRqEjXL5q0O0RtkNS0PjNmC5FrCby/Qs6SV+gY79VuRWQvkSnt8yLl6hiENpslrszM3W1DgLeogw/l5mUm7nJQMb6Y16HICvPw+J37rshGy4GmxE81XwYB8R1GF5koGENxaa8J5YA6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084676; c=relaxed/simple;
	bh=roxiBP8n2/WO6llbiXIIzqlvjmVUw//7N2vSH80w7Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clUASfskYPhQ81P9uxwqS6oyZ1V89Lc8OA5t+FUXf3r/VLfdMStBZVtl36cHdVjeVlGYl/zisjjeQ0NSQi5Rd4u5NNfNFJvQnIBy6Valj67tGKQIazlsyp3mHW55USxINsad0hsh+TqFg7DNMUvhfX+wri9Skk8UMkaoIrg5JMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqgMddxm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqgMddxm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224019ad9edso27230415ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743084674; x=1743689474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sjV04iFamzWhfZ36V6Y00gozFOhQNp9Rj1xFfvHl2/4=;
        b=IqgMddxmxWSg/6zUL10jsLg9IHkcsH/Llkt87To18VFHFrYI+HtQCs99K4bTxj56Kj
         +MS39aFhlNfjUarUs3lpsKadwTXq62ujbQQivZ8WrwSlRyj0eXoBXmbjM4HCA44WR6nF
         oskw6Ta0PICyqNLo/JJG8K1cNgx0axbVYYiDdNij7u8vzk6sp2AA4/NUHyU0agnRiXlC
         O/FDzYBFMfDR03qyOd57GkgN9AU6XedAvzJRdBnmYqmpsuw8ekdlv9BNfJPGo7fXJcur
         wb1Dd9Zq7/WanTLLRnPbcb1KeIWqgopUM3t2j4apetq+XxefXDR9SKQAUpYRHF2X7RKJ
         5eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084674; x=1743689474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjV04iFamzWhfZ36V6Y00gozFOhQNp9Rj1xFfvHl2/4=;
        b=oxb6iFMlQectMprPHxpIwVcDEj4UDhLt7ojUKVC1VZRkBeQ8MsJXSyTIp9OyrMst1m
         LqfVsAD2bhMGwolvaxmkzvcJAJGlJSBuXHjdu3oubuz0j3JGWAsdh6WIutwcHYrEeJ9t
         JWqJRtuJoX6Lg3fIoHCiWXgW1TVmvB1hZg9i9rU6oJilvdIWrJXKf1M0iSLVvcUr4z8u
         kZBGY7Ol2QwXoWKlnW8SN/8cN5/Y0ZIkLpN9lQkhpAeyjsnAGZ4Puf/M/8bYMyu66s4J
         cIAFYDD4M7x9UghLRShcY1jva0WFC15kbx3xkyZdAe67dORzJdcfGBhUKkjiC+J2evdH
         3rrg==
X-Forwarded-Encrypted: i=1; AJvYcCV4styNlF5IHJqTY4krrMRk1tkQjcS0TvKSXfxnOUZOmE3C1TpKfrD6kJkILChmNsTp6kdnpc8BvRebThAhul5Caw8ONw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4NFPinQguUN+yhA/kIeNRvV25KKvl7TQwoMSoKlK9xlCzJAZ0
	jIVg/7XHxNO8+IiET4QA9n793ncdwBZCQABK9bzVku+eFAeARHty
X-Gm-Gg: ASbGncsS79QyHJ1tKuq0x9RbvvW/yCbkHFWeRp7Frq8spk+Gq5Ig+ORyOoDB8Oqf3LA
	F0YTSmuaYqOh1tZgCpd+FIepqZC2I89tCHbUmP2MVBDrp4Mf2RgTBGT4Asp1FwZi6JIQdo58tgr
	0XNA4D5FoMqRssVS+H/bgPgRdiT5X46qxzDqULDVAzDqkt0AiRiKPnBhNB5tyfsdxmNeymiPglg
	XNz/GXngtCuTKFIWAir54xY1IN4UfuAEL7RpsPmb12xnMOGX/vQXu8TdeB2WYzMDIoCVCUhUcy8
	DwiXEZUn9SD1SOrXkZffa8ADKR8mDM+CekIdYGVtLEE3g3RppL67yp5ilNRQc1EweROWqpSGx5k
	Dh52K4TaBNQ==
X-Google-Smtp-Source: AGHT+IFOKGF56hs0/+rGpUCOdXMQzOCaiE/4zuMaKMjgEcg6lDy3KkcqM+Jl1YXYV2iA+AQZgdbR8g==
X-Received: by 2002:a17:902:e550:b0:220:d078:eb33 with SMTP id d9443c01a7336-2280495a074mr55475655ad.36.1743084673787;
        Thu, 27 Mar 2025 07:11:13 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:ba38:f81c:733b:4bd9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b2bf0sm129040755ad.145.2025.03.27.07.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:11:13 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] wifi: mac80211: Replace strncpy() with strscpy()
Date: Thu, 27 Mar 2025 22:11:08 +0800
Message-ID: <20250327141108.182585-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of vif which is "vif_name" should be NULL-terminated to be a
valid string, however "strncpy()" doesn't guarantee that. Replace it
with "strscpy()" to make sure the content within "vif_name" is
NULL-terminated.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 net/mac80211/trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 72fad8ea8bb9..37f5b1c87709 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -1725,7 +1725,7 @@ TRACE_EVENT(drv_switch_vif_chanctx,
 				SWITCH_ENTRY_ASSIGN(vif.vif_type, vif->type);
 				SWITCH_ENTRY_ASSIGN(vif.p2p, vif->p2p);
 				SWITCH_ENTRY_ASSIGN(link_id, link_conf->link_id);
-				strncpy(local_vifs[i].vif.vif_name,
+				strscpy(local_vifs[i].vif.vif_name,
 					sdata->name,
 					sizeof(local_vifs[i].vif.vif_name));
 				SWITCH_ENTRY_ASSIGN(old_chandef.control_freq,
-- 
2.43.0

