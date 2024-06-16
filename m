Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C388F48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718552759; cv=none; b=cz70bVcnButwIrMwMezIdcKXeUOGhrIQUee5T9UbWCSNhBKsdxpiTLPTXQdHcmp/oeKWQyn57MFO9au98EakEaiCbMgt6/4yff9pcH2mNpdGuC1wI/QIORfSKEIkGzbScBrIymPO4kYEYn851DiefkD1RM4ddlWUNsC473/mbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718552759; c=relaxed/simple;
	bh=3156DIFjETCUi5nKVvfuBuAomo8aSmJgHYXpWsdSxO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GXtUGeAT+tdWokuFq6x4xxjutuF0kKV5pbVkTwTpejIP6D+HuxhabKD+RoQwaip8XzRFMM4lMQhxaI4ZT9qK3RZAzHZg+MtOs5eAUQRWA8ymUMF2K3u9VoMOellKghMV2VoLtBrIeH/fVuNFFLJU2Hc9r558HZRlo2aMNsVyf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diHxDjdX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diHxDjdX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 838BC81D24
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 15:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMJdU2qgLhZM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jun 2024 15:45:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=av2082000@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2F7081D19
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F7081D19
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=diHxDjdX
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D2F7081D19
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 15:45:56 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-705e9e193caso1042603b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Jun 2024 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718552756; x=1719157556; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7fp8UlyhTZugwgUTVEakWeUaqJf9C1Xu5hu6Y3OppA=;
        b=diHxDjdXRWsnUh0sNvda2Zix3imtSIQh/SkcxUjTciEyQytPPeTUbXWrbTI1yg5dqZ
         P2Qv1Njuqj60LSGzMmYE6TzIZcVepPalAF6eNL7pr+1Pg1yeYrlJwuxfbPyv973lloR3
         dMLEO8zm9x/IFQWAYOWnrQhTnLObDpN07ay7ibSnZ3McxGLgJYZG/TfO1xcbEEOuE+P2
         71v3xC4R85wI8lIZW2OTUze51UdOGRSKljRRE1lWWufIWmPcvDczuzv8oOEXnC/mXYKQ
         af6S5YG0cn3QcfS3ZSf8Q+zvGdWsn9dX0prLNB9lzimF4EBGs96tQYW+9tiYVYMOFnhY
         TalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718552756; x=1719157556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7fp8UlyhTZugwgUTVEakWeUaqJf9C1Xu5hu6Y3OppA=;
        b=NiCaBkeKvl627hferkAeiCTCH3D7tZweZFAcxlp2Rr/e/k2t2FsSb9esoFBCtqgJCS
         mGjSZFEpzF9DNKAM9hKN4jnmp+13k2Rg6aUgHNFyjwMSKALSELZgKJSut+R1gUpSOOup
         FJzUuyE+qS5WQ4i9RiEcNDxNCZJi7iKV4JpBZBayK/x7S9jJUnXQ18pbA2JEHX9sxOTL
         iKp00ye8UM0kq0Nfjtjd06Z3oWYQNbg9Q0tJO/c4+RrWTsjU1nNNwufvR6lM1ki5RAYk
         OXQOZV5o7GC1bOHzNjbDs4WmjuKoJzlxqISDKfrAZInPC5tPaKffgnD/etThuRaT9/7R
         JLuA==
X-Gm-Message-State: AOJu0Yz5dOc5Pd8ddXno6viaTelUGm7ao1aWZlwQ6DeY8BmZAo162zOY
	t0V2X4ZJC/ZMgGLV6dGCvubfJBleuhhmaB9h7+uS9IgwuuLqdHN3
X-Google-Smtp-Source: AGHT+IEeNwqXRCUbagaIZHN5sqtN03OgsiynC+a+Fqu36/lStwWRvh4U2rCQN9zhCCob0OV/1fcstw==
X-Received: by 2002:a05:6a20:7f95:b0:1b7:8d72:d00c with SMTP id adf61e73a8af0-1bae7ea1002mr7842615637.31.1718552755613;
        Sun, 16 Jun 2024 08:45:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:10da:1462:7d9e:737e:f8b0:47ad])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb90a33sm6063560b3a.187.2024.06.16.08.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 08:45:55 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: srinivas.kandagatla@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	rbmarliere@gmail.com,
	skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	av2082000@gmail.com
Subject: [PATCH] slimbus: Fix struct and documentation alignment in stream.c
Date: Sun, 16 Jun 2024 21:15:31 +0530
Message-Id: <20240616154531.38232-1-av2082000@gmail.com>
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
 drivers/slimbus/stream.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index 1d6b38657917..62661211a409 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -18,7 +18,6 @@
  *		and the first slot of the next  consecutive Segment.
  * @segdist_code: Segment Distribution Code SD[11:0]
  * @seg_offset_mask: Segment offset mask in SD[11:0]
- * @segdist_codes: List of all possible Segmet Distribution codes.
  */
 static const struct segdist_code {
 	int ratem;
@@ -26,7 +25,10 @@ static const struct segdist_code {
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

