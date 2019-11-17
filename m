Return-Path: <SRS0=54Ti=ZJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB583C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0091206D9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf0+ba82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0091206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 96DC7865D6;
	Sun, 17 Nov 2019 17:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6eYj-VJEdgNl; Sun, 17 Nov 2019 17:25:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B63568637D;
	Sun, 17 Nov 2019 17:25:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEAF5C18DA;
	Sun, 17 Nov 2019 17:25:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0C02C07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8EA0F203A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CUb2kunU8gM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 1B5F820113
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:23 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id ay6so8294117plb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 09:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Av+HK2/LnryCPXE2pMFULV8E1x0dPwk+5aKFWr2QtjI=;
 b=Mf0+ba82SJuPDW/KRGoJ39qEHaJN1XyFmnTe/sOHGfrL/G03s5sXKSh636lcKRh/A2
 6f85D4EHRB7ZJiv8318Mo5zm4amTsR104icW1n+9iIJTYZnK4f/rZQ8HniteumeBacW1
 Sy6pH5BCjfW+XSgZzGLRfofHtkiC6OHGiGo/mBGtzAfUf46g8rU3e6+ugDO/u5b2H7He
 9Z0NV3LlVgJEa0/hfrbv1elnOG48S2hDBTUqxer6zl46RvHc9z2ay5nfsHlK6ZRWhrTb
 aK7T7SlO8WRlnd+HX+hS8D2XzbPUYyBrGiI3Lm5L/mJElj4EAya1RS2iXH52GFhtAcUS
 ui8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Av+HK2/LnryCPXE2pMFULV8E1x0dPwk+5aKFWr2QtjI=;
 b=O08vbKU26R35fC/Gb6uAlCBxLVRrgIi+o6uyOdpZ0Mu7U3Ldxvt74qBw8rrZSEB6LR
 qpjF+ZsvYp0pxqnxF6YEb+NRmmqw9Nmr/n9vQN/24rtGvYUfvw1pCxmv2mwMT1TEfYqA
 s0DTstm3dZGAY/gEH8de428U2Ep02FojqRPyiE9djU9pVFzr//j2+bkAl223yPb9JqQ0
 KUc/ZvRxXD9coAwUBxkoITa9pibtevwgCYLSesvlZIaqahN/N2v0h3eujvaXC/q7vy5/
 FDun6qmCDg3vxn66LSRaAAqVPSX5WYAmiQ9MR6kTeuMDkkl8DdQ2wEwflZQt87OhdqU7
 pe1w==
X-Gm-Message-State: APjAAAV52brDfCLC+t9Yi+If5mfw1gIPBjNk5mouBXk2oomnAyuixIDk
 mMkYG9uhcamhGemvd2YOEGY=
X-Google-Smtp-Source: APXvYqzqvLaGSfdo9LbLHMOc1Z7izkzBhpQYaSmZrWQF98SMARgzygYTo/2wpu3igIOVsfjsI9ETBQ==
X-Received: by 2002:a17:902:760d:: with SMTP id
 k13mr12997470pll.28.1574011522589; 
 Sun, 17 Nov 2019 09:25:22 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1662:ba74:f9a6:2aa3:8a9a:5581])
 by smtp.googlemail.com with ESMTPSA id x13sm18146302pfc.46.2019.11.17.09.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 09:25:22 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: corbet@lwn.net
Date: Sun, 17 Nov 2019 22:54:35 +0530
Message-Id: <20191117172436.8831-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
References: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: mszeredi@redhat.com, ebiggers@google.com, jaskaransingh7654321@gmail.com,
 linux-doc@vger.kernel.org, neilb@suse.com, linux-kernel@vger.kernel.org,
 tobin@kernel.org, stefanha@redhat.com, mchehab+samsung@kernel.org,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 christian@brauner.io, raven@themaw.net
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] docs: filesystems: Update
	code snippets in autofs.rst
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

Some of the struct definitions now have an autofs packet header.
Reflect these changes by adding a definition of this header and
place it wherever suitable.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 Documentation/filesystems/autofs.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/autofs.rst b/Documentation/filesystems/autofs.rst
index 6702a5f61f50..2f704e9c5dc0 100644
--- a/Documentation/filesystems/autofs.rst
+++ b/Documentation/filesystems/autofs.rst
@@ -322,8 +322,7 @@ notification messages to this pipe for the daemon to respond to.
 For version 5, the format of the message is::
 
 	struct autofs_v5_packet {
-		int proto_version;		/* Protocol version */
-		int type;			/* Type of packet */
+		struct autofs_packet_hdr hdr;
 		autofs_wqt_t wait_queue_token;
 		__u32 dev;
 		__u64 ino;
@@ -335,6 +334,13 @@ For version 5, the format of the message is::
 		char name[NAME_MAX+1];
         };
 
+And the format of the header is::
+
+	struct autofs_packet_hdr {
+		int proto_version;		/* Protocol version */
+		int type;			/* Type of packet */
+	};
+
 where the type is one of ::
 
 	autofs_ptype_missing_indirect
@@ -395,8 +401,7 @@ The available ioctl commands are:
 	anything suitable to expire.  A pointer to a packet::
 
 		struct autofs_packet_expire_multi {
-			int proto_version;		/* Protocol version */
-			int type;			/* Type of packet */
+			struct autofs_packet_hdr hdr;
 			autofs_wqt_t wait_queue_token;
 			int len;
 			char name[NAME_MAX+1];
-- 
2.21.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
