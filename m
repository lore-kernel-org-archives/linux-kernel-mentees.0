Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B60CC3B186
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 14:02:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E93620870
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 14:02:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTdHcoeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E93620870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFD2386447;
	Tue, 11 Feb 2020 14:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6WSEIOHM7M6; Tue, 11 Feb 2020 14:02:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED9938646F;
	Tue, 11 Feb 2020 14:02:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D28C6C1D80;
	Tue, 11 Feb 2020 14:02:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 976B9C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7CC7E8266F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xi60OeM9RCs1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 20B98823B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:00 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 6so5797898pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 06:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJEO2wGMQKJV/ohpKPyAeBTsL/tteXWNt2JClbfnv8c=;
 b=TTdHcoehFybxRnpxrE9970V4uoBp61a/a4yvdGqQcF338YHtr3/X/2l6DiUvMxHiRf
 TU3IJoIw98hGtjNHps5/37RafyS5cv+TzthIs3ADfA+F59rhZ7g8WixCu20rMLJJR295
 VWNW6lNrFtnasaNJfsqDpf24GW1NtjRKF7+FikAd5Yd6uxIXlpKihUVwrzi//4yChfY5
 Rx9FILhQtp4nUIM3HPfHmzXzW4t3qkwD/xP+Zfv20kdHa7E9PZXhqyewD1hj8iwrfLy8
 B9vNOWYiFBZV5yHiIqkv+fJmdzdUTA6WV5sgn+f0mUkWN3Vbrw2bq/g/X791RVrTA2ZM
 Rq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJEO2wGMQKJV/ohpKPyAeBTsL/tteXWNt2JClbfnv8c=;
 b=fCuS2qNMbG+UrP5Cpg4c6tkczRpeHINt7TVkXPSBL1+2+chMPYLrsFHR9pooJWxdpq
 N7ocyODsJDIITmYd4GWvMnxTIgJB86igdpuWdHzIh8PwgNqrvztu10/Z5Q9ujMRAJ3fp
 LwWhOPb9NPC1b9FQDv28xBEEXh/MJ8nXA8UaIWLsVb7BbS4fGHv+8W2fkKyVC9Ki7LLP
 JFBoxV4PVGZe4z2XoP9/6Zq+t+WONQ+wNwb8LFWWPy+5PZ9z0/7js9t8qOs7WiUSFpxY
 s05HS260OTrzLqoiNeIk5UJMtVaQeC4CbNDjSEtV6mwm5CZmQapB2f04Squ7z+EJcjJB
 hogA==
X-Gm-Message-State: APjAAAXvVRgkTjXV6g2Wpa7P8ZkqCe7t6J5B6bbB8iN4mp0tuq4NeeFm
 /iYjVCTEbNIJEi854qOFpCaTX+4U
X-Google-Smtp-Source: APXvYqytyOepmttl8yIXfongmNaFy+5daVnKlRgc2Q9Kj4mkbgvLSGyDivcfJt/8DtVoyYqKfWsahg==
X-Received: by 2002:a65:5ac7:: with SMTP id d7mr6896958pgt.175.1581429719544; 
 Tue, 11 Feb 2020 06:01:59 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id z26sm4203575pgu.80.2020.02.11.06.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:01:59 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 11 Feb 2020 19:31:36 +0530
Message-Id: <20200211140137.2304-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
References: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v5 2/3] tests: Add space between *
	and const in ptrconstptr.res
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

A space is now added between the * and qualifier. Reflect this
change in the ptrconstptr test case.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/ptrconstptr.res | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/ptrconstptr.res b/tests/ptrconstptr.res
index f5b2210c..1d0c3c1d 100644
--- a/tests/ptrconstptr.res
+++ b/tests/ptrconstptr.res
@@ -1,3 +1,3 @@
 void main() {
-	const char *const *y;
+	const char * const *y;
 }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
