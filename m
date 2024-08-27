Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA01D27B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784263; cv=none; b=EuS8yAqwunHiiW2psKIuhEZk5uNLuFAGiMFDYTVERm37mt6G12GlDvZXfz6JqJ/xHmzd0i6xgQW0L3d446MkyCEa8nHCnvzhe2HS27OA/JFzHm2BpZkmmLnYBmx4ZPhNuD53LXBznp01UvdZfoSaYDRHeBtcin/lNj4sl+O5Mtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784263; c=relaxed/simple;
	bh=u6kW+6ArbewrNzZcKJ3cCim3nQ5/kCbS8zfS9851Gio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q/PE0Rs8XjknlS/FGDYpuXHFEbjJOPZEoSGepk1VmLulW+p+y4jlRJb88XNS4DadTvKosu1I4l+e6px3FUIEc1Id4T1sf0Wi2SxfXZxNwzz7ia7bu1PdHE2ksltLCqw5HAILrNmwFFXr2bcrAk3oi0wZ1J+FnTI75DxgB/IRcIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6gr8rK4; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6gr8rK4"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17FAD811E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 18:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKoICS3aZ_Z9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Aug 2024 18:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D444811E1
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D444811E1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D6gr8rK4
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2D444811E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 18:44:20 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-202318c4f45so60353465ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 27 Aug 2024 11:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724784260; x=1725389060; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdyQszHmpMjA1lielnMCOCT+CVl9suwnpweUfFJE9W4=;
        b=D6gr8rK4hzyY0NgXoOmJ2JFrSnELYFe4f13qOmabuc7SCoPRECPmIV40Wv/9HffDdz
         sECj8iStDXSB/fq/iP+2Op8Xbc/0Bwx1H3iKv6zHobVr0IOAF/f0nGd6nC5UquZyYmYD
         +4ZY0UyvZYUVspkg302fmaEpVc0q8deE3bwBlbugaLY0jmOYI1uun/1P+54rAFdctVhY
         BUdokV0Tj44jnxs/LeuHTyF9gXap0eoYp8ucvBc7mwsMLO3KNdQTtupezCntN69c46Vu
         puyVKI0ihj8k+4H65D3522yPZ9ZWdljoL5rb7imPInciMa6y2APdrV0/8l9EGF27RRDf
         jMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784260; x=1725389060;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdyQszHmpMjA1lielnMCOCT+CVl9suwnpweUfFJE9W4=;
        b=gbIdGzcUoj2+uQEfYX+CLkO25UkSo8Ya1TQ0u5yGOuUvmVG4aflwOdmPHpg8u5nTEo
         YaZI8vsqlQFJ9n14GtM3HK5w/LD075ZgtcQ6pM0K+6oi+NUjzsUYv1bNFiBWH7ZcOv7a
         C7mamwoJ35ZdoYEr/6XB8rW9DYxfKrLJ+Y5suRNdW+klm5c4Gxe6zXzV6QCtILAYu5Tg
         DMtldveqsfxyjhJEK21dl6utnHbordc+Y8QSAZCJKqygeVwv9DIgpeNXIhJuBWZBqBuj
         SAOtah7h9T03pwtt6aJaK9e529mSydscGJYCrFN08Ha/k2GwGZkhRNtECSJHH1slRnfa
         tk7A==
X-Forwarded-Encrypted: i=1; AJvYcCWS+Abs1UsMEcZpag4ogJkDIbBxBjVpz2oxEO7utNPO0VxDxt9pEBcdjWuPSo0yerM/i0HPHKhyWZ3PE8G+HBHEjN8XJQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxWcerCywklqLVHvn1YMbSCGIwmvyqCEZJchtFLhhmIAQSMfax+
	Lz5RKzXOo0QE/v/jvLkaY4Sxb94FxQdgzIZu4wePgZeNam0MeD5j
X-Google-Smtp-Source: AGHT+IFsLXIZScZAJ2TBLqBoc9pEROKLjGEiHL1U3h3kRucKfLmGZZTuWQ4JAzS5QiQQ10KFYHpvow==
X-Received: by 2002:a17:903:35cf:b0:202:1db8:d9aa with SMTP id d9443c01a7336-204df46e52cmr44607005ad.30.1724784260178;
        Tue, 27 Aug 2024 11:44:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:f022:f804:2fa2:fde0:4987:3a52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fd0e91sm86660385ad.309.2024.08.27.11.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:44:19 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	apw@canonical.com,
	joe@perches.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH V2] scripts/checkpatch.pl: check for non-permalinks to Zulip
Date: Wed, 28 Aug 2024 00:13:59 +0530
Message-Id: <20240827184359.46968-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
Commit:     9c32b4f2ad277b94a54955b0285ff7dcfb5087aa
CommitDate: Tue Aug 27 23:39:18 2024 +0530
Content-Transfer-Encoding: 8bit

Zulip links to https://rust-for-linux.zulipchat.com can break in
case of renaming the topic or channel if they are not message
links (which are permanent links).

If a non-permanent Zulip link is referenced then emit a warning
and direct the user to the Zulip documentation.

Permanent links are of the format:
https://.../#narrow/stream/x/topic/x/near/<numerical_id>

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1104
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
V1->V2:
Corrected the Github link to the right issue,
Fixed grammatical errors and Replaced the link to reference 
Documentation to one that is easier to understand.

 scripts/checkpatch.pl | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 39032224d504..41630532a056 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -735,6 +735,10 @@ our $obsolete_archives = qr{(?xi:
 	\Qspinics.net\E
 )};
 
+our $zulip_forums = qr{(?xi:
+	\Qrust-for-linux.zulipchat.com\E
+)};
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -3415,6 +3419,12 @@ sub process {
 			     "Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html\n" . $herecurr);
 		}
 
+# Check for permanent Zulip URL
+		if ($rawline =~ m{http.*\b$zulip_forums(?!(?:/#narrow/stream/.+/topic/.+/(?:near|with)/\d+)?($|\s+.*))}) {
+			WARN("PREFER_PERMANENT_URL",
+			     "Use permanent Zulip links when possible - see https://zulip.com/help/link-to-a-message-or-conversation\n" . $herecurr);
+		}
+
 # Check for added, moved or deleted files
 		if (!$reported_maintainer_file && !$in_commit_log &&
 		    ($line =~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
-- 
2.39.2

