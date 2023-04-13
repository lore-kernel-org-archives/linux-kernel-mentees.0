Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4395C77B61
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Apr 2023 09:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53A45613B8;
	Thu, 13 Apr 2023 09:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A45613B8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=benbenng.net header.i=@benbenng.net header.a=rsa-sha256 header.s=gwkuid74newif2lbp44dedrl2t4vmmbs header.b=dlXM0RiS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=O5xpWDes
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzn_qOSenHgp; Thu, 13 Apr 2023 09:28:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3C2D3607CE;
	Thu, 13 Apr 2023 09:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2D3607CE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17447C0036;
	Thu, 13 Apr 2023 09:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C4CBC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Apr 2023 09:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0234F41173
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Apr 2023 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0234F41173
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=benbenng.net
 header.i=@benbenng.net header.a=rsa-sha256
 header.s=gwkuid74newif2lbp44dedrl2t4vmmbs header.b=dlXM0RiS; 
 dkim=pass (1024-bit key,
 unprotected) header.d=amazonses.com header.i=@amazonses.com
 header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono
 header.b=O5xpWDes
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iH9BdYkuV_1u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Apr 2023 09:28:21 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3A194116C
Received: from a11-16.smtp-out.amazonses.com (a11-16.smtp-out.amazonses.com
 [54.240.11.16])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3A194116C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Apr 2023 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gwkuid74newif2lbp44dedrl2t4vmmbs; d=benbenng.net; t=1681377673;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
 bh=iCGZGKi5slX3+1EbZTs0K5lMxThH+s23lVBYdgse0I4=;
 b=dlXM0RiS+bkfvggjXjPyBfra2Ys+k+cPbgT4qIBDtC9qV7H8zF0wgVzGG0/nJfRA
 LxR8YxEr2hW86KQYAzg+NDcj2ZJi/dSwj5OEjtIcHVr9imYmF/QZVAEpBB7BHhF1Jrc
 yRzzUaNovUpPZ4qeQfpcgSfNq0v6g3iWyckCfifIBu7vwuEVFAS3KoxK+aJkTqacubu
 2Y3xtkdqp6Z6MLlcIsuZx4Iij9oPVmxmSlbiypjCn8HP3vUxdamXbnZwXMnDnLxgxpd
 tKhGWmm2rbjM1kdaMYFNILIV1D7q0hLTsDbu5W/4e5lS+o0vdTHExkzku7K8yPJrHr7
 8pEdPHNA4A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1681377673;
 h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
 bh=iCGZGKi5slX3+1EbZTs0K5lMxThH+s23lVBYdgse0I4=;
 b=O5xpWDesy/hJag71jGjX6AgswpCtnGJulyPR0BS0RRk+bCsgMW/CnnteBDlOoNHh
 0kAjpSf6xKrUhzfCsQYCuy4FYY2Z3YGJ2iLQ1+dJ2hyfCHtMxwikL6SmQFV8TMdKzKy
 jm5wIM89DS99ICEu30a1OGlfYn20ugayypjSMF88=
Subject: [PATCH] Initialization of read buffer for dib3000_read_reg
To: =?UTF-8?Q?mchehab=40kernel=2Eorg?= <mchehab@kernel.org>
Date: Thu, 13 Apr 2023 09:21:13 +0000
Mime-Version: 1.0
References: <20230413091841.22000-1-kdev@benbenng.net>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZbelJ3+E1CTjNR3uk6Rz3nyFiTw==
Thread-Topic: [PATCH] Initialization of read buffer for dib3000_read_reg
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1681377672
Message-ID: <0100018779eb40dc-cee9e39d-5d87-4733-83db-eca5218fcc8f-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.04.13-54.240.11.16
Cc: =?UTF-8?Q?linux-kernel=40vger=2Ekernel=2E?= =?UTF-8?Q?org?=
 <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?syzbot+c88fc0ebe0d5935c70da=40syzkaller=2Eappspotmail=2Ecom?=
 <syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com>,
 =?UTF-8?Q?linux-kernel-mentees=40lists=2Elinuxfoundation=2Eorg?=
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 =?UTF-8?Q?linux-media=40vger=2Ekernel=2Eorg?= <linux-media@vger.kernel.org>
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
From: =?UTF-8?Q?Kernel-Development?= via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: =?UTF-8?Q?Kernel-Development?= <kdev@benbenng.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a patch that fixes a bug:
KMSAN: uninit-value in dib3000mb_attach (2)

Local variable u8 rb[2] is not initialized as it is used as read buffer
for i2c_transfer(). It is expected that i2c_transfer() should fill in
the buffer before the target function returns rb's content. However
error handling of i2c_transfer is not done, and on occasions where the
read fails, uninitialized rb value will be returned.

The usage of this function, defined as macro rd() in
drivers/media/dvb-frontends/dib3000mb_priv,h, does not expect any error
to occur. Adding error handling here might involve significant code
changes.

Thus 0-initialization is done on rb. This might affect some logic on
error case as the use of the return value is used as boolean and flags.

Reported-by: syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=2f4d19de8c9e9f0b9794e53ca54d68e0ffe9f068
Signed-off-by: (Ben) HokChun Ng <kdev@benbenng.net>
---
 drivers/media/dvb-frontends/dib3000mb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/dib3000mb.c b/drivers/media/dvb-frontends/dib3000mb.c
index a6c2fc4586eb..0dd96656aaf4 100644
--- a/drivers/media/dvb-frontends/dib3000mb.c
+++ b/drivers/media/dvb-frontends/dib3000mb.c
@@ -50,15 +50,19 @@ MODULE_PARM_DESC(debug, "set debugging level (1=info,2=xfer,4=setfe,8=getfe (|-a
 
 static int dib3000_read_reg(struct dib3000_state *state, u16 reg)
 {
+	int errno;
 	u8 wb[] = { ((reg >> 8) | 0x80) & 0xff, reg & 0xff };
-	u8 rb[2];
+	u8 rb[2] = { 0, 0 };
 	struct i2c_msg msg[] = {
 		{ .addr = state->config.demod_address, .flags = 0,        .buf = wb, .len = 2 },
 		{ .addr = state->config.demod_address, .flags = I2C_M_RD, .buf = rb, .len = 2 },
 	};
 
-	if (i2c_transfer(state->i2c, msg, 2) != 2)
-		deb_i2c("i2c read error\n");
+	errno = i2c_transfer(state->i2c, msg, 2);
+	if (errno != 2) {
+		deb_i2c("i2c read error (errno: %d)\n", -errno);
+		return 0;
+	}
 
 	deb_i2c("reading i2c bus (reg: %5d 0x%04x, val: %5d 0x%04x)\n",reg,reg,
 			(rb[0] << 8) | rb[1],(rb[0] << 8) | rb[1]);
-- 
2.39.2


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
