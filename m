Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A81C25B6B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 22:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463AF821A8;
	Wed, 25 Oct 2023 22:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463AF821A8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L5pragvu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywDBFAJyaPsN; Wed, 25 Oct 2023 22:28:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4D028821A7;
	Wed, 25 Oct 2023 22:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D028821A7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30F99C0071;
	Wed, 25 Oct 2023 22:28:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3025CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 130A5419D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130A5419D6
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=L5pragvu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APe9PSChwl8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:28:26 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73864419D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73864419D3
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6bf20d466cdso45181b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698272905; x=1698877705;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZxI3ub9JozV6+6IOvOpJE/ZTX8Zxt3TUWc6QGqqjFk=;
 b=L5pragvuAZTVmhN6HUhWKS/zmyb3Asi04dOZGmeKpnNF5+E6W07Auhww1K4yLH94lv
 u4JEqxWczMT1+A3v1MZptX3q7DuUq6+Z78m9htUnZjQHHPlpMfxEhkzjtwbkiNGO/g6+
 d/5Z0vZKCyhar2Hd65nlLrGyxBTXZWQZA6JfFOnet3bM//wjSiGcgWyCAmQqK+AnwyPs
 SX9Omq10VCF/vNpXPV2Ph2DL8KhqWnqvk8aal8fuNPelMs0BeY2laGqzRrnipjcDFpgH
 4wLpgc+taRkjF7IQW6DPpMOiTBksl16Imij7fLSYTAd3TIzE21ozWnc/OlSluRdtjuFa
 jKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698272905; x=1698877705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZxI3ub9JozV6+6IOvOpJE/ZTX8Zxt3TUWc6QGqqjFk=;
 b=DS+hxpb+TEepd0jD9sa/GlyqZ2E2XaCONkPMJRALypZ/jbN4/QaKw0+bKn1GK9Tl3l
 /BF4c3BsB4t+pbr0+8ADNu8li5j9sY7U5rdi0oubMEmTwL6DZH8M82ulyojbiU/BLECm
 RUFpQlvgVtNDzyx6VBtqO2iAiBCT9mS2xHA3EabWLTt0IfUWLG8hyMgo8eRGwEh+BZxE
 7kevBEe44FZDNa0qqPuwMWvIUfie1W8N8ZHOB9N7YgvLquu7V0ZwqjwCD/IyINmhqMtq
 LdI3ETXwDhNBlTiQS1/ZKtE/AOgPbpxTzgMe2ltKYgoDvO08BVFyAFCRY65j5jRXCUxa
 dp9A==
X-Gm-Message-State: AOJu0YycaLyTyZFDJFJXR0lXPwrXIYU/ZYyp74ytPo26z5tQnSBGWurR
 xT8TefWbTsT5Cd1RIr3qkLw=
X-Google-Smtp-Source: AGHT+IHD30Uv9Bpm7YQdU9kkcThi9PVQIIoveL1K5nQXJdHyhzOsc8S+zCmeQBAqEtWSVNAqr0/exQ==
X-Received: by 2002:a62:e816:0:b0:6bf:1621:ccad with SMTP id
 c22-20020a62e816000000b006bf1621ccadmr16899762pfi.0.1698272905586; 
 Wed, 25 Oct 2023 15:28:25 -0700 (PDT)
Received: from abhinav.. ([103.75.161.211]) by smtp.gmail.com with ESMTPSA id
 y23-20020aa79af7000000b006b5922221f4sm9879813pfp.8.2023.10.25.15.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 15:28:24 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com,
 mathieu.desnoyers@efficios.com, mjguzik@gmail.com, npiggin@gmail.com,
 shakeelb@google.com, peterz@infradead.org
Subject: [PATCH] Fixing warning of directly dereferencing  __rcu tagged
Date: Thu, 26 Oct 2023 03:58:11 +0530
Message-Id: <20231025222811.855336-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

This patch fixes the warning about directly dereferencing a pointer
tagged with __rcu annotation.

Dereferencing the pointers tagged with __rcu directly should 
always be avoided according to the docs. There is a rcu helper 
functions rcu_dereference(...) to use when dereferencing a __rcu 
pointer. This functions returns the non __rcu tagged pointer. 
Like normal pointer there should be a check for null case when 
further dereferencing the returned dereferenced __rcu pointer.


Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 kernel/fork.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 10917c3e1f03..5afb1b389a66 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2369,7 +2369,9 @@ __latent_entropy struct task_struct *copy_process(
 
 	retval = -EAGAIN;
 	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
-		if (p->real_cred->user != INIT_USER &&
+		const struct cred *real_cred = rcu_dereference(p->real_cred);
+
+		if (real_cred && real_cred->user != INIT_USER &&
 		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
 			goto bad_fork_cleanup_count;
 	}
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
