Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE72C3DA4E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 16:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 873A760838;
	Thu, 17 Aug 2023 16:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873A760838
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VmNUeJRQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnIUvWVC9kSM; Thu, 17 Aug 2023 16:00:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7B35060B38;
	Thu, 17 Aug 2023 16:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B35060B38
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57F4CC0071;
	Thu, 17 Aug 2023 16:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55B30C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DF9B83FA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DF9B83FA9
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VmNUeJRQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FL3k71dsJBxh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:00:39 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D42C83F4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 16:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D42C83F4F
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6887480109bso2486443b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692288038; x=1692892838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zlT9fFwxzSwTM1kaYJgDOCQu0UvIzKLj9qZMmOR6x28=;
 b=VmNUeJRQXAVcshDfrSK3Et1LD6PprjNbVNeGttwgD+xwqPFRoSJiXV01a/6kluD9I+
 qRytK1na28nWsFpvtf2Th9yg9VI9aY+xddy856SeQyHAmS7Pn5YZd6d/soyTyTnk7WAw
 +5uIgH9MEcHinqYXrTCmkmGrkBK/dXuP/vrYAP+rOfJmEudxia9o73P9cwDKq0nErq5A
 GVWrQHGqkJETkGsiHFGLFJZoIcNFHgzm7Ma2oBaiPjLF0mmHAOZKkjhkMfBFJ8XfTiLk
 8Txue3l0eRnHlah7YJAo4+8nXL/DsAAUE8Sw1+StyynHrx9pIuEsBBHRTfgF8IFfBkHu
 YcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692288038; x=1692892838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zlT9fFwxzSwTM1kaYJgDOCQu0UvIzKLj9qZMmOR6x28=;
 b=Kg51UX2p1yBB8XtC/kwp8TBVWbNCuodP3x301+nhRwxoWluGasAlv8rpkFoSiFkbE4
 FXRjSFXanq/yD/FJ2umTsJBg2VfXcJ5MaDZsc92HCLcYCKGKwQVp4s+nw9mpESjtO3Rs
 pF1Uvm6sVRPm/if81vd5AJ8G+bn6lVugsHtLV2umQswbqE4ZO3FPIRTF7dV0Gnew4ZLi
 TDprd9HLO3GtZSsAiqq+xLJ9ZR7jWQa2GF3nYkDzN31y4BttmKcMLEfEQlzip3VwaEAG
 dTEvVTxgFGil0xLRsu6bcHpk3ZXZ0AFJfcdUu8j6fLxgryDj6U52VhmjIfQkIiYdrQpN
 51pw==
X-Gm-Message-State: AOJu0Ywe63zzqsWNrJT1eETXJPZW5U9zCR19tXvPe3ieqvjVwCMVG1+d
 hJAhsFdXpHMyylj7vwq/qaE=
X-Google-Smtp-Source: AGHT+IFbJG9KVcf0ORQF/w7iO7Nxg7X/MOZC4YGa5PCrSmP+GBVynwoW31tJgL6Bs6PF1VubX6ZEtw==
X-Received: by 2002:a05:6a00:850:b0:689:f586:4add with SMTP id
 q16-20020a056a00085000b00689f5864addmr810149pfk.31.1692288038267; 
 Thu, 17 Aug 2023 09:00:38 -0700 (PDT)
Received: from fanta-System-Product-Name.. ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 s24-20020aa78298000000b00666b3706be6sm13018779pfm.107.2023.08.17.09.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 09:00:37 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: akpm@linux-foundation.org,
	shuah@kernel.org
Subject: [PATCH v1] selftests/mm: Fix WARNING comparing pointer to 0
Date: Thu, 17 Aug 2023 23:00:33 +0700
Message-Id: <20230817160033.90079-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, Anh Tuan Phan <tuananhlfc@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Remove comparing pointer to 0 to avoid this warning from coccinelle:

./tools/testing/selftests/mm/map_populate.c:80:16-17: WARNING comparing pointer to 0, suggest !E
./tools/testing/selftests/mm/map_populate.c:80:16-17: WARNING comparing pointer to 0

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
 tools/testing/selftests/mm/map_populate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/map_populate.c b/tools/testing/selftests/mm/map_populate.c
index 240f2d9dae7a..7945d0754875 100644
--- a/tools/testing/selftests/mm/map_populate.c
+++ b/tools/testing/selftests/mm/map_populate.c
@@ -77,7 +77,7 @@ int main(int argc, char **argv)
 	unsigned long *smap;
 
 	ftmp = tmpfile();
-	BUG_ON(ftmp == 0, "tmpfile()");
+	BUG_ON(!ftmp, "tmpfile()");
 
 	ret = ftruncate(fileno(ftmp), MMAP_SZ);
 	BUG_ON(ret, "ftruncate()");
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
