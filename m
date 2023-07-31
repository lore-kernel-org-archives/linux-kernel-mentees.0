Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1454AC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 14:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 948FF405E6;
	Mon, 31 Jul 2023 14:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948FF405E6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=D0OSdpad
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8EYYvQuDCpU; Mon, 31 Jul 2023 14:17:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8EFDE405CD;
	Mon, 31 Jul 2023 14:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EFDE405CD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F796C0072;
	Mon, 31 Jul 2023 14:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75674C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 14:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4022781DF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 14:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4022781DF2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=D0OSdpad
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hvdy8Z_KMb7I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 14:17:47 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB5FF81DF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 14:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB5FF81DF0
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686b643df5dso3127729b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690813067; x=1691417867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+JwN4zjNlnKq9ahXjNAMvm1OlnYz1L5/k1djbBLAuVk=;
 b=D0OSdpadmt0AbkOxx3JJs8yb36P2j1IMhCr89XyQ9Mi77lui4O+uFJuzwwinjk9o58
 6A6dFBdMEFsDeBZu8S0zM9kW8XtYLvskSO3ZoYUpdVcRc79/IvhGRZ5RUOLxzKEAVolP
 NOZ9R8Z+geOhCWLHFbP++C0LXqjg9hkA5BN4D6pd+zeQJB9kOTmoKf8d4eWwBPS6cMV6
 xWR2aQ42vQb2xiKsHWjaZTTqC+O0adA2IAOH3BAYhP6qoRC1Y8QMJSNR05M1naXaqIef
 aMzSomt7z6olrRh1up/MOEVcd6XBu+Eqdv4hLXdxf+p5URjLlj2wQizvLsqiQTWFwthb
 dthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690813067; x=1691417867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+JwN4zjNlnKq9ahXjNAMvm1OlnYz1L5/k1djbBLAuVk=;
 b=EArQwAJAuzAi6XS3ZSj/NJ6t2K/PT24eUznfAG2tR0E5HrjxF+QhAW3vKV8pifsHwu
 aTf4XhPxaS71D9Ujm+TI8aCo4z+18971FRqwlyOQxR4rxyoY0SzdqcBjDyuLxRhWPIr5
 aRtg+RWtNaKuvCLSDIrRw95AygvFmLMGiPA7r5OclOconGlsHMZU0j020S5ItK0kDoyf
 r/hGAgZt/djteUjRRXDuEtTOwqZyz7yzgQGeNk/DPRnF7dqKzl4CfrlmlTMXYZLdPrXA
 AWHu1/kOIfeiRn+MORPU6PcmAQWdB4crHjFm5zGGFoB9oCwtkOTGFYpoaoRaaVyDa4lU
 bU7Q==
X-Gm-Message-State: ABy/qLbOpB0/bcTV6TKr+4OygYLY+CXUstkWcaiCvBG69ROLIxAMem7O
 K8bL9xVxWz3TuyP9ytf+7kY=
X-Google-Smtp-Source: APBJJlFWq0XGw17Y4+grA0UBN8iAez2xGZtZ6F7hEBM5c/Gx6WLmA4fHl6xFM5cpVTzHqPsvL0FM+A==
X-Received: by 2002:a05:6a20:3d02:b0:12c:e3c8:8c7 with SMTP id
 y2-20020a056a203d0200b0012ce3c808c7mr11206785pzi.41.1690813066805; 
 Mon, 31 Jul 2023 07:17:46 -0700 (PDT)
Received: from fanta-System-Product-Name.. ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 f13-20020aa782cd000000b0064f76992905sm1965739pfn.202.2023.07.31.07.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 07:17:46 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, paulmck@kernel.org,
 boqun.feng@gmail.com, shuah@kernel.org
Subject: [PATCH] selftests/rseq: Fix unknown type name __weak for gcc 11.3.0
Date: Mon, 31 Jul 2023 21:17:33 +0700
Message-Id: <20230731141733.25059-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Anh Tuan Phan <tuananhlfc@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

QWRkIHRoZSBkZWZpbml0aW9uIG9mIHRoZSAnX193ZWFrJyBhdHRyaWJ1dGUgc2luY2UgaXQgaXMg
bm90IGF2YWlsYWJsZSBpbgpHQ0MgMTEuMy4wIGFuZCBuZXdlcjoKCnJzZXEuYzo0MToxOiBlcnJv
cjogdW5rbm93biB0eXBlIG5hbWUg4oCYX193ZWFr4oCZCiAgIDQxIHwgX193ZWFrIHB0cmRpZmZf
dCBfX3JzZXFfb2Zmc2V0OwoKRml4ZXM6IDNiY2JjMjA5NDJkYiAoInNlbGZ0ZXN0cy9yc2VxOiBQ
bGF5IG5pY2Ugd2l0aCBiaW5hcmllcyBzdGF0aWNhbGx5IGxpbmtlZCBhZ2FpbnN0IGdsaWJjIDIu
MzUrIikKU2lnbmVkLW9mZi1ieTogQW5oIFR1YW4gUGhhbiA8dHVhbmFuaGxmY0BnbWFpbC5jb20+
Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnNlcS9yc2VxLmMgfCA0ICsrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9yc2VxL3JzZXEuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNlcS5j
CmluZGV4IGE3MjNkYTI1MzI0NC4uNTg0ZWVjOWIwOTMwIDEwMDY0NAotLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yc2VxL3JzZXEuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9y
c2VxL3JzZXEuYwpAQCAtMzQsNiArMzQsMTAgQEAKICNpbmNsdWRlICIuLi9rc2VsZnRlc3QuaCIK
ICNpbmNsdWRlICJyc2VxLmgiCiAKKyNpZm5kZWYgX193ZWFrCisjZGVmaW5lIF9fd2VhayBfX2F0
dHJpYnV0ZV9fKCh3ZWFrKSkKKyNlbmRpZgorCiAvKgogICogRGVmaW5lIHdlYWsgdmVyc2lvbnMg
dG8gcGxheSBuaWNlIHdpdGggYmluYXJpZXMgdGhhdCBhcmUgc3RhdGljYWxseSBsaW5rZWQKICAq
IGFnYWluc3QgYSBsaWJjIHRoYXQgZG9lc24ndCBzdXBwb3J0IHJlZ2lzdGVyaW5nIGl0cyBvd24g
cnNlcS4KLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
