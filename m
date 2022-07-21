Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6572BC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Jul 2022 09:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07AD940914;
	Thu, 21 Jul 2022 09:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07AD940914
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RizJHC7o
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56uwEJ7FsWaT; Thu, 21 Jul 2022 09:31:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0E72B40194;
	Thu, 21 Jul 2022 09:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E72B40194
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA846C0033;
	Thu, 21 Jul 2022 09:31:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE7A6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 09:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99A3184774
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 09:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99A3184774
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RizJHC7o
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMcrt0EilklM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 09:31:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA92F8476D
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA92F8476D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 09:31:34 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id r186so1167336pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUsFz55Px30MpiSri6WdI5V/eCo3oYtyYbcL/dhllTg=;
 b=RizJHC7o1k4pQRka7FRZfSJPs4tv6Qg73Nq3aKK5LkEDO8o7QZfFDVaS8w3CHInqHs
 OAkR7I0284R2CM7i+GLuE6ddqMvFr69gE7fIIsVTRhJwvhnTNduCxgX7oEhbkhCvfth7
 2sGewvdeiL5z9aJPoFK4wSQ2Otf8frwyWxDO5eZUHzi0EjfF4I77zN8gV8qX73dR02Pq
 WIJvq75Jo+DIi59YGDIxm5DG9VE4OVo5a5kP2mTbqgFLJ+7Ph+vtVlJGZCf66KY6Z8U+
 2zzUxtuEpBKkMHl91JmKMn5FdPYojsHb9xXYZwsLC8WGm3iBUSjT3KYjIQv+3VP7u61h
 I0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUsFz55Px30MpiSri6WdI5V/eCo3oYtyYbcL/dhllTg=;
 b=0WI44Xrdkrt3/XerAbpyqwjsFU8Lrh6xM4FLrx6jABY5rCFdJRRrY57kuggC003/Sp
 xQluUR9GqblQ5MX/hOFsndEIsr/qus5/jASgiaG1shX+cqySUqAQncq4j2Ow6Y3JSjh8
 9iUWuNu41kaWqjGJ+h7hpemWIDvxVW9hPfzBkXKuX4PTDvKRVdbQQZMycxh/yHqFvRFK
 Ecd5WOLD63EXGmmELSRZj9KxkhG3QSbRPys2LJSQVFLG6KAogen7DvkoFwO5aMbjiC8o
 7ENRxWnz/r/4/wWfnn6ibjHxRZdPpr2VYzhv7HgdgnOWoBU0iy+Tzmgfiub6y5Sep9+t
 IwLg==
X-Gm-Message-State: AJIora/IXFmP4xW0RGx9PmfxHMWwPwyvUVbFFCsDitxyneYXF/eG/L4E
 cwrINKvtJBYIc1owOFwD5kvXG3YI6lKJPw==
X-Google-Smtp-Source: AGRyM1saLyzD+s9kp+D/uPSzMWc2PqaZu7GOfp7xjpDubxl8dRQEowDz5sIMFIOiNwhP6y/JIDz25w==
X-Received: by 2002:a05:6a00:cc9:b0:52a:b63a:4e5 with SMTP id
 b9-20020a056a000cc900b0052ab63a04e5mr43081340pfv.59.1658395894120; 
 Thu, 21 Jul 2022 02:31:34 -0700 (PDT)
Received: from fedora.. ([103.230.107.30]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170903120900b0016d1bee1519sm1169846plh.102.2022.07.21.02.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 02:31:33 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] scripts/gdb: Fix gdb 'lx-symbols' command
Date: Thu, 21 Jul 2022 15:30:42 +0600
Message-Id: <20220721093042.9840-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Pavel Skripkin <paskripkin@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
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

Currently the command 'lx-symbols' in gdb exits with the error`Function
"do_init_module" not defined in "kernel/module.c"`. This occurs because
the file kernel/module.c was moved to kernel/module/main.c.

Fix this breakage by changing the path to "kernel/module/main.c" in
LoadModuleBreakpoint.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 scripts/gdb/linux/symbols.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index 46f7542db08c..dc07b6d12e30 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -180,7 +180,7 @@ lx-symbols command."""
                 self.breakpoint.delete()
                 self.breakpoint = None
             self.breakpoint = LoadModuleBreakpoint(
-                "kernel/module.c:do_init_module", self)
+                "kernel/module/main.c:do_init_module", self)
         else:
             gdb.write("Note: symbol update on module loading not supported "
                       "with this gdb version\n")
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
