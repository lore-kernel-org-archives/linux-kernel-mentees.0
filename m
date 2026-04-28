Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40721FE44A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Apr 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777350634; cv=none; b=NGQ8POuWnD5OmYJm/GSHApJJY4Ghf5EnslWSP01LlY+LFHD8jUnBPECSGdFXa0FkP7md0jED8UU6e1HHCkPj1bed3E5jCG250NQiQqT/Z/HEQBgtaLmQGaw2VMspnnlfKmByJlLA+AQ4JBg3qGqD6hYa9rnsMg8yOw2ANwLS6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777350634; c=relaxed/simple;
	bh=lAw7ByP8NQVMmaHIXOiQsoholucbwdEXesa5oUVmQ8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1D0eTnInZlH3JSyfY5fMCb6YsDkvDs3me5GQQE1x2rCvigdB79lXDE/U65HAkinPxc1AITSSs1X8HnwBkTLBkVFUXAVFUBwMyNOE/HLUOIt4IZ0A7yY7fiwa7q4DoO8ptd8vp1WfRnbtLGItNSYMPbR0KAlIzvcruKd47Bu/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=josqMqLm; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="josqMqLm"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 586BD60E3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Apr 2026 04:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJnvKaAp9S8U for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2026 04:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1334; helo=mail-dy1-x1334.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9602460E1E
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9602460E1E
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=josqMqLm
Received: from mail-dy1-x1334.google.com (mail-dy1-x1334.google.com [IPv6:2607:f8b0:4864:20::1334])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9602460E1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Apr 2026 04:30:32 +0000 (UTC)
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso11104518eec.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Apr 2026 21:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777350631; x=1777955431; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ncax1hLXhL4s1JyqOrJU1m4Lr9wzrisl50UIYascFK0=;
        b=josqMqLm52YvqCqjzAUtv50jd2GSR1kVlVtiBk49a7Yru6nWJmvAagDcsjETQnZLfo
         X5OM6athBCvU48VWeMCa0SQFtVxkaPnJ6NLkDl+KxYC6WcW5MRj/nfbAB0n+2sfWccWm
         Bf0Er2MYHbXf+sRPvHLj6iF0MAin8f0LBkGFwvUtI5a9Geg7MwzkmXnL5lVK98RGRvib
         X3lZN6szI8lZbWka/jjcxq72FV3dFOMoBXWxERZqdYJl2AXcIiC76H78MGXszyF1uxAK
         hqgfnS44rPc5gw4ZX6zb24sjzkK1unx8JtsYMeyeihqL3U2ksP3LP7GYIaGSlC0Z60N4
         CXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777350631; x=1777955431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ncax1hLXhL4s1JyqOrJU1m4Lr9wzrisl50UIYascFK0=;
        b=EZzI2cgL2tNIrv6tJ2joB9qcELAdObvy42HgLVKbq3dbtb0YFsJ3x4PHGCBJEm2Cw+
         ltMQNz33Qyna26pS9HSWhCkwadDVdX1yl7RHtVrEl3Cur398Ar0yjmN8sGC6KN6+MluE
         QuZnETtoycBbgvqAK7cMk1uBeXa0gTUIXSziZ6Sm8IQUcWhopWUH3YnXGKYlA0FVbJaB
         7OjYQ2m8NQ5rfVsrAc5Q1fEnIbNKmn/+nLV+P3/kxaSeaF4qVqD8KAwDkgjg94Q+OQfq
         prEkYIwySyGwmTVgMRzwcarmJgHPeg8UPOQhvqAjrqOpY2DWfg+t/cok6OFN4zEet/7a
         OzCg==
X-Forwarded-Encrypted: i=1; AFNElJ8cDebQX7ik/BmXTBK2h9oejIfPY7mMWPZr0Eom446Mt796zr+mYxRoIOJGLd/CD9ZCj6q89xfAhtRE74DbiKXdK8IYRw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz16OrgTzTjLfB/nM/180AD/oh0niT+fPSmUmvchf3ZbAwKdY4J
	cj6lgfRnDfIXfhshi5j3PbaouLm6Big3kLA5Zq/PiIdjgFlyroh97kHE
X-Gm-Gg: AeBDievJqiRr6tJVr/tahvGy6eTN9l56qlCWav/d48lB9qnXVXG6bGJjivnSDv0rqIY
	QK8BajhS2yHX+PvlrtzmTQQYIL2Ot1AiWNVII8ExIAc+449np9IJz9LVTxDLOyZul+vAcyPWDN8
	TkEG2kwxpYSK9rOrPvdyLHYSs8DVNWL7sbPeg0DXgyQ5gnhj1aOHl3o+hHnqUi60DrAGXb6QvgW
	2sh9nreD5axqKWjnuCLm+Leke/XRuaWbdOic3da64aXnc/NWiWTp3L2CLzCbM6zBm4QQhCgNBPd
	jEe9NRYXyZFE2028Sz/F1+mkqSEzih/GCvaZuNEjHaYc+4rkN+ke8LOXHSMcn0si89YaVRjw6yR
	Z/I+aDV8afpA3Q3g5utl76EFmARw2TpStdjDqmxlQi7MHkHQA2jGNYy01zyhir1YyxBsaQpZU3J
	fYNeBjhs/ApTdBDYLhMixcz2zKGM5GeGU7X5Th
X-Received: by 2002:a05:7300:f18f:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-2ed09fde4cbmr702624eec.3.1777350631199;
        Mon, 27 Apr 2026 21:30:31 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13eaafsm1283826eec.28.2026.04.27.21.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 21:30:30 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT] objtool: Validate find symtab in elf_create_rela_section()
Date: Tue, 28 Apr 2026 11:30:26 +0700
Message-ID: <20260428043026.160465-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_section_by_name() will return NULL if the section is not found. If
the symtab section is not found, using the return value of
find_section_by_name() directly will cause null pointer dereference. So
check the return value from find_section_by_name() when finding symtab
section before using the information.

This is reported by Coverity Scan with CID 1445573 as NULL_RETURNS.

Fixes: 627fce14809b ("objtool: Add ORC unwind table generation")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
Currently still not sure _when_ symtab section is not found. This is
reported by static analysis tool, which can be wrong. I apologize if
this turns out to be false positive.

 tools/objtool/elf.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index f3df2bde119f..ce7246d3b302 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1625,7 +1625,7 @@ static int elf_alloc_reloc(struct elf *elf, struct section *rsec)
 struct section *elf_create_rela_section(struct elf *elf, struct section *sec,
 					unsigned int nr_relocs)
 {
-	struct section *rsec;
+	struct section *rsec, *symtab;
 	char *rsec_name;
 
 	rsec_name = malloc(strlen(sec->name) + strlen(".rela") + 1);
@@ -1654,7 +1654,13 @@ struct section *elf_create_rela_section(struct elf *elf, struct section *sec,
 		}
 	}
 
-	rsec->sh.sh_link = find_section_by_name(elf, ".symtab")->idx;
+	symtab = find_section_by_name(elf, ".symtab");
+	if (!symtab) {
+		ERROR("can't find .symtab");
+		return NULL;
+	}
+
+	rsec->sh.sh_link = symtab->idx;
 	rsec->sh.sh_info = sec->idx;
 
 	sec->rsec = rsec;

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0

