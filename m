Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EBE3F9CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 May 2024 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716872835; cv=none; b=aZfc2YQANNZ8OVBICQLihPuNkFcF5uVgU9pmd3Z8+AzNYlVBED16U+qeZ/ERhfmdNsk6yfZiBUtkucsHqhIi6f0l4vaOiI+e4tFSEO4pu/GdZTJTdS8mBHEpymu+wcsNaZoZkk5FMb3Sfye5Vjl17uatdWQibV+yU9BrBUxZnSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716872835; c=relaxed/simple;
	bh=yUShdSmJr46Mgx4i2jipsfc4D+xqm4VZ+NXk6NsJYA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJxt27WXzlMPcogz6tkpo9Uk7Mey7nB4tnmjbdv4uLnngtIprZP/J65bJWFh6PuY6cP0AUvy1TX/ghUOK5dc6LGqOhfoksAcOUMVu8LXapaQfIXAMAH46Q5RF/7XKU/IWDuq9z7FhFBH6nqI2abnRQzDJRD+mJ+hVdmMRfloq88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeVBNhWM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeVBNhWM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DE36080F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 May 2024 05:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WO5Wof2QNAKo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 May 2024 05:07:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE2A66070E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2A66070E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UeVBNhWM
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DE2A66070E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 May 2024 05:07:12 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3d1c077b9baso215234b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 May 2024 22:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716872832; x=1717477632; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LGkX5CvYSeRWcO/OUCi81i8F2CpNF/Yknz+iuEPMic=;
        b=UeVBNhWM/y1EgkktaI2fOJKFNlj3na9sTUuOho1A6I8KrtlgHMtWEKsAueHx/oYnmC
         KLHO4iY+USA8tbT6ZVstdef5xqZGgJ3akt95ztaoX0FbwFyzdQdTAlfCCS4zvojKzUjx
         ry6F2C1CWjbXJ8pGH0SFyIji2ykN9sPoT8wX6UXjzIbCJGfm4nHUP72zWwOvuKKF/H3m
         ReME3mPgszU7yOOAna5l+tGhNYSmRxIQPUTkY2FQjTAV6P87jQ250R5hd08+xyLOWvD9
         N2/zsgFPfrH2AGc0kK/dvWSdeet6ozvGKJCP6wLpZFT3Lgd98WcyI/XgmrbknB/grn0+
         cPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716872832; x=1717477632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LGkX5CvYSeRWcO/OUCi81i8F2CpNF/Yknz+iuEPMic=;
        b=HJNfaWrg7bxboyOCyI/IW26DhhqW2x77+sc3VzBzI4axZLDWStZ/lCl/29xxyJtfuX
         G0wQDbgMJnEL0x9x4LPhfDSg1OBYg9YUUNL2QrRt4P7zUitZi6b5iT46Ni2nrwdhm7ad
         KstqsS0eyoDwCm9oqZLSIJVcp3YmBVDj3Pp/8KQ5Nw+8vAjsxKQlZNi0p0AwVYWU1sbW
         jTr63cz+jX3SGTi/zAvX0jOVJsGZXuximPw1eZhE69FVcYR3ln2Np3CWgrCOFVNZFejJ
         I2neSdfIpdgnV81BfUpe6OYlrPQuaxsJTcgpQavEBE/CKH2GKigDu7resj0ituR+7VmK
         b9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdkIF6tyUNUAVjlrwL+tdmH7/SoT4kgqdipUBET0KIApigULeCiyuHDTuN17r8GhXDBj00PBNwKE2O7bSK34OESwj3h3KGkyWpVEFc50vfqKsBA9UZVhgfuLyM//xm
X-Gm-Message-State: AOJu0YzZMzQQB3le/UecLxpWwG3/2PkmWox8CNUkqEUsRQTGzNgVM/5c
	GOZlNBHty+FklTyUrfQQsslI3yx3YZFdsoGHyFwehJCKTeXQcu1r
X-Google-Smtp-Source: AGHT+IHchZ0MIxn31HdZq/DwBO+sPMGJpEVor0E0NH3BvSt24bhvXtHBVs63rTMcyUTh91G4ODpUSw==
X-Received: by 2002:a05:6808:15a9:b0:3c8:6468:73f6 with SMTP id 5614622812f47-3d1a85ec475mr14137814b6e.43.1716872831642;
        Mon, 27 May 2024 22:07:11 -0700 (PDT)
Received: from my-computer.lan (c-98-39-68-68.hsd1.tx.comcast.net. [98.39.68.68])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3d1b36825d4sm1238633b6e.6.2024.05.27.22.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:07:11 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com
Cc: benjamin.tissoires@redhat.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	jkosina@suse.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	luke@ljones.dev,
	syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] hid: asus: asus_report_fixup: fix potential read out of bounds
Date: Tue, 28 May 2024 00:05:39 -0500
Message-ID: <20240528050555.1150628-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <000000000000915d550619389e8a@google.com>
References: <000000000000915d550619389e8a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

there may be a read out of the bounds of rdesc.
this adds bounds checks

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 drivers/hid/hid-asus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 02de2bf4f790..37e6d25593c2 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1204,8 +1204,8 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	}
 
 	/* match many more n-key devices */
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		for (int i = 0; i < *rsize + 1; i++) {
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && *rsize > 15) {
+		for (int i = 0; i < *rsize - 15; i++) {
 			/* offset to the count from 0x5a report part always 14 */
 			if (rdesc[i] == 0x85 && rdesc[i + 1] == 0x5a &&
 			    rdesc[i + 14] == 0x95 && rdesc[i + 15] == 0x05) {
-- 
2.45.1

