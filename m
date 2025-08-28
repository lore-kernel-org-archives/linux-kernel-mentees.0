Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2230E84F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756381360; cv=none; b=BovPKB6QdiSgMauwuNlZrIaOPn0I9uL1vKn6T7p3rUJb4baOy8f7WrYuLpNd4nWLorXwMTNDHmzITYSaTpTyrgTSpacOzKo+Y745xUL98Hml4yyxJ1ploWPKzt/mkuuU3mT4PC7QTkwGuFaWFiyaSrU2QOdai0+2RtcYV9JXlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756381360; c=relaxed/simple;
	bh=3kSZhBrKvz2aAzAzrAw6TsTEbys099B0Bx2hGX4t6q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHZBkPTbe2ein3G9gDVL/nVwf3PdXevNfDLhKTNi6PQFbWjN+0/sClqS6pu3z4ofdJ5vVFvwrBJWBSbA0yRSHB4055c8owxDE1akkkaEM1WT9rl2mF4S7MPPMeH8KUNZ1AZs5bFalkob7c03GZ+PkW0yR4vh6i2DMxJqeqM+2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTmHnZtW; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTmHnZtW"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FB040C39
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 11:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz1svWjtLbsn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Aug 2025 11:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6D6940411
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D6940411
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OTmHnZtW
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E6D6940411
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 11:42:37 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2488be81066so1850675ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756381357; x=1756986157; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zz5OdET14bvbaoUZxADja3Cnod6iht4siGFZlr3OPzI=;
        b=OTmHnZtWA91uQYKhYPB9MjMN+nWyK6xriSVfr2HBcoRHJuJ/d+hbUyY+I8D90zMz5h
         8Rrpivnw2ZT+shKpPun52YEDI0H6SsUC8WEqPVia6bVlN199DtEQP0gMUqXXkvG+nl9V
         SyK5N4tOXTETzzMiHqto5vfyCmz0RciKdCzfMuw9OnQWGSv32Q9a5sC/PjpnWRFjrhhb
         2MLbqXAq2YJywG/bJYkhED6sGmeyfwGSF/KRTE+fos6y4HqHUlJe/3Oei76m2FUo4t0R
         U9QaKukGKyn7+BA9BAhDelZ1m7jW1Sddd8TFs8Jpf66gwGwkAmH18ldttHaLW35lq72K
         E+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756381357; x=1756986157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zz5OdET14bvbaoUZxADja3Cnod6iht4siGFZlr3OPzI=;
        b=TypW9Ok+vnmRuLog95pfvArj01YXn03k54W2JK8DE7Rt3qPV2Y8xH/9XxlsLo36pXn
         6lm4LugSzHJYr0PNXxm58Kbr4gvvmdKvvvQdGXaBb9VQ/+FPiknVXzvhkodrdUpH0jJe
         BggOHvsw7zPGREvwY/nhCmc0H3zwZsgIBUSq/kKKSgbN+c65DHe3ZrkIvAW41l6Mj30b
         lHMypv9I22o1DkpbFvP+W2jvugweZ2c4uvbWnzg8yXsjB6LIbuV8kxKAUdQiq85HUCWE
         unGa9+TXlMZzjhtLkh/hCwzRyb0Nyy4y+nckk+32OfzsLZXJ2mjEYZwWt9y+AVG1iXIC
         a0Gw==
X-Gm-Message-State: AOJu0YzJ0kk8/qDsGZMIg1Xgx13qMwSPsNVf3Ag254fsQme8mHUIVWkI
	t1czMAexb8Pp2Tr3/3qbjTK2idXgI8dGvloniFcx4E+hGv/xjaEh38wv
X-Gm-Gg: ASbGncvuhFYYkUcOddNI7ETSn/Yb+X+5M4mq7/w4b+KYTayka1ZEE1lIlHRHC1d8xjp
	zO3EYHMpejKpBepy1hDYReAJva2okjzyn3QDoEpPn6Eit27/0de0uK5s+bzxJlac9px2iHu6jrW
	gWkWO5RfycWr9LgwlDhBk8kP6kL1CKnOsqM/S4HGFJvQZWmprEMfUkADahtI+dtHBUcior9ysmb
	8Og/dXXlho3VOjQcynVRLbIYUcvo/2oPd1e1TJm8Ag42jDi/m3cSACWVSVF2C/T2gn335aSIvjN
	qpeFINaSJY/pggFSu+lqbqRLFknRAs9tV/JOU2RLlOz4+5k8vlfLp3DiQ35DlS/DzOkKFgUvgXF
	DCW8/71JQtT0ZvyUUPNaRN3TTTcvj
X-Google-Smtp-Source: AGHT+IGddHuFzGZuA8gyKj/JALukMUHFV1egCTs+17Xm1ZCD3HJRFq3WUNgi8BFJPyAK43GHrynRNQ==
X-Received: by 2002:a05:6a00:190e:b0:742:94fe:c844 with SMTP id d2e1a72fcca58-7702fc0c607mr15188840b3a.4.1756381357080;
        Thu, 28 Aug 2025 04:42:37 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:c01d:64c:3fe1:6c19:3ca8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771cd487f90sm11537306b3a.97.2025.08.28.04.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 04:42:36 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Ranganath V N <vnranganath.20@gmail.com>
Subject: [PATCH] net: igb: expose rx_dropped via ethtool -S
Date: Thu, 28 Aug 2025 17:12:08 +0530
Message-ID: <20250828114209.12020-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the igb driver does not reports RX dropped
packets in the ethtool -S statistics output, even though
this information is already available in struct
rtnl_link_stats64.

This patch adds rx_dropped, so users can monitor dropped
packet counts directly with ethtool.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 drivers/net/ethernet/intel/igb/igb_ethtool.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/ethernet/intel/igb/igb_ethtool.c
index 92ef33459aec..3c6289e80ba0 100644
--- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
+++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
@@ -81,6 +81,7 @@ static const struct igb_stats igb_gstrings_stats[] = {
 }
 static const struct igb_stats igb_gstrings_net_stats[] = {
 	IGB_NETDEV_STAT(rx_errors),
+	IGB_NETDEV_STAT(rx_dropped),
 	IGB_NETDEV_STAT(tx_errors),
 	IGB_NETDEV_STAT(tx_dropped),
 	IGB_NETDEV_STAT(rx_length_errors),
-- 
2.43.0

