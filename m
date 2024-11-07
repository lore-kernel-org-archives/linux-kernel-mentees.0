Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8C1D5CCD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730961437; cv=none; b=TNYaPOpxr3Zb363SOEhAOOKzKgPlOuKJ79JYAmnuiI42I9+8dwWzKbmN+TjCkBfINLO7KVNYL3rMRE3pPGCx0BhYWLxg8WtZcUxy5bFxxPL0zqOtUW0KxrsJC1fmoQZaVWpkrwsa1O7jadog8fmZBp6YfnYpAKhqjFXcgcO+zPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730961437; c=relaxed/simple;
	bh=R7Agzor76R8cssshT5VP5bIKcU+JM+7fLhT/BpB5DJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t2hxAwv94VvymBTpQJQzIZSd7SYg9pHalx0r8+xkqTkFlk5aWagzuYuXhNfsveeSmg7+ax/bOoJACfXiI4Muhl+Rk0g6WNMNXQGba1slt+LpSkd0hZNUa8T7G3D1HORz4ty1wZv3mJWs85/dS0pVAS6uBGkVZCta4o3RECT2ojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCVXSGc+; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCVXSGc+"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6794038B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ympe8xWijA2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 06:37:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C435540247
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C435540247
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UCVXSGc+
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C435540247
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 06:37:14 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7181885ac34so437093a34.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 22:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730961433; x=1731566233; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2DKKAPCqm3qy9Qkbsj/XEzvJTNx0NheCX+H6XvpWYI=;
        b=UCVXSGc+YIn8Ms7Me6gVbnH/r2L2FrJhfD7hVsT9pgy4AwIVxi6MUij99eVx5DMg/I
         NpPmXCeuuQ3bDva21CPV1ZIcH0ImuVyJAFYw8tSbG56yyPzV9VxmvhPAFIjjM60tPLFO
         ARnb+5f83oA1L/obCgUIfY6l6l0bOYDyrMJ1OVzHd3b3Q6jxiVT/e4vAjm4k3CgO2BbZ
         lYLW1nXwboqSaz/rom+sRU89NV/x1hezhSCeOvVlmU6zeeaYMpv5uwxWQ2Eseoz8HBsX
         FAbbXTEWwMEmZcAGK1jCCX+RayOqGk/iuGlehVNbrq5ykteCfrpc8ffk3ksgtLJbICLJ
         UcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730961433; x=1731566233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2DKKAPCqm3qy9Qkbsj/XEzvJTNx0NheCX+H6XvpWYI=;
        b=uOn5YdYr2nExzKjwYiWeA/kT79dpuzUIbAQMntZUl3ETU1zW3ocppdyKBdXpcWiXwD
         Yr8u9++PVBNt2za2YzlKNZMv2tfAlnxZ1r5Ysm/wMDkXd7g0TLHqznRY2qMkuJciheCx
         GT+mYOscNVSexNP6CSBtkhZWuYmvtvFRYYhuTqaADEw/Qng5q/P5Bd1PeZQnrLuyaIAD
         QnCh8q+3tpFbD0IJO+5uDxCbtls+h31QfGSBLxWfLHr8RkL4l96ucwMeRVUDR1OUTpZ9
         c5+617RfLIJYX12/yy1hqdOkSkBKarA0fD0+BD84l+8bN6mvzqnow8RAVNx7pc+oqE9d
         Xuvw==
X-Gm-Message-State: AOJu0Yxwal8ValZCddWEqWCQO7TEMg+/25d1PFI643Ftr1yeROKf/FHU
	qQBdCBSY3UOIDhoX2iIxaHAfmlAaxlfI/sSM3tbY9wCJuSWqrXsdwirExTeN
X-Google-Smtp-Source: AGHT+IGs2DM71e9maKHXQ+AR3VNSQggk59vK7PPwYNupVqCEJ8J8WZE4T3dtfFxGit5d8SayinzITA==
X-Received: by 2002:a05:6830:6f83:b0:718:4395:1cc7 with SMTP id 46e09a7af769-71868118311mr47224102a34.12.1730961433243;
        Wed, 06 Nov 2024 22:37:13 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f48abbdsm616310a12.10.2024.11.06.22.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:37:12 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 1/1] docs: bpf: verifier: remove trailing whitespace
Date: Wed,  6 Nov 2024 23:37:08 -0700
Message-Id: <20241107063708.106340-2-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107063708.106340-1-xandfury@gmail.com>
References: <20241107063708.106340-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/bpf/verifier.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/verifier.rst b/Documentation/bpf/verifier.rst
index d23761540002..95e6f80a407e 100644
--- a/Documentation/bpf/verifier.rst
+++ b/Documentation/bpf/verifier.rst
@@ -507,7 +507,7 @@ Notes:
   from the parent state to the current state.
 
 * Details about REG_LIVE_READ32 are omitted.
-  
+
 * Function ``propagate_liveness()`` (see section :ref:`read_marks_for_cache_hits`)
   might override the first parent link. Please refer to the comments in the
   ``propagate_liveness()`` and ``mark_reg_read()`` source code for further
@@ -571,7 +571,7 @@ works::
   are considered equivalent.
 
 .. _read_marks_for_cache_hits:
-  
+
 Read marks propagation for cache hits
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.34.1

