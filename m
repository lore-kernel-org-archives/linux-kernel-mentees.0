Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC7822F1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Jun 2024 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318313; cv=none; b=VLiteEhtZUFw29xHqv4z/kItzm7VX9Oe8cLKh2KRx1ZYkq0nCAqOCXkPOz6j7N8BeVi/2If34r3W/+B8JyVthEI6fw6y84on4uKSOJ3dHio0mwi/iZ3XXW8xPn0v9xy+/E3F8obnB6JmVV50JfV3iQHJuQF0i4Ydzk6ftINi/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318313; c=relaxed/simple;
	bh=e65MDGgz/5t6pNJjm2h6eNurKKcTphF0Q2NEmJmIwI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hprth7WZJrB6t0WJwWK1kOw7I+ciVzTn+Pv5jRuVFRzM3IKkHQgzXCzndhNA+n72GH63uXOrjQAQlznjJYYQ9K/5saUskLGT1C1o1r+kppJ9Ic9OkYZZLtzBW9GciBC6otYBzYp+ZglivwG54OLAzbZGMLfBnXUeXUAA7OabE+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIX7PmoU; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIX7PmoU"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFBD1419B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Jun 2024 08:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpvs80HgnenF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Jun 2024 08:51:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDCA5419B4
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDCA5419B4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RIX7PmoU
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BDCA5419B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  2 Jun 2024 08:51:50 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6f8d0a215deso1685487a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 02 Jun 2024 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717318309; x=1717923109; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4hYHmgrY/sSpNoKlBUHQFCOVOO+xIhSM1LWCgBv6E8=;
        b=RIX7PmoU7lNf0XH/ZtCNKvC1Pb3mi8/V3rrVFAq9kRyetgz/bxqV8P/bhAxhbHkiGQ
         UB4y3df6sXVFZ+ZD71WLWlaDVBp981+FxY/AbjwYT3CFt38gwoqtjBnv2VjE3LSo/BYY
         c+vxg42iSJzo67Bn/A3mb5UGXy/MMedDo3DYG7yA6xxQBDt88RnemnyMBx3VXysyTItZ
         5PnVHbPuR3rqC47J2OKqZpHWAmBLrkIRNpJzUKzCqUsLTgsOjkfk3A2H06qt6UAvAr5b
         R/KsZYJXR3zsgQftKxvQMB5uEbCLlukNW8BTy2ufbluifH4Juu7njUeKyu/Y8TOX3R5x
         k04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717318309; x=1717923109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4hYHmgrY/sSpNoKlBUHQFCOVOO+xIhSM1LWCgBv6E8=;
        b=BHVAFf/v76PxF5H7D/V3lDCBQDIvQt6bh5/qySMVQmLLhDPtnVum5+xBAqMs+pESju
         qT9HyhWrbzHd1bbcGuWF9aWorPJpdmZ+V8q2UEfvTV+NawuajFQTUrpYsuVp0EYu/g+q
         ScJ6TFZhunZc43/iOPYdWfUSMPioEqz+VWRcKUEHZGT1NehlikQsAYOGhRi1cTPqITin
         ShdL8pH+stuBBl/leE9MyoJqYRNJFHZsHfyW6afSdrK1YHYhWglmOBar5BCSQIyMXjjq
         mP2Cq4W/cNjF/4kWvkzSXGQTJUpLo7ZL1RD3OucksDRsbv2mlaDRAZYSAmTtZC4uFRym
         +Gvw==
X-Forwarded-Encrypted: i=1; AJvYcCUbWTGJd6Bb0LhQu8SfiVsF7wMZ0UdTxva76grg9492r1Jsnq/hZ6SdlG0Yffzgk8yEPcLS01Seku8aO02Ln5thYP9Ybxra3RB40Y5MdOc+E3/7E66amc4Xq0J7g3cR
X-Gm-Message-State: AOJu0YzjjuU6Deyde7beIrRgsXxLFTkFEmfmqCndW5Nexqdy9o2vRxvW
	GUdz3DlJZYaE6O+BGEFveRxXw30yXyCgZ8rGqnTzPRHyzJ7dG5B6
X-Google-Smtp-Source: AGHT+IEoQt9fiVgS/wUK8ZbhbZqDxwqVnEkmcyWbSOlcPJ7KPfGB5ccFde9C7qL7s2kTgPWdscxIPg==
X-Received: by 2002:a9d:3e0c:0:b0:6f0:360d:d730 with SMTP id 46e09a7af769-6f911a8e5d6mr2783523a34.6.1717318309450;
        Sun, 02 Jun 2024 01:51:49 -0700 (PDT)
Received: from my-computer.lan (c-98-39-68-68.hsd1.tx.comcast.net. [98.39.68.68])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-6f91054f672sm1016350a34.46.2024.06.02.01.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 01:51:49 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dan.carpenter@linaro.org
Cc: andrewjballance@gmail.com,
	benjamin.tissoires@redhat.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	jkosina@suse.com,
	linux-input@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	luke@ljones.dev,
	skhan@linuxfoundation.org,
	syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] hid: asus: asus_report_fixup: fix potential read out of bounds
Date: Sun,  2 Jun 2024 03:50:23 -0500
Message-ID: <20240602085023.1720492-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
References: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a potential read out of bounds in asus_report_fixup.

this patch adds checks so that a read out of bounds will not occur

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
Reported-by: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=07762f019fd03d01f04c
Fixes: 59d2f5b73921 ("HID: asus: fix more n-key report descriptors if n-key quirked")
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

