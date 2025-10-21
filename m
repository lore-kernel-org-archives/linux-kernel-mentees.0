Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64523536C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761027714; cv=none; b=NjGQlJVr3mpS77mnl+FNdtabCsSR7CH1R1g3h3ICQK7rVut4XDcnoTFVBtimvZ0ypA96+q4X2H25fOlaMyVui1a1RfqaGpP7fVVAcc3EepVbP+PcYoVVkIAAVBkNV1zuyHVPUeFdc3wkCbIBpRGXqnnM2PkKbLELNYJ8GxvAUOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761027714; c=relaxed/simple;
	bh=dZkozO8XQpdvjUFyuS+7gnOquHi4UayCDzsqXQhtNTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F0BHR+oFzhxJD6FCzydGSJ1xzqerigotziiTC4px9Ymk8IyBoK4J4pjbxD5c318BetnRgiTXDrQWgko4lh8yEfAVsf8UgPf54M8gMVytecIlGN31KUeUL6YTWBlNE3e2HatKSBu1R5s9IuHqGqxb0KoJ4wMDsIhX1fS88AHezoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ngts1tM3; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ngts1tM3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22A4606D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 06:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xexDfaIscZO9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 06:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3233A606D0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3233A606D0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ngts1tM3
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3233A606D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 06:21:49 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-292dc9158e5so1181455ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761027709; x=1761632509; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQlJPMwH7nXKBtlf8BayDPI5AZLW0pym1gUfIZRSMBg=;
        b=Ngts1tM3p1oxTaj/Y9qjmEv0oZ31SADslX8wR9L749Bk80hM8CvKr49fzwSgr2B1Kw
         E5dvLckHxzIoY3VMC5pL7Uc0dg6HX0YmgenkErBhxIZ877PtCl/UEtw5Ai9M+zXLV9lK
         5sm3cepiMVoDBZcAG/N0JhYhm2qUcM1+2lvPaf1OSmfKkCTsobZCkOnKDrQWT7tnRcl7
         AItkDLiOJ1MEXomsWZm8DIjONHPyGx9VP7N37vI/pHCSl4AnoGDm2NiqbfrZ06GvROG1
         mf2y+CYucYRoSm2WysTfVK7/tCdVgy1PixTJKq1mFoU4paunjLb6nUgg+7vYQnkTLjRZ
         QS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761027709; x=1761632509;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQlJPMwH7nXKBtlf8BayDPI5AZLW0pym1gUfIZRSMBg=;
        b=BZnEuzb8bTS/jRJwgYRm3amvKMXGnHJbQXIWK3UBG2ZmC8XHXNkVGzdSz0J/zMW+T2
         9aedUIS9IahL16ggp+XFa3h6/rjEfVueV5uBY7h8anJtTGTi2ZHRnljor50cLBUevo1h
         rgf4sjtiNslLvfb8HtQxDMtCrN9WZyrv34anoScTBQYxBxM6F8i9DrXHeezzXVTP9PXT
         DdBRjJUABWvv+PWVcJnobESKx9Y/IZM6ZFaqH8x6Ztn9+BfNGp1veS2bv573JipSFuVU
         0KQF2hxbJ0m6HK4hSjAUhVkHF2WBUDcwDaUhs3Ux8JOSk4QOhUy7KMFKEM9PO5RKui8d
         ZS+A==
X-Forwarded-Encrypted: i=1; AJvYcCWsPKU6Lvj48WAiq4NiNZ7lwcfXfMTIuQfbcy7mciOMkKeugZQ2IBDewzpLKzysrNrfeWGT+zAKtOlJ9L7ozjduEkx67g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzZNCUGsqCsE652QJU7VI1Blg75gjCHt7zYdk29NEAvEem0pyat
	W2dl+NRGd5VA0ar91WSoWw5W/MN2GLPv2woglViAORg+QYGYTNDKpKGh
X-Gm-Gg: ASbGnct+Lsmvk+eaKY0jidqFgEA79m74zs6C8AVPiT/0knwgLjqFhHlKfItdpXWRdb/
	2yqjDbm4oee/B9zUY7W9IhW7EJlRFOcKLWeMWAq6mhNL4uxxYxItX6oW7FWitDbDCvEnoSDVVth
	bnNeNywcXbyRvV8AFc2NYveTlSVEcb+8nCgJp2Z7yAx9n1NR1f8pbOTF7AuTBF/lj73kub80ASu
	bMiLKlmQdamMUidF68TVe17gelOcDqVT6ak6Bvabf0mJZ1+EJUFqgB/Jp3ldf48w8MN6ulwS5vK
	z+lfri6MyuESSqAaCCZBMUSG1/raU4/exntTJvNMERM9+psXqZqX9g/elVwq9gPWZ5TjBm/ClIr
	ktLQJ+ejhoZGRRAu3DL8+BnrVgVjFOHBaO4YoupdItCVnY5yMtjO4cKKGm6eRk9H1zTWeXcXhdg
	baq3+FBv7kxZWvVm4vlfm1OAMNcxmiGlncsPVj1h2KcS1C2qECdkie
X-Google-Smtp-Source: AGHT+IFnYKU1IWC3pFF4gig1+6sBxnYeOxYc6mKh5U5SUBS7wKSrjBE45ao1Z4z/gFoNYWrq+4Y5Ag==
X-Received: by 2002:a17:902:cecb:b0:258:a3a1:9aa5 with SMTP id d9443c01a7336-290c9ae1a2emr116032215ad.0.1761027709371;
        Mon, 20 Oct 2025 23:21:49 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:c8fb:fb07:ee78:675f:132b:f68f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd7675sm99312855ad.26.2025.10.20.23.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:21:48 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Tue, 21 Oct 2025 11:51:42 +0530
Subject: [PATCH] drivers: block: rnbd: Handle generic ERR_PTR returns
 safely in find_and_get_or_create_sess()
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rnbd_fix-v1-1-71559ee26e2b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHUm92gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyND3aK8pJT4tMwKXcskE3OLtCRTIxMDYyWg8oKiVKAw2Kjo2NpaAAu
 FoCdaAAAA
To: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
 Jack Wang <jinpu.wang@ionos.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761027705; l=1897;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=dZkozO8XQpdvjUFyuS+7gnOquHi4UayCDzsqXQhtNTM=;
 b=8QUpn5dec1JVYKDwU5Xa1XxbcjpL/7KR847ZaE/4RWlNjTTdoPSifgcOluNBdI7zuQwTPonq4
 Lg9bICQrhrcCzpXhzvyxmrDrJeId3eud/lrfZjDvtA7HsqesYfvmus+
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

Fix the issue detected by the smatch tool.
drivers/block/rnbd/rnbd-clt.c:1241 find_and_get_or_create_sess()
error: 'sess' dereferencing possible ERR_PTR()

find_and_get_or_create_sess() only checks for ERR_PTR(-ENOMEM) after
calling find_or_create_sess(). In other encoded failures, the code
may dereference the error pointer when accessing sess->nr_poll_queues,
resulting ina kernel oops.

By preserving the existing -ENOMEM behaviour and log unexpected
errors to assist in debugging. This change eliminates a potential
invalid pointer dereference without altering the function's logic
or intenet.

Tested by compiling using smatch tool.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 drivers/block/rnbd/rnbd-clt.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index f1409e54010a..57ca694210b9 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1236,9 +1236,14 @@ find_and_get_or_create_sess(const char *sessname,
 	struct rtrs_clt_ops rtrs_ops;
 
 	sess = find_or_create_sess(sessname, &first);
-	if (sess == ERR_PTR(-ENOMEM)) {
-		return ERR_PTR(-ENOMEM);
-	} else if ((nr_poll_queues && !first) ||  (!nr_poll_queues && sess->nr_poll_queues)) {
+	if (IS_ERR(sess)) {
+		err = PTR_ERR(sess);
+		if (err != -ENOMEM)
+			pr_warn("rndb: find_or_create_sess(%s) failed with %d\n",
+				sessname, err);
+		return ERR_PTR(err);
+	}
+	if ((nr_poll_queues && !first) ||  (!nr_poll_queues && sess->nr_poll_queues)) {
 		/*
 		 * A device MUST have its own session to use the polling-mode.
 		 * It must fail to map new device with the same session.

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-rnbd_fix-9b478fb52403

Best regards,
-- 
Ranganath V N <vnranganath.20@gmail.com>

