Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D677C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Jul 2022 23:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C9960B8B;
	Fri,  1 Jul 2022 23:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C9960B8B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CK3D30WD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImMYLV7mRI4u; Fri,  1 Jul 2022 23:50:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C3E5660B63;
	Fri,  1 Jul 2022 23:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E5660B63
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C720C0035;
	Fri,  1 Jul 2022 23:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD1C2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 23:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B815583F96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 23:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B815583F96
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CK3D30WD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBP7K_h9T693
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 23:50:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF00F83F95
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF00F83F95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 23:50:51 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id v126so3740189pgv.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 Jul 2022 16:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=lUunwHyNFlWxn7CBOkJXyu8o0Ko8Y5ugduNELtZTizE=;
 b=CK3D30WDnDWwoyk/UA4J4TO1n5xuAzz2TYidZPUXANdBMakgsyztxd+Ynjqg043Ehg
 nWPvvI/qq7qd/H2A2FPEiHerffbBc53F3Miehr0TS1BWrupV4Ddffb0W8Ug+G5OYhODf
 CmFy93lecy1xVl/fNsR3PximQfzgEiLc8LHG7evPKJ6ru35qymjIapLuFwXxK0QN9RZO
 VUtp0mSbalfOpbLaCOnJwLHaiQrrCuTpptv3nr0i7n9jeCqGz+V9+8/ST69YfU65uanq
 t6PMUWNft5feBAcsIlbDiLoR1C8PtQAsKQgxhZNVaqfv/WrO/YbChP7vuBXhG4pcp1a5
 3uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lUunwHyNFlWxn7CBOkJXyu8o0Ko8Y5ugduNELtZTizE=;
 b=nsRTwy71k09BKz+zoxbusC6Xi0yMPCgBZlLE5DsZDudGF9Nf2gDZD6/ZIzMxMTJiAy
 ojGv1i/iqBGQUBLrL/PWg4HXSfI3sfsFui/ALAxhR/+XsB0VK7fDm97E7LMEKHsGgUHQ
 2pAt6NKXhdUQsgdqY8AMBoA1AKKgsAUcp+OjXV1N3WE99FKm8XrpZFFQkxQ1B/LtYgnr
 pC+6ooBAKxde0dOf46TKrgbOQR59EoSw7adk7defgnBC/E5ytIcedt5pfHqsSZHbv9yb
 8pf7sYT1Mumc7NYRTpqNvOr8PT8gON4DYdM/yE1ARrDh2R1a8mkBxHoKNXsm45joofs7
 k1sg==
X-Gm-Message-State: AJIora/WZXkaB/8JH2tYhR/hb/PdKdl5a1Xl2+G6SLxAhFN3Zw1Q5Lev
 Aj4E0Kd2+5K88X9N1O2pzRXfcu6dvlFjcg==
X-Google-Smtp-Source: AGRyM1tIiRr7gL4zRQ8r01ECBX8J9nYELJqRwmYw/8tGfFJ87OFAdjunUQrbT3DImzZ1pOfVp16J0g==
X-Received: by 2002:a63:258:0:b0:40d:3156:6d61 with SMTP id
 85-20020a630258000000b0040d31566d61mr14543188pgc.190.1656719450970; 
 Fri, 01 Jul 2022 16:50:50 -0700 (PDT)
Received: from Negi ([68.181.16.243]) by smtp.gmail.com with ESMTPSA id
 jf1-20020a170903268100b0016a4db1342esm16068845plb.193.2022.07.01.16.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 16:50:50 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
 Pavel Skripkin <paskripkin@gmail.com>
Subject: [RFT PATCH] isdn: capi: Add check for controller count in
 detach_capi_ctr()
Date: Fri,  1 Jul 2022 16:50:14 -0700
Message-Id: <20220701235014.13025-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Fixes Syzbot bug:
https://syzkaller.appspot.com/bug?id=14f4820fbd379105a71fdee357b0759b90587a4e

This patch checks whether any ISDN devices are registered before unregistering
a CAPI controller(device). Without the check, the controller struct capi_str
results in out-of-bounds access bugs to other CAPI data strucures in
detach_capri_ctr() as seen in the bug report.

Reported-by: syzbot+9d567e08d3970bfd8271@syzkaller.appspotmail.com

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/isdn/capi/kcapi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
index 18de41a266eb..6175ff7ec749 100644
--- a/drivers/isdn/capi/kcapi.c
+++ b/drivers/isdn/capi/kcapi.c
@@ -563,6 +563,9 @@ int detach_capi_ctr(struct capi_ctr *ctr)
 
 	mutex_lock(&capi_controller_lock);
 
+	if (ncontrollers == 0)
+		goto unlock_out;
+
 	ctr_down(ctr, CAPI_CTR_DETACHED);
 
 	if (capi_controller[ctr->cnr - 1] != ctr) {
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
