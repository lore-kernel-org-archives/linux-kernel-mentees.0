Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7B1AAE0D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724880903; cv=none; b=WCpWdI3g5AvplRPI8Jy88IFohDOC9QLQvRtbxPayw5+gcuMjCqSJwn6lZsZnWi08dF8s8Ua6/qTNOQw9yQnr2mDYUjTcuM6QiuKdHBYKze46hLBzmpfUBTpRELyRPiGi9QAB56rH4nhlNuQTUrEw1kTWE21VQmhALdyNVxqS3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724880903; c=relaxed/simple;
	bh=u6kW+6ArbewrNzZcKJ3cCim3nQ5/kCbS8zfS9851Gio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l61pzbqafTqxNxLTHIFiYC3SqUNkLhNcjFWuoAzREA4RzRrjR/16LkLLFYDt7eb2bL0lUWsEAUzQGnXucFbILVPRouBeS9O2PFw9iVlTVcZrg1ROkwZ4zkKkIXQ6fKd8V6zzlxNYw3d8TrA1KmwplIHDQHxOIcXgIDpB7c1jhWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8KtlNxh; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8KtlNxh"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A03BF60D5C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 21:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPXUj8UTPJ6X for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Aug 2024 21:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 762D060ACA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 762D060ACA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J8KtlNxh
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 762D060ACA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 21:35:00 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7142a93ea9cso5298417b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724880900; x=1725485700; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdyQszHmpMjA1lielnMCOCT+CVl9suwnpweUfFJE9W4=;
        b=J8KtlNxhdl6RPJQOHlXwTt1WZjmoq6hYpO9rAVbeYzUhdwTOdDzqkTLNSy1C59UHO/
         ZBxhTPaC5PhAem+aF+YTNtHwxZIIQ8dLb7ahJ0D/edKAzZpwCIZLJjocqVJJFD7AE4KS
         2ZZVG0+uqdaFxE848Ix4Vf88OsBQXOX+cCLR8mavq5iaRSfuYq/lA2S42UnKUAeQbctY
         7wrTCClmlsmgOATFodM8elkd8EfSqgFoz/+y++HqkJyu4pkAt/0tl0p0O98sbSMdgD0V
         +0jIx43KQOjeCMt09nuA0bIZFd/WC+mdfpAeHsflz/hryWJi+VJV6VjYG3IoHYh3zkRz
         vOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724880900; x=1725485700;
        h=content-transfer-encoding:commitdate:commit:author:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdyQszHmpMjA1lielnMCOCT+CVl9suwnpweUfFJE9W4=;
        b=gK1mErBx4tiJctUW3mTO+GcdGU6vhpnQRk3bjR+ekjm5Lq9SCC31DANIzjKP42rhhz
         oNJQ8BKVfBY5KLo7X/Pg0t9eh3iQTO1wjjUBXqvk2pyNjhSquBEkxOOypzKPmhtrzTVL
         Zdf/cCv3aGE6OUXz7l8DbJjUDm17lMXs81IffFTjioO0IzlX3pKJ9h0JLwBuXT192Zm+
         nK6Gpy9Xhx9gaCW8jnUVKtklPtAnI1C0qz7Nm3XahkjyNT/slpIqS7hdxGe1aey77aZA
         8o7Iwdry9EOV9BGWRAhdIg/crGGAWiY3DEPk93EH8xO7yJlVyyt732RQ6AmHb+fpzlSP
         sraA==
X-Forwarded-Encrypted: i=1; AJvYcCVpwet6ZRCvxcKAKkbeK6fi77QxBFPCqv7MKAxnPo82t5t/7J0tGSJXqFJL0rYkFF3OwcvAOSGqF1C/+2in9KAmQ3ImSg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz8WtzEq/Zr2MHfwCYTGYIXwq7sWamnjoaI/0m3kMU86bCxtyua
	tPgMNycN2+NeJAj4bvLN104FEANAJLApg2X5D0q+w8KND8pOOSvK
X-Google-Smtp-Source: AGHT+IH6YpYbGSLGbv/6QL0onHVlxfvlNcSz95VJnl66HChd64IDoO0wGi155UZej8DlZbj+DN8W0w==
X-Received: by 2002:a05:6a00:3d4c:b0:714:25ee:df68 with SMTP id d2e1a72fcca58-715dfaf2ed4mr1006275b3a.8.1724880899523;
        Wed, 28 Aug 2024 14:34:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:f022:f804:ca0a:f615:5d6e:f4e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434af17ccsm10475739b3a.8.2024.08.28.14.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:34:59 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	apw@canonical.com,
	joe@perches.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH V2] scripts/checkpatch.pl: check for non-permalinks to Zulip
Date: Thu, 29 Aug 2024 03:03:57 +0530
Message-Id: <20240828213357.21241-1-simeddon@gmail.com>
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

