Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC97C17460
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:18:25 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A412190F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 14:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grx+b/45"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0A412190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 669FC14CA;
	Tue,  5 Nov 2019 14:18:25 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 11F031494
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4EC3727B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 14:18:22 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 15so14290318pgt.7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 06:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4Z2WSsWHskG0Pcep27ldnUGqnlUWbGBs3tUsEl7VTNg=;
	b=Grx+b/45s85SXtn0Wr6DjrCIJnGZQ8Pa9I2baoFxnu+f7l2EbvIp9SsOOLmjQpD3Ly
	rmM2j1e7nzhVQpQSC3+l0VpPuyuMxN3y2O3CyiA6ICyiCwmGx2Jj03Qla/tCIqKNlJhZ
	t8qzUtlsqD/2I5Llc5ZdtqAQxiXD4C7e++Jv3GfFjTvo8MAEoQr44xPAMZq3hg78562W
	rgYGWg3ho9xmzhU6b6SnVAAi2APSUv+H4LTUWdOJP0k87AsGyzjCHkDzKNCRzxkNxCgc
	Wrv1yCwManKRlctajUcMItls6VjNDsmHUElDluD+lT9U/NkniNgONe4xFWjW0qH9mVxV
	hF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4Z2WSsWHskG0Pcep27ldnUGqnlUWbGBs3tUsEl7VTNg=;
	b=ErQIMzfOJmLGn1nkxZxPkA4f7+CBCXYqbzMFQhNCZWVcE76bnzEg4H+i6eXC6oC9ef
	Q5tpvhZ6KdjVNuWK08i0yt7k5Xv0gMPYAgxOSfcd0Re124c71nbHF2RwOkBG6e55R6Qw
	5CXNChAjWi3GVGslzeJRv9lPTltltExluAoo3wFXO4ueE7bUnx+S+qH3P8fPmU6dslhH
	dNuRzkkg5ec07EIaS1NrM6bsJwTCUcBUECcN+VouaB5ypBrn32QNG5beiuiaLA9blL96
	tgB7p8utwiiKVgYVyokG6/cj4WOMpRDtuSEF/ReKkHWxgqvgzyNCFGa6kcFOqx6Ym0HZ
	HDLw==
X-Gm-Message-State: APjAAAXdVBQT/cRAFEpGS3efzN50TP2A+M9KISiWdraG54PeRGoZ2B7r
	bz/NAOjwtuLOWQvUoc8fh3w=
X-Google-Smtp-Source: APXvYqzb/nzpT7KuncJqUZQMA+17dC4pT0+4mfv5HD4WhVk3nvQV/eiQ4o/gGThLszu22+ZHjNLclQ==
X-Received: by 2002:a62:8010:: with SMTP id j16mr38341159pfd.249.1572963501755;
	Tue, 05 Nov 2019 06:18:21 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	w2sm25246691pgm.18.2019.11.05.06.18.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 06:18:20 -0800 (PST)
From: Phong Tran <tranmanphong@gmail.com>
To: benjamin.tissoires@redhat.com
Date: Tue,  5 Nov 2019 21:18:07 +0700
Message-Id: <20191105141807.27054-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] HID: hid-lg4ff: Fix uninit-value
	set_autocenter_default
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

syzbot found a problem using of uinit pointer in
lg4ff_set_autocenter_default().

Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com

Tested by syzbot:

https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 drivers/hid/hid-lg4ff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index 5e6a0cef2a06..44dfd08b0c32 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
 static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
 {
 	struct hid_device *hid = input_get_drvdata(dev);
-	s32 *value;
+	s32 *value = NULL;
 	u32 expand_a, expand_b;
-	struct lg4ff_device_entry *entry;
-	struct lg_drv_data *drv_data;
+	struct lg4ff_device_entry *entry = NULL;
+	struct lg_drv_data *drv_data = NULL;
 	unsigned long flags;
 
 	drv_data = hid_get_drvdata(hid);
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
