Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E166B31ED82
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 06:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533576; cv=none; b=KhL3xpvLyyBi/BmDQXaM3QEX9LhI15Fa3pjeJ4yN9fTUYZHXhP9Lu97hLqAydPQ59CwMMNAyzOfOtxMGvJ/A2IAu1GIbkzE65DcEojt8usGQCVYBeMvipMoostjGJRLQ84wkKyC1W/LQ1JFxOxhvhvKLDmwdfT9+mjJRaLBuKto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533576; c=relaxed/simple;
	bh=bOG7MFQkS3iZCbR1WAM2BNfX2hMyDdstzBOkhBe3YpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0EdpTbe2urbDTpXX5ioZi5/+JvMsofuks+H8BnOECS+911SsEulag+P4iplWFc0Zkq67Iplk2wX3C9VlOHmiIQ1bdSQROFLh4IT5uv3f2FUNrzUdHUP0UfPzE/OSpNRRrsbRWCN5tWTen9WXCFc1Q0MtLrOVlbaINcx7nCseYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nogFh7jj; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nogFh7jj"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8581340351
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 06:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYuMnQtOQs3z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 06:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 353C040332
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 353C040332
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nogFh7jj
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 353C040332
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 06:26:12 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2980d9b7df5so68132655ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 22:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763533571; x=1764138371; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3uck5SLJDFUscVdZUo0LHnIxtPzwUVM7ArDFS0hzBY=;
        b=nogFh7jjrOVZiK42xsIBBWK2r9i3d1JSj38YuZTyF1PhO0idk4p5s6fl4sC5hVH6JE
         FP6Qg/Nh2JIaC1PydgktbEBQCCbQO1jGYAxs/v/ncYW8OMBc+D6JuU9KSitxcYBUzi0r
         mBp5kCZSNOoWL8Znk7bzhUZ4yHSicTOw/dFRRY7tqsm68Qs65gyQfEZuJp1OHsEjpmXc
         coSSacUDMwF7vZu8d2WJ6Py6PAKiiJw6V8R/MJgh013iBXTs9rDwmCLTuqMQUIOZxpZK
         0MYF9KIe2cXgZF87y/jTCT6b9ZPUmWrL2U8gd48ciTWpR7cMjFcOPwt0wWUi0RrC42te
         KfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763533571; x=1764138371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3uck5SLJDFUscVdZUo0LHnIxtPzwUVM7ArDFS0hzBY=;
        b=Qj0c7t/+RMVt+/n95ckq+J2GTKqQ1VJ+QJI9tLjA0uqmnKdXnnG3pvgfD+f36YlY5W
         WkeEKBqY74JY1lnwDvbgH0tIjGRE/M+UJM1dUiaue+b9HSgFnJ3Boo2RCP2cu8XaaFwB
         lvfhEQTj/klR5uhigJvgmC8SViFtaaFEISfNGT/iZvUmSXT+EgK4lwFf6i5tknyQXu0B
         Ih1nHZM0/HCahSGHRkLVxQ4cELtOvHNjHeTmiuVJqkZMfyJ6acmVfXrhnB1Ub35+HpyI
         97/XXxlXXQXk+in0xFudh2u02h5t3iyw5u6MsTuFc5tZLX1CIFLlIsb44CNBnoNqjAFZ
         D1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVWUZHreQIT/XIt9Unn+acurLB1zpQug1fp/gh9j9BbLsMXr8fOIB4+d/4muImw3380FXUK3M26papHDL6gURHfABBa2Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzXQCsE5jrtc+bQRV165ynaN73oFMBJjBLW81HIjRcmhwo622xR
	oh22BPqud1Nmdd6cAOIggHtpXaTcWDVb7uZ/rsQnEHMrNSKfVZQy6o+f
X-Gm-Gg: ASbGncvCbBwHwwBjpEcLon7poXFNvu/rNUDncYoa+gZ3e9g3+qIvRCrhGfeHrIL0ipK
	boW4Tvub3Faa+S5oUTFD8LV3vHxUq48AEVNdFjhMXuRep+ESjsDAKdIsiRtHzCeH6SIgbYct50E
	at2XlQ90a2RT04IM/l+whPVMf4PngAles2hjoRzVfq2qfX9kgLYfE1T4SazPLY7NjKGq1byBwPe
	9IsdlExQYMLI5mHmKE1dnsdo8kYI++NJ+wt6WxjAgWioW6bPJ80uW0RxUuQ2+UlnQebVfUKA3/v
	OlLd/eDMPF/v5j6q6khDLbN1f4N+XBXEhEe7mgBzJoyuwV2xWzy1PcRYADLsiUAtfptbTNnSmjk
	46uxYIRKdxEMJnpkZBQwUmFJ0BKRXI8RuIUDsuwsKeorzSH3Fe4daIejWcyi1/IzHtzNFYgHYnX
	Q7rrcdL1D+SuNefZe4r+t8JXoP/91GZA6V5UgLwrz+ev4le509gjmGnAtUUxeHf11hf5CIvI+/5
	LMq8g==
X-Google-Smtp-Source: AGHT+IGTgkIGWP9fMJYS46fqWm9eVKlbop6ssm2ZVW3H9bFUJ8EJrgktDkyGqkKhuRWps5cc6VoELg==
X-Received: by 2002:a17:903:2c04:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-2986a6d55c0mr232723075ad.18.1763533571305;
        Tue, 18 Nov 2025 22:26:11 -0800 (PST)
Received: from prakrititz-UB.. ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2376f6sm190992735ad.21.2025.11.18.22.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:26:10 -0800 (PST)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] bpf: Document cfi_stubs and owner fields in struct bpf_struct_ops
Date: Wed, 19 Nov 2025 11:54:31 +0530
Message-ID: <20251119062430.997648-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing kernel-doc documentation for the cfi_stubs and owner
fields in struct bpf_struct_ops to fix the following warnings:

  Warning: include/linux/bpf.h:1931 struct member 'cfi_stubs' not
  described in 'bpf_struct_ops'
  Warning: include/linux/bpf.h:1931 struct member 'owner' not
  described in 'bpf_struct_ops'

The cfi_stubs field was added in commit 2cd3e3772e41 ("x86/cfi,bpf:
Fix bpf_struct_ops CFI") to provide CFI stub functions for trampolines,
and the owner field is used for module reference counting.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 include/linux/bpf.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index d808253f2e94..d39b4b2c8f35 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1905,10 +1905,16 @@ struct btf_member;
  *	      reason, if this callback is not defined, the check is skipped as
  *	      the struct_ops map will have final verification performed in
  *	      @reg.
- * @type: BTF type.
- * @value_type: Value type.
+ * @cfi_stubs: Pointer to a structure of stub functions for CFI. These stubs
+ *	       provide the correct Control Flow Integrity hashes for the
+ *	       trampolines generated by BPF struct_ops.
+ * @owner: The module that owns this struct_ops. Used for module reference
+ *	   counting to ensure the module providing the struct_ops cannot be
+ *	   unloaded while in use.
  * @name: The name of the struct bpf_struct_ops object.
  * @func_models: Func models
+ * @type: BTF type.
+ * @value_type: Value type.
  * @type_id: BTF type id.
  * @value_id: BTF value id.
  */
-- 
2.48.1

