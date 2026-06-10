Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8C36729D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jun 2026 05:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069158; cv=none; b=G6sbNKUMiqQ2XcRV0d3/K3W/uG8df5TANwgnvZNGqmVCg0UNP5cZXtoqY93qLYgzpDpzaCDNWLTthq7+6ZP1EHrbW3cpgc8kPkrjF8LLQD5cacwaxe/CEC2OJZ+LKSXKCpPZuwmZVU0CeE4PVey+b2GE+4tSJ/Oe7rrYztPcU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069158; c=relaxed/simple;
	bh=RgLvJfoktkYbk8WIGWa8iONc+11FqhDyQQ9lxOZgCxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D10rwRUb1Fcw8KjInM53B/tYkYmPtbfHmBstcAG/Yk+EIrIQOj02oZhxNqfY6E5n8zSOd+dYMYB+VNKt7Zu0EFGSQet0A+lX8YtXtYIO8tkQQijKrJHwUxhpEzvewsJeZ4/eFzcAlasa04jdvSV/qDis5Hq9MOgOFyd8t7mBxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRQsn49K; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRQsn49K"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3585740242
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jun 2026 05:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08RG627iSgOl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Jun 2026 05:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96DD440248
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96DD440248
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eRQsn49K
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 96DD440248
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jun 2026 05:25:56 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8423f420455so2679118b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 09 Jun 2026 22:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781069156; x=1781673956; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvT1EVjtfblNZFvJfxilQFWKbaHZZ5R/iepDqQLGtW0=;
        b=eRQsn49K9Qd0fUfvXRTP2kGI3ir0FYrPsrBB0BYHdBlFsodlc4LfhxHKnEAgaslcvy
         auZzDZg27DHX4AMLD/IdbXs1SRH2P9/OEAVkW+Vdu6hcUL1UnwnhF/2lejwzcZyPQOPB
         135QtW4Nv6dl1lNe/Qr0KLYA2WPRHJYScJacPQ94utmlFfRv2dyek5TKUAKVgxU7Stfw
         hCsWbZ3n1ovK1k80JhEZk4B4LRMt+dk4iq75riE5fzMXT+kWGhsSLtJUnXQ/o0T0x/SE
         y8JkWkfStZuve302QU8fG5yAKSGsAFIDLFaLFWYrDi8ZJkhzOt87ipPGcZVGa3PnFdKT
         Dvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069156; x=1781673956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvT1EVjtfblNZFvJfxilQFWKbaHZZ5R/iepDqQLGtW0=;
        b=mLK1fNNXKsxEXFQxuw2RYJw5qnAtY3FLMQSBbLeGI5OdQzCw/qyxslvyi+VzKYaSka
         Yoon63Wlqu/yIOAeD9huMbrLje/zs5ROKC6d2atomyJibGUXFqj6aToEtovZNsVROHrC
         7XFVOBYLbfrha3/y2EBd07I3erPq8a9puvdO6/Bz50tzRiN6o+9o8ISATGiJ1HUBWcN8
         ioYwHuePKQWgom617F/lLpV2L83WVXRES+A07/T1iAYKdS3RBHmc8nwYqtlfRYDxYIuC
         tn4DOaGppuMYFF79wCKKG94qov12wlV3BKLAqqTdfwhoAqi+Db6XnAZmM8qZWB23peEL
         0QIA==
X-Forwarded-Encrypted: i=1; AFNElJ/ikO2bV4YGOhOHdP3jlPjisTZp89kr56wfgO7yVVoP6/fVkbkqyJacAPNSp8M6fs+A1a1hy+0IScSJkUqXMKLo7qr8AQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzsGqc25gin13oieUNs4VuMlZf2KNKuSYgTqKj/l1oezJN1nM4C
	3npXy5z+QJ0zqeii1S6lxQW0EIX42A2UOPqh7WIlQNJiGmf2N1DnB6kW
X-Gm-Gg: Acq92OHmoH4W31DLHGDOIHZlOkv4wwezQDUPAl0ottkL549Q5++8VngB1vE7dsLA6XA
	/PiDMLzjAZTwLUtZyduy0ub5qhCrpCTalNaAackD6Q+n8QPhgfA7LPPIpdmMUGkvbuUXCVtmKE4
	PFgO7SWcadcIcAZPvulPCu/3yvHJt4HH5mQ0ICX21Y5/mfgbx5DlYPm+Sn/2ackusBI3BZ5t1mJ
	oF7DJNSlx8uSUc6evCCdZhuYQ0iDn/9q53SPwwiiyv3XNwVByk9RdBfIGd9oA89foKBfAVaweHY
	5iutGgW1YcRzu14aVhq4NxRVQcXTVdfMglLkfRD+/lRxFtGnaP1r6k/zMWV8jGYDh3GYwVruWkl
	/ce9xx1i0IXqG+hcrI7ujOj1PtX+Rq6sl1ZN/jXpuxMpxYvCeXwdnJ6hDnJDNp9FeZU2VkTTZQ0
	a2YeE+c66cv9dBWnKXD0Ntv5xVNcDnC02IfyW98g==
X-Received: by 2002:a05:6a00:a13:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-842b0e95e0fmr24760458b3a.21.1781069155781;
        Tue, 09 Jun 2026 22:25:55 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:ee8d:482e:804a:1508:13a3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm23172109b3a.48.2026.06.09.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:25:55 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] modpost: release allocation when early return no suffix .o in read_symbols()
Date: Wed, 10 Jun 2026 12:25:50 +0700
Message-ID: <20260610052550.187006-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The allocation for elf info symsearch and hdr from parse_elf() haven't
been released when return because of modname didn't have suffix ".o".
So, release the allocation before early return because of modname
without suffix ".o".

This is reported by Coverity Scan as "Resource leak".

Fixes: 8c9ce89c5b63 ("modpost: simplify mod->name allocation")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
 scripts/mod/modpost.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..8e231544f9f3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
 
 	if (!strends(modname, ".o")) {
 		error("%s: filename must be suffixed with .o\n", modname);
+		parse_elf_finish(&info);
 		return;
 	}
 

base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.54.0

