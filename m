Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A6A220F35
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753809889; cv=none; b=AKYjw3qTM5uXQbGvSE8eRLiYKwRm+UQtcgNBiDObsXnsU8cyvKweIpXJ6WBmZrhiiPS9XufapZP/PNoQWFTYT/jLjHt16iOtss5mNtiE3u4xuCSy/hXvlGYZ6qgzW0NUJDYRaR4I0gM4UYTGP877+FlekhD9Kv8YiCZQmTnPZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753809889; c=relaxed/simple;
	bh=8tUVEOHCd6vgZOjmZ6wGCyZD35jdxuSt3593rFQJiRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/S9K/zSc08bO7b+Az4zb9n+irW7CLtUeZJDWEsOJphfdCuvqbPpzPoD9iGV0YAmJOulen0KQrPD8faFjRmItQM5KIkPze3vDAgVHUCbS3wDRtPlx4see8+jcnEOP10dphCskgkh/1zyH5vINfFOHEOhmjz2ubzA1vJ6nIGoiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIbQIRie; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIbQIRie"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31f1da6d294so1508702a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753809887; x=1754414687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=PIbQIRieg9OmRaH+Pnu9NaSSkRzLe3ZLY6HkNAapKP8S7hqeI985Q8wNhznaxVGWsg
         TZqTZmay46JiT8KuzUG+QsDkdop0xaN2iavF+c6uZflPg/KGt6Q4tvFumlaJxbvNjsqM
         4drGsxh4DmDRJVrdszXlAv72HoY3UtjJyoGOLur15CvTGyf0mCYeDlHL9x/I/bsrsZue
         Q1N3+guN9Cxmy/qjsDYr+0mqK/YvB+Z8N4+Iuehdkl40KEdQQTIPewPAW2coPC848Uey
         WjwOQ+wbOcr48jMuAoq7Clb6Tgz42QtJ9scoaWDeDHkz/LWeihm3D1zjCRJsSxhHkqOw
         aglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753809887; x=1754414687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=dzhD+H+6R15Zht1bKULJMzQgxFOwWXIKEVn+51S5ExMGDyNFlfQfd3CC8SLY2cI3PK
         A2PCwFImQMY87R/7L5vUfTUm2Qb6SzRKx9KcLPmChNFJCDryb7eo78yrNXiJN3i0ZYOS
         DY/7GXNLHE4D7rpWfvutP7dPyzE32AsciEV/14Le7OWkZArXQruOAF1X43E2UXa18BwA
         WdG2HZF/jKm5cExgLMW46yvKGEOOgkmBLiUDr7H9gDEo1Dxj1KKclBNHhG3t4B4dteH1
         OW8ie1pyP9LSbfwgTBLkA2r2yay5CgnmseD3g6ISjH6CM0RfDZaRvP58zvtdyLMqik62
         ewMg==
X-Forwarded-Encrypted: i=1; AJvYcCUc5pVImcSjgYzHdVSQdHifD6LyNxRUkvyIAIBrBLZ34kEdS36Skgp74wLaJnV15bDhcOJ4Kich1sWwlTNLDae66t/S5g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8IXs9WYwo59pNElo8GXdQownVrKGej2pzKxy0wrjiZkz70ucd
	0tjnCDHHQ83fNnB7E0fTWXK2yrV1QoVTQt49M9iBlhHCnBVMSlZRlvBD
X-Gm-Gg: ASbGncupn45jEyLagqHld1vYV+QeSVPCNboVxutYcgRq/W7yf2jnAVvDCojknbOKo9s
	AOxp/fRQA+bO8NEV8rTmLSePIcsggkIjCwkZU9vXIWzlWhU4lLdMRnHusHr9+klnGqrDkmNaCiM
	LyfZLdKQKa+1+I+e5lv5ma4A1oeTLHarHdRhjqjsLAgZeKjj9a+jcfuZsyOVVnTd5KU8PUYT34n
	23s2NlnVp0fxX+gkbhrs3wf2Km+xODl9veYStthPefURjo13eYDjGtZv+Mh0kHhjhjAT6seXcS4
	w+mh3YFwn3qchWn6ndyMezYFhB0nPyga68Js12vaBBUR/smgjwISYK5Xu3FYdVgDjFRIZLo3i/J
	X9PqZ21ZP81EhdazTId514Zl8IkMt3AMit1HHh4I/
X-Google-Smtp-Source: AGHT+IHxPVPNDARsw8xQ1vd23cug8FXnncAeKpA8e5jflbCVh7R1NkJvOBgRNA2botuGJ9l+BQYYaQ==
X-Received: by 2002:a17:90b:1d88:b0:31f:346:c670 with SMTP id 98e67ed59e1d1-31f5de5562fmr372362a91.30.1753809887062;
        Tue, 29 Jul 2025 10:24:47 -0700 (PDT)
Received: from archlinux ([205.254.163.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f328dd8a1sm2110943a91.26.2025.07.29.10.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 10:24:46 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v3] checkpatch: suppress strscpy warnings for userspace tools
Date: Tue, 29 Jul 2025 22:54:37 +0530
Message-ID: <20250729172437.19925-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl script currently warns against the use of strcpy,
strlcpy, and strncpy, recommending strscpy as a safer alternative.
However, these warnings are also triggered for code under tools/ and
scripts/, which are userspace utilities where strscpy is not available.
This patch suppresses these warnings for files in tools/ and scripts/.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---

Changes since v1:
- Create is_userspace function to check if the file is in userspace
  directories

Changes since v2:
- Change regex pattern to match top level directories only

 scripts/checkpatch.pl | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e722dd6fa8ef..fe580b0810f9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2636,6 +2636,11 @@ sub exclude_global_initialisers {
 		$realfile =~ m@/bpf/.*\.bpf\.c$@;
 }
 
+sub is_userspace {
+    my ($realfile) = @_;
+    return ($realfile =~ m@^tools/@ || $realfile =~ m@^scripts/@);
+}
+
 sub process {
 	my $filename = shift;
 
@@ -7018,21 +7023,20 @@ sub process {
 #				}
 #			}
 #		}
-
 # strcpy uses that should likely be strscpy
-		if ($line =~ /\bstrcpy\s*\(/) {
+		if ($line =~ /\bstrcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRCPY",
 			     "Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88\n" . $herecurr);
 		}
 
 # strlcpy uses that should likely be strscpy
-		if ($line =~ /\bstrlcpy\s*\(/) {
+		if ($line =~ /\bstrlcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRLCPY",
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
 # strncpy uses that should likely be strscpy or strscpy_pad
-		if ($line =~ /\bstrncpy\s*\(/) {
+		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRNCPY",
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
-- 
2.50.1

