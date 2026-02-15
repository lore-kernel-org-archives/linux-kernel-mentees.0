Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F2063CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Feb 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771167052; cv=none; b=rUD5ja3yNJbxK3cnQU3tREfb6fSRN0UB3KXU0WH60dV4fhzJHAqWr6ip42fWtfd1ovAUobFuhIdZig6ikDdjtExUJ1VqF1rE4wOH0U+8KaBbMgWw6mPdNugEgBE/Qs+m9MaJ4MelulGSprmXavJlpZm/s7F72Dl7zdJ81jBhp9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771167052; c=relaxed/simple;
	bh=Vti/YJVHDuTuliyFa2Q54HVg0ETHZEM0OfBnZ3iq6ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iFacrv7HWvIsqJ52F4FSNAy62p6fZ9KWwwzbE7xphBPsn+T658vjhFxHn8tt/dg9ZcAsB/WsgueMqisZb9fu5+YT5g2qJqtCEI4FZGG569R2lsSrlR/EojRksF4/MO1OCpnR81osIGpvjSEldZRiFZtqqJn26dMG85F90Tzp3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=UcpZXmSW; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="UcpZXmSW"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9AF0608F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Feb 2026 14:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzmZ-KoJVE10 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Feb 2026 14:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.252.153.129; helo=mx1.riseup.net; envelope-from=macky@riseup.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E102860850
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=riseup.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E102860850
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=UcpZXmSW
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E102860850
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Feb 2026 14:50:49 +0000 (UTC)
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4fDTNn1YhBzDrQp;
	Sun, 15 Feb 2026 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1771167049; bh=Ny7oL3SRMwvaSbb4ve9ziGqR2pl78ktmcEvR81BBWbI=;
	h=From:To:Cc:Subject:Date:From;
	b=UcpZXmSWDIDWbGh0S+PVCULjvco2tJkWEFcMbzKi1khQQGVlUG3yISPu9ZXf8Nx9M
	 E7C3He/nds0p5nt7LwuD+LzmU5Vi9QiFFo6R/2Lvdl6eWjpXkoH2f3fjl8sK5wb2ZJ
	 t2keKMxStkmTDDeSdUzYn6Nn9Pr4e71z6d0dUr+M=
X-Riseup-User-ID: 0E9A10ACAB2C2953266BB8AA5C2E3E4C7CFD0A93DBE40D4F39C8297B99585DE1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4fDTNl4lgxz60cj;
	Sun, 15 Feb 2026 14:50:47 +0000 (UTC)
From: Hemanth Nandipati <macky@riseup.net>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Hemanth Nandipati <maaki@duck.com>
Subject: [PATCH] Makefile: Add extraversrsion to makefile
Date: Sun, 15 Feb 2026 20:20:42 +0530
Message-ID: <20260215145042.2680447-1-macky@riseup.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hemanth Nandipati <maaki@duck.com>

This is done as part of The LFX Linux Kernel Mentorship Task

Signed-off-by: Hemanth Nandipati <maaki@duck.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 13107aa0a..bece8cf41 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = LFX-Hemanth
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.52.0

