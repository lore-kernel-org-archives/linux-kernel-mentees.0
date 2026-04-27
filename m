Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4897E30E0F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Apr 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289895; cv=none; b=LX7lNVHvAVA/FlVIDp/YvVECPRunvFgmJuCfzI3SOiJDfBnIp8fkSh9z0hz7wCTxJjjSYrmnEuKmMxQSTaQFoi7O0Okd2DQ2voTZ67PCe7CN2Gg7EpoUqPRgFimASKSqolDO93mGYoo33rfUa9NAULi3Ij+czNl68l+NB8JF5qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289895; c=relaxed/simple;
	bh=gr87vO7k7YMlZdUQFWylGoPaj0SUoVjElzGyliKmBIY=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=UHtaPszNOVv35muVLJZ0jMnkzUhi+KPqheI5p67HoaulmBrj5squx8h9Qk6EGJ30S/TFpZ1krCNBdYAK/2CK6fzikRbLm9sa2pcKQrwquwoBNxUWXmKucmEDpgQZhpJy2wUzrhD+C0LEG87uEwtvTV+7ODOAMmIv5I6LuQpdg9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=plos.edu.ci header.i=@plos.edu.ci header.b=MuzvRexy; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=iW9CeCUA; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=plos.edu.ci header.i=@plos.edu.ci header.b="MuzvRexy";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="iW9CeCUA"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B141A6F69A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Apr 2026 11:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.694
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0hrt_ggqBRp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2026 11:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.251.234.52; helo=e234-52.smtp-out.ap-northeast-1.amazonses.com; envelope-from=0106019dcebb86ea-79eaa26b-e4e5-4b14-b6ef-0d546b49ee9b-000000@send.plos.edu.ci; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 665896F699
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=plos.edu.ci
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 665896F699
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=plos.edu.ci header.i=@plos.edu.ci header.a=rsa-sha256 header.s=resend header.b=MuzvRexy;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=suwteswkahkjx5z3rgaujjw4zqymtlt2 header.b=iW9CeCUA
Received: from e234-52.smtp-out.ap-northeast-1.amazonses.com (e234-52.smtp-out.ap-northeast-1.amazonses.com [23.251.234.52])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 665896F699
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Apr 2026 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=plos.edu.ci; t=1777289889;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=gr87vO7k7YMlZdUQFWylGoPaj0SUoVjElzGyliKmBIY=;
	b=MuzvRexy0q/Hf1UkbqVL6Cc+XTtdNMTn341+gsONnCobEclByd7cx6CV1jVnZ0C6
	PQN3X6iamQPzTBynvl2XCfaI4VNbsS9h7IBvdOEo+ZmKoQHT4ILp8O6Vx1cBistS4OX
	z3F4k7xPDwB+QaJgAfqSXrIeG/ROV5l7QcJ/V4+4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=suwteswkahkjx5z3rgaujjw4zqymtlt2; d=amazonses.com; t=1777289889;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=gr87vO7k7YMlZdUQFWylGoPaj0SUoVjElzGyliKmBIY=;
	b=iW9CeCUASEPkmUoGSb+E0cWMOi1Wr8qNFBUdWtXlpphMgKw5qbScqclspuVN8nIU
	kvCCHkLKLII3R8WSkJoU1E2wuvjctkyIjNE6299OqW2SRiVv7leS3obOdZrL5Ed7/oz
	SagsHxYqRztQld9jOwtEpB0T1Kl2tdo0IjkJ2uGo=
X-Mailer: git-send-email 2.54.0
From: Xuanjun Wen <wendster@plos.edu.ci>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org, wendster@plos.edu.ci
Subject: [PATCH] kbuild: add custom EXTRAVERSION for LFX mentorship
Message-ID: <0106019dcebb86ea-79eaa26b-e4e5-4b14-b6ef-0d546b49ee9b-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Mon, 27 Apr 2026 11:38:09 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.Q7iknRDCKgadjJP5k3mWOzW4msDp9B7of1cg7Uf4R52cgtm5G0IOaaxbwD/z0fL9/JBADdmTHFn8c+pLvs1r3Pgzx10ekVLuyuFPbrNs1lXNhD10Z1GgoKFs1dKNa5AZ3FLu2DfV+7YS/5lBaADSPKsHoczLfGjIYo+CmwM/VHJK8tz0c+75BL3rjm2MKRpF:1.ap-northeast-1.TOS0vxEE3Ar6ai29fkp2i/jb+l2iigajCGeLfF7S3sk=:AmazonSES
X-SES-Outgoing: 2026.04.27-23.251.234.52

Modify the EXTRAVERSION field to include the '-wendster-lfx'
suffix as a demonstration of the LFX mentorship application task.

Signed-off-by: Xuanjun Wen <wendster@plos.edu.ci>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e27c91ea56fc..e398b043e822 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION = -rc1
+EXTRAVERSION = -rc1-wendster-lfx
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.54.0

