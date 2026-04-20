Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D752C21EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Apr 2026 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776660419; cv=none; b=qnobgtyAe8FZnFlconHvd8creZVx6BAzTLtnFjqe9cTuBI0LxsWleIH16oYqKnICKm0QDJbqMsacuChg6xAdVGvjKVXFkKxUgt1Or2+Kvbc8W/RkpatNw/DF3TsRYvT0DbpM/suM0KLOD/iPwoyGvBIBApB/bSBJIAhclCnCC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776660419; c=relaxed/simple;
	bh=zkffNv0LBhinx/E63CYkZKeqr0eyX33feXqDb6ciV70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyEPQU05R4jWWjnOaQgNnr1AbGlU4+8OvE6DgogCfydZuAbZPaJ2d1NY0EdCBIRZr5hYRdXsynxi5+3CpVZhb0JGlAhBu6uqEQwEYDGsgkSkK81VUkBh+7O1s9ZfjksZl2h8l3ub5FymWN86vlzsZiHX/1Om/1eUwTksx/ECQYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcdT19/j; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcdT19/j"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A48D60E8B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Apr 2026 04:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pohMV5KjWGIq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2026 04:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07EE460A62
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EE460A62
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LcdT19/j
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 07EE460A62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Apr 2026 04:46:56 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so788634a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Apr 2026 21:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776660416; x=1777265216; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7FzHqG5yNceP4KZ6RnjXraN9OcKgDDAExN55aKDfUY=;
        b=LcdT19/jtn4iVzEloe5QPNcgsm3vOOSsj8CENJLwaQBaQUNZ6ZJE8A302eHpndRRKa
         wf4OG5+qMd2QUGbKhwGmM1dYhUPgwWEnJArLH/Ah4pTku7Vx4mK8DWLspL4U6I4Prgcs
         bsrd7YdCLGXD2DIbbeXydPJREGZZn2/3NUyGDtMoWo/WNst/Hpe3/7Bd0JD0i899Ed5K
         IeBaJzLJ44UO6QnGptchQ+txegJLwYyzUW5l64nJ9QJYorpjW4Mt1jcUgha0O25W4B9j
         yujHiknaXDOEe9jn5pJF9cJozshptoxJjQgJt1NZp6QrY7enTHXRtbKemn8G0h22wjhx
         QRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776660416; x=1777265216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7FzHqG5yNceP4KZ6RnjXraN9OcKgDDAExN55aKDfUY=;
        b=Y7Ubk1GtbRNBb/B13kHbeDQuk4FQ/i2OobLgPeX+Fkcj8DiVukLCAdkiq1sA+Cm9Le
         b9A046s2BZSohUazQISccsHHw+V4u0wcjyLnHQ7prVmz7mj57ZSkHEruDqaoR6MTaYeA
         8rXBn46pKR11Sm/1ZzRjKk09tweGHe/M7LCbi3HUJqxRpeQiE4qaJsAWEiSRn1SjfUB4
         5kmn8wHeWYi6qj3UBJ7yEtDEK+Xkwn4dXAokek4zgxOMC/NQIrrzrQYUNliGks1JvZkO
         Y5nVzlpC64m2asDLMiX75Hb8lyKXYUT1INB/OTMjMjlaYlPJNz5ZYDqhgj9QLCqobNSF
         ObsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/C2qvVWLqYQUNUvvTRxuOFclr2wwg6p8mdXqwC4Ty0vReIJpkWaFuyJAbTT2QBYMbAvnb25z4V8a2tm9cpt7qgsugmSQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyeqcFBx3uFpGf9Epp5OUxK50wxNA3lOq4ObzishRpOejk5BbYH
	uHGAH5xsLtGJ0+I6enyYoW42rP81L0zrGAS/7/FLhceeO/vThKxXozXh
X-Gm-Gg: AeBDiev/Ifbrlj6GIA1uS5NoAXl1iHP3ILzJ82ApjPPVD5OoQAHPMy4mIs9vcvZW5Jq
	T+kQBG1wGzAcQemqWPszKGb0rDGCPqiVuaKJUvksL0XcJOVjH3S2TVpvIPogY4vYwr5SLV3m2qd
	3lbSiP5JRt+IES8sigN9DjNHyudXRQrlCAcuUbUVc8aIvOxTd/a61Qs8W6nl0jF5vSuZh81eInm
	Fy5p4IYq4w4UDwPIzicBb86xH/K8penOC1omAtk+XYHxzOABArWznAR6GdwvK/HOpEQyLk8WTgd
	Va6/YbSD9fKxFRF747uIBmVZ4NMYc+qS0EvwIW64T2ZjGgEgOaJrIhh6ONocPxsLMJsi2E4fT1N
	DYG45MTBDZBsqaPBMgAXO1V2NZ4RWmDVXhg7T6c1dvvLIharQccolVWx+xbRBB3i+oOf20L5JUF
	4g0iXubTlJnzfYhy11LL1ekkX52F/4GEecJl8W
X-Received: by 2002:a05:6a20:7350:b0:3a2:bd1d:d68c with SMTP id adf61e73a8af0-3a2bd1dd849mr2961437637.50.1776660416125;
        Sun, 19 Apr 2026 21:46:56 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:1f1c:69e:a169:4508:2d92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703be34sm6401881a12.26.2026.04.19.21.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:46:55 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] staging: rtl8723bs: remove unused offset in phase 2 _BlockWrite()
Date: Mon, 20 Apr 2026 11:46:42 +0700
Message-ID: <20260420044651.164450-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c1314fe4d28f ("staging: rtl8723bs: remove all RT_TRACE logs
in hal/ and os_dep/") removed the unnecessary RT_TRACE logs in hal/
and os_dep/ files, but left the variable "offset" in the Phase 2
_BlockWrite() function unused, so delete it.

This is reported by Coverity Scan with CID 1408950 as UNUSED_VALUE.

Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..988829d5f3c3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -68,8 +68,6 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 
 	/* 3 Phase #2 */
 	if (remainSize_p1) {
-		offset = blockCount_p1 * blockSize_p1;
-
 		blockCount_p2 = remainSize_p1/blockSize_p2;
 		remainSize_p2 = remainSize_p1%blockSize_p2;
 	}
-- 
2.53.0

