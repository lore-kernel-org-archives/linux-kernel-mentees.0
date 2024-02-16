Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8914830E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708123902; cv=none; b=FT2zZPYeA/iW1EyX9zlcBBaE+2zUq3xEXCNNhZacnmNcdIiJ1huwBO7+XRnCBGsbbfd/rSrC8CF6UMjrXGL+xA51w71TBpLRKj9xOAa5v2+vtwMkLEqp14iWGP3XVqouO0LGxMoWGSeXf2uhgG7I0p/GZP5SOzr+lTS7WhG0GJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708123902; c=relaxed/simple;
	bh=hOmzS5SJMxt/Y5VNiAfAYsPCia8dfM+pw8DUfVZOG/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VfeJTT1eCt4Cdj66P66qm0oI+cH60s5Cu9b8QksaIeup81C4gwwmvjtbrsl2VuACqDNb15SNEMPuxRDC+RcrbEVgttpaFfKG59xLwQQARhlgKN99TbVZwSpr6/OPsCHJlYuEEbqRjXcIYlGOUvE/FaUqa/ShZW7D0nOC8jUvJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP4aUrVi; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP4aUrVi"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B3B60867
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 22:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Wd_gQCLuWHh
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 16 Feb 2024 22:51:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91BBB60853
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91BBB60853
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JP4aUrVi
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 91BBB60853
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 22:51:39 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1db51e55023so17516075ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Feb 2024 14:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708123899; x=1708728699; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFfXHdvN/5mUfAanVfariAJApfAz/jLdm9t29L3ltRk=;
        b=JP4aUrViGNOOM4aIJQOp1BH2EL9+VHPrvWs6iILrlIzccBWw95a52qogG4OFcTC2UX
         nf85LJ9vNM2q4fnH5a7CEvu5c7XOK5lGwMHRGLrdu2BPTHEfZNTcCbRZDzymVZPy6Wej
         q856RVNV7pG/2cee5V2p8lYr5oplXhzZcd1u9vWEymPdTA93JQ6heZcm2mZeNew5K0ej
         QLSwS4HBH4icVWzhME1UOvjuAA7c5wqMS0C1jlsh0q1Pxs+gW+qnQqOXnJuS0Du+bZhO
         fFm6ux7SmL732NcX1JleFZH1DPVyaxsndxiz6Wojhy5sFPre8GvsYfgoZOjic8U4TO9I
         LXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708123899; x=1708728699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFfXHdvN/5mUfAanVfariAJApfAz/jLdm9t29L3ltRk=;
        b=fgpyO9/DMi3I7f4KuBI/j81LPKAUd103EkQgJfTpGbzYoJdUP3ucrSxQ/WrTzObti8
         IbL8hyb29jO+de8xOv3HeDs+ECduCepekzMY2qcPxnyjZz/78rpFPdtcHuYVYvdywFvQ
         iEPOtkOQ4mPy9xC0M3ahg7Z/mOxswo5qlqdITLXgnueR6e8pn17vw57NL7ZCRp3k6TIL
         7W1OHp5+Mkpnw/joYwzymqMBB9aJB9Yo+Zjnl7aL9irqQ0m9d39eZXh41p1du3KguSCW
         G72MRzip6MXq1MK6CPDSSpUn9jhBi99DEUs3YjivTMWl2rjwm5HfQnwIb5+OPen2leu6
         uwVA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Nf3qUT3NR7bbwqvjaA4YIwefErps7xLolTJCEpvSkKXx0wqQIcOhqfwIOBS3PL2n1AVYmx/vv/5eBS+/2g22l8gM89HUinwj81E0/wDVEyMquwMNJA4tz3lV6kcD
X-Gm-Message-State: AOJu0YxKAv/ePvtZyQXHa5Pn/5ugfvbA0ZUZ5qXhM4nWGvQ7yoUv5/Ag
	IbjMkArQLVLRxtMknra0m8E9g/fM5kTkPMgOEk1MOkrA/UcY2Oaj
X-Google-Smtp-Source: AGHT+IHeAkmfXPrbWoFN5dC/QoVyRZxnAGSBvRQsSqGZPXxRNVKgHNClKRWIqa3PNVjwIgKGo3jvdA==
X-Received: by 2002:a17:902:bd0a:b0:1d9:4ebd:b94d with SMTP id p10-20020a170902bd0a00b001d94ebdb94dmr6267345pls.55.1708123898663;
        Fri, 16 Feb 2024 14:51:38 -0800 (PST)
Received: from shresth-aspirea71576g.abesec.ac.in ([139.5.197.147])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ee8200b001dbaa8c97e8sm348573pld.225.2024.02.16.14.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:51:38 -0800 (PST)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Shresth Prasad <shresthprasad7@gmail.com>
Subject: [PATCH]     Fix implicit cast warning in test_klp_state.c
Date: Sat, 17 Feb 2024 04:21:26 +0530
Message-ID: <20240216225126.454999-1-shresthprasad7@gmail.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

    The function `klp_get_state` returns an `int` value, but the variable
    `loglevel_state` is of type `struct klp_state *` and thus does an
    implicit cast. Explicitly casting these values fixes:

            - warning: assignment to ‘struct klp_state *’ from ‘int’
	    makes pointer from integer without a cast [-Wint-conversion]

    on lines 38, 55, 68 and 80 of test_klp_state.c

Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
---
 .../selftests/livepatch/test_modules/test_klp_state.c     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
index 57a4253acb01..ae6b1ca15fc0 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
@@ -35,7 +35,7 @@ static int allocate_loglevel_state(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
 	if (!loglevel_state)
 		return -EINVAL;
 
@@ -52,7 +52,7 @@ static void fix_console_loglevel(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
 	if (!loglevel_state)
 		return;
 
@@ -65,7 +65,7 @@ static void restore_console_loglevel(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
 	if (!loglevel_state)
 		return;
 
@@ -77,7 +77,7 @@ static void free_loglevel_state(void)
 {
 	struct klp_state *loglevel_state;
 
-	loglevel_state = klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
+	loglevel_state = (struct klp_state *)klp_get_state(&patch, CONSOLE_LOGLEVEL_STATE);
 	if (!loglevel_state)
 		return;
 
-- 
2.43.1

