Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207034F4059
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675010; cv=none; b=g5rwoTPBUFRK8Ni+p0XnS2z2J7Ulm8LAaCMmNq1NnY61ZapQ4xg0Slc+J37pdIhUlb6W6gPxfyziNmnvTyMVHmMeXbQ0IS49qiUIRvJESo+gVd8vEY/fqzE9JIMld22ZekAfceN8gCjK2turysq4i1U5ebjoO49IEBjHPErr0nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675010; c=relaxed/simple;
	bh=OdQgp1gL3QtlQrsCyzRykVIHp+LSRj6Wvz9fNOlGfq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoEa50X6BlP0JdiFMlLAE+6SWaj1qdYhWTsmzJmf67Ge48S9VHyPO1GiA43LddELJthMHh4cPfppAn8gqE2wzfvGqekttqbZLesqIAwtOiKFIFnEvJFuHuMjcIpwoG3d2j+0CXAdZ2a8t6oDPkqyLSa1ilq83SpPyNOUcoY70EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9WMqnuT; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9WMqnuT"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-347866278b6so941926eec.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790675008; x=1791279808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMNDGpCcXlVn+K/qHQzmlZIK4VMU5usMdqSK6Jfjkss=;
        b=B9WMqnuTUpfgJenwn+Os5Zo9mBcHS6u6JP/LnEFKSmPhh0z4GM40yFv4v9zM+sBkh1
         KoqVvNMe8TOVWboTWUYimsp7wVHC3v06Jv55ddAxtvi8amDYqhfiQNmmXozrARO/DDff
         D9PrkIlc+PlphfEQXr4Q926w0SD8y1+XO5oLUtnV/iu5e60+Inka6dpfXBJIk6wt6yyY
         yVORizzhlUjEuaB1RN8eDAyVCEWb7dr38o6nn/v2nugSaciI5N0+BOrEzAv2X/aM5q0b
         dibbmOR3yPuvsOs97ZsORr63TumVi89PS96WIkADHMQnwfWPLkjBa7VFryTMtqx94gYK
         KqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675008; x=1791279808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMNDGpCcXlVn+K/qHQzmlZIK4VMU5usMdqSK6Jfjkss=;
        b=D5EwBFau6kSdliUAsomubsXXss0woqkSdXHpBMkhgf1MWwy7+Qrwuo771l01JhNsAU
         99YMz2suJjKR2lBiipwebZvWzATkQ6ggvvuy/kUSMRpKSJkRVMrKiQXlUjcd7eA69tMG
         PwBlOUse6ZT43QISvVt8+9y7WLB/VXKJqkl6MLegGdduhMjJXEgNX6egQ59CypNzvn3u
         i5qRQSVRJJ9BrsjUEnRlvMLIFVe1pxAXsj4z4x/Fp19VbGbRg/0FaYgXWoteIa/6busU
         u1oUdV42JtMXdBChJaRRlHhRv+uSUT52U2X2ul0ZV+JezSHjwZTbXAEL2a+vCM2nv+N9
         8U6g==
X-Forwarded-Encrypted: i=1; AKwUvBwxHzzXcJ5Sad0BEZEo6BcvnwdntGmBTH0AL6KfcMZFFlXpmO1GI6ibGYVTViUUhxGf/lRN2SZ6apbNvd/ksupIuOyPCQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKLD58EGenDbNqzB2Driso58S4/nnQtmzlcSTtpqM3I1/GSBaS8
	RRYas5uUke6MbCzI5HypKqak3OTx4TnDMbZmu3VB99MifBY5Zbboh3b2
X-Gm-Gg: AYBFou3cP2/oYZL3udCE18oDzAC1JnuvhdkwKEbwEYNutl9X9mB03tOk5A0ExVsPioU
	AETNdQFOm5IXT95raBttXDDegGJZZUJJsjTbS+oIgAACtka3FMe50D9abwOOvSMb/BhQa8oyCiL
	JOZRAy0/9vsezNYfF5+cDXJN536PoiyDnmYRuxedNnxMmKBYebADSYkshRwLyk3LG753Igh4xMb
	eXZsI9r8c1TuF1FGa1IVEoIxs3BmjhgHqExYpS/6CP0bYVSFZV6nN3/5eq9QqcYwUcCttNxC9OZ
	a8uU32Qfgb101pKGGIFvdp5dS04JOXEviESQiO3uMTeclWeJ2FDq5w1p2dvOwHlT/4oCx9jmTRI
	kj1BeYrsP7YZDZSzsoe+IdwDNUZoptujEgTG9FrUJOjmHmBekQtE6Olv5JjjT0GakFrW2PFJgoF
	qJdmNduF6I1WjiaOmIcdJdqgnxOeQab5W+BA1j0u4kPlA4tCQoMXkCK6Dkrg==
X-Received: by 2002:a05:7300:3e95:b0:33b:c29a:7c3b with SMTP id 5a478bee46e88-3426cddfb00mr11220105eec.0.1790675008092;
        Tue, 29 Sep 2026 02:43:28 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a5ecsm36247742eec.3.2026.09.29.02.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:43:27 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] sfc: fix kernel-doc description for efx_ptp_timeset
Date: Tue, 29 Sep 2026 15:12:11 +0530
Message-ID: <20260929094211.48125-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove excess @valid struct member description from

efx_ptp_timeset.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/sfc/ptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/ptp.c b/drivers/net/ethernet/sfc/ptp.c
index 6ca9a75af01d..00cfd8d5b46e 100644
--- a/drivers/net/ethernet/sfc/ptp.c
+++ b/drivers/net/ethernet/sfc/ptp.c
@@ -193,7 +193,6 @@ struct efx_ptp_event_rx {
  * @wait: Number of NIC clock ticks between hardware timestamp being read and
  *          host end time being seen
  * @window: Difference of host_end and host_start
- * @valid: Whether this timeset is valid
  */
 struct efx_ptp_timeset {
 	u32 host_start;
-- 
2.53.0

