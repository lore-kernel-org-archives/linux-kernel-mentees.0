Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463543D3AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718569970; cv=none; b=Fue97VOu7+WN4FV0znvI9bnVM5fYd3yptbygLDwvFF4DFyz8ZzleNayl5a8m6/N8FykRSO3tEEv2pgrDFtEOXBfuo5j97CfcMf4EgSnL2fRaFcntx8TF8gy3VEgp2qVfsZmHXFIiU68b7IDJzL3zOy1EFv3spmtqaKMACAUlkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718569970; c=relaxed/simple;
	bh=ia4edk8RmfbVzS93m+pKUdA00RtrRqwyHnd3U5dDO60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EpX4HEUQpfb7+v/EnQdNsi/tleL8vHAKHq4tqm0bs1EEWFmGD5CCu0q3P0PBPonIrSMQLeWwpvVLac7OLWm/dOlD4PQPenCJi3qOh8bkxiNreSA/CXomwgugPFb8oLQbgOhKYzpXXFQrCtQiBMpceitSxrN0gjIR3NBMwUxhBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXH9LbDk; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXH9LbDk"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5873607F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 20:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuQbIAkod0Yw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jun 2024 20:32:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=av2082000@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08551606BE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08551606BE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WXH9LbDk
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 08551606BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 20:32:47 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f44b5b9de6so29618255ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718569967; x=1719174767; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ruQzJtdDUUq/rH+dZqwFNhNxz0nTDbK3w5CfEy2fEI=;
        b=WXH9LbDkhNqnsN7qkxyl6ViSFrqxGNudQeAbVXQ3FYepbKzqOulvdgrIvuwIDqx6JC
         J9AoLXhcs50M3CDTURQ6SsUq0LDnCITqRXeoBPvjjq+r762Dwl2e44RbzOC19tbgkZqo
         kp9ZW2WTKVFWg/vr55Np5a9UmUjemq5EdY9YkcD+fX95XPttXg9PdVL4zbHtwp1OhDVO
         +gC34F3g2KqiFkNW/yV1F5YE65h2h0nCUnt5CPxxmDh8IAKc5TjBV1i/AjiapLtP8HY2
         u3vn4KnpO+4VxFeVCjLZlzL//XOKjSdvl3XHO7Ebt5ZL97ZL3hqEuYEZR4fwr7nKMkOZ
         T8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718569967; x=1719174767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ruQzJtdDUUq/rH+dZqwFNhNxz0nTDbK3w5CfEy2fEI=;
        b=faAE6RSVi98CEfj8XOuojpWxuxoPyn7Xbjc1sj2esqhCF/yE7GhKHPa+RPiKvWvFyp
         WDL4EIrbua2awEDnyR4D9D/BbgE3f6xGtaPdiyww4zxq+AmVoNuhHzWhRfe8qh0NQaj9
         gD4xdK/mZDqv96msQjZVYB5z0ysmv7rX5ADJttaYdb/Q70TopERtKYHcCCuh6GgT0Q9Q
         rLzJuHQQ7QIacbV3jXpeniN3lrdy9uVTm5FCJWX0C4B0YnT2UBfeAXMRLaKK3irNUun9
         WIjGJ2yG+ww3SVCV+pdK5GzuzB5C5TfI7KDAjMLD4LCSm0U6kmfmLzr5uXBylt49MFm9
         y/4A==
X-Gm-Message-State: AOJu0YzEYctWimZX0GI794ceP5KgjiqwvUxR/BPEf2LeqV62WFiWSLHl
	YOVBeBi0w4c0OWwieofgyBtJsBf7nVAIP6sALQPzyvk42fA6Wi2t
X-Google-Smtp-Source: AGHT+IHttRPT+l3u7KhI0+XnNjSbaauE24Xxu5vcXgX8eJpy16mVVB7TSc2rxGcJwba3DyjXRzPUMQ==
X-Received: by 2002:a17:902:d4c4:b0:1f8:44f8:a364 with SMTP id d9443c01a7336-1f862a167a1mr94641395ad.48.1718569966812;
        Sun, 16 Jun 2024 13:32:46 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:10da:1462:6c5b:68d6:dcd3:7aed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee807fsm67611455ad.155.2024.06.16.13.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 13:32:46 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com,
	skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	av2082000@gmail.com
Subject: [PATCH v2] slimbus: Fix struct and documentation alignment in stream.c
Date: Mon, 17 Jun 2024 02:02:31 +0530
Message-Id: <20240616203231.43724-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The placement of the `segdist_codes` array documentation was corrected
to conform with kernel documentation guidelines. The `@segdist_codes`
was placed incorrectly within the struct `segdist_code` documentation
block, which led to a potential misinterpretation of the code structure.

The `segdist_codes` array documentation was moved outside the struct
block, and a separate comment block was provided for it. This change
ensures that clarity and proper alignment with kernel documentation
standards are maintained.

A kernel-doc warning was addressed:
    ./drivers/slimbus/stream.c:49: warning: Excess struct member 'segdist_codes' description in 'segdist_code'

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
Changes in v2:
    - Removed `static const` keyword from `segdist_code` structure declaration.

 drivers/slimbus/stream.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 1d6b38657917..863ab3075d7e 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -18,15 +18,17 @@
  *		and the first slot of the next  consecutive Segment.
  * @segdist_code: Segment Distribution Code SD[11:0]
  * @seg_offset_mask: Segment offset mask in SD[11:0]
- * @segdist_codes: List of all possible Segmet Distribution codes.
  */
-static const struct segdist_code {
+struct segdist_code {
 	int ratem;
 	int seg_interval;
 	int segdist_code;
 	u32 seg_offset_mask;
 
-} segdist_codes[] = {
+};
+
+/* segdist_codes - List of all possible Segment Distribution codes. */
+static const struct segdist_code segdist_codes[] = {
 	{1,	1536,	0x200,	 0xdff},
 	{2,	768,	0x100,	 0xcff},
 	{4,	384,	0x080,	 0xc7f},
-- 
2.25.1

