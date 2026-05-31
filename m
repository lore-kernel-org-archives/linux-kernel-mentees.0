Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C512C2C21C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256204; cv=none; b=iLmKgvJpIbbk2AhPdZ5dTNmRS9Xa6dx8dG0hOf4hcMxUo33uNg1dcei6Y9RvX7SYWcaFdXdv5raszzy6WG8V2KPn/+ommWunWUaFWr01RRx/LabaJ+4mHSpc+3L//L0wRhVSmS1EqGcTO2mjV4mQ2HshOiYZDEur0gxgXK0ZUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256204; c=relaxed/simple;
	bh=T6ZL594nQcE+qJVrAnbbYysPJ/5zIcGaf89qg9aRl7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6iFFUf0YWAPjT/bBDVBairKKcgmltILloOiWz4fylgDK30Iea/6RFoqmFqyeb60QqiTyIMr/QkS3M17nNhs24+3Anr64z1G43mRNLZPODdQPJ3cmyhAzI6JqjTyhyJQlCy4TohkFA5eqgzWEZELh61pLPRLl+EFdYtE47jBSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXaJ/N5W; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXaJ/N5W"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C6F4284F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 19:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4Ho-61a2V4D for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2026 19:36:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=rodrigoffzz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B30AB42850
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B30AB42850
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IXaJ/N5W
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B30AB42850
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 19:36:42 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-963d7e5ffddso374283241.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780256201; x=1780861001; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYDzzyBJ0elLKB0jP/bszGkmeDK9wZmW8LHbbh9j164=;
        b=IXaJ/N5W45IOW+Si+6fwvIY3tPygEFxushbhSSym1NKf+e37MHQ8nuwJPHSOlBMu9Y
         BUUD5/ITf+VJzH4fLCMHDIDeHTDcwAF3RAkWbR0dCHU5ac9FJfVM3I3IStsSG9UThzxN
         lwHMYPKGkiQ3Uv0ioAYhHN80UzpKmJGg6TQlsnsmAglLzYjhKtuSp5F64ei1llMoyHUM
         OviM86briG8SO7WRgwzbpKxZFrsJVtN3xZarVRAAXD5WI/BPszjpIZWNwfceSqYLF5nd
         zmS7K4OOd9YRDgEuimDq6SQ/m6EzrqRuN3XC0Qqavg9z4C9ZGkpphVHztf+vQE9Qx5d2
         haGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780256201; x=1780861001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYDzzyBJ0elLKB0jP/bszGkmeDK9wZmW8LHbbh9j164=;
        b=aAP3YMwrBLS11hs5Tf40hYbm9HaPNhre5NMchRelHx0N9lWrjrKRL7ZADI5mdZN68i
         PYeLEwZz4750EstOLwzQCdtLItyhnTYETPjqp2cZMrX2Eq8TKw/0S0o5Cng0je6k1P26
         ntzuwv0LpG/CGUqPOwlSzwLDcVAlFw+25cgtEMeGNI8EaJGMmsav6FInSNQAVT9Z0gEC
         KErNZFvu0dyJwpNjZzeNxsX8KJ7i1NUX6B+3yH58A5Xd37EgFhyGYBO77uN+J4PrEq7q
         KrH1TwzkO8caib3JT38A3ZmV8K7zPvk78N2ozrQrQoHor0DOWwUSVqu73sfaBPopPtdl
         Y3SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZruZKv7p5276ruyirkNvRl55q1r+4y7wBNEjGvBJum6qvv61koOA82Ynr2CMCtE6StYL9RKWsN6L4M7QaJeRfmVyHPg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwZyRhqbimoFyauHiX3B9v9de7/Mkd/1XDibYwYPNDDW8Q5d/8s
	CYTG8oOdgO/LCcfN5HcOSYh7E3gXZktcIn4ba3BiOXMm3xaZoTV8y3NZ
X-Gm-Gg: Acq92OHDM1MVzg3wTMqGBT16mkd5oPJijnQN10oaa28nIawWrS2BifSKJvebscmK8ev
	5DLEDv6Q/1v6rWho70kL8vL0mVcmCwkLcDxu+5Iz5u0CoKNTLBFfYscFECgTE6SUOLb3Gq4rfm5
	evudmWPmk6fWp5vBR1QmzB8W/HYgAHtUCEb0D61VZ+2WQWURZ0RCiiUkX3Fo2Jw8ep+gyqaoYLj
	1dBsuZC5PjvoM3ETCmSRaUO3Lpi+c0iIYOmamI1AdCuV5HoyLDQNHdDePgimT0xvtYlMMv8QoyN
	hjUWr+EG1z4dzIAbP1ZVlhny3khREJYcmQaOKBd+uqfeZkuc3iVeFiLekkaieDixixQWyKGXQ47
	5if3A20G2EvgTQuStmg4Bc878aMc5B8mWVXVn/cE1oZZC7OUqxVi/b4xI9SiIEKL5QIgqWvzgx2
	3xRDk8gVKrdCkCCApNmT9aZ5MM5ox50lTz
X-Received: by 2002:a05:6102:5988:b0:65b:c17:70b4 with SMTP id ada2fe7eead31-6c66383c6d9mr3437544137.0.1780256201137;
        Sun, 31 May 2026 12:36:41 -0700 (PDT)
Received: from dream.. ([2804:1b3:a702:ed22:1ad5:a049:6ba5:86b2])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6c78792bc3bsm3253136137.1.2026.05.31.12.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 12:36:40 -0700 (PDT)
From: Rodrigo Zaiden <rodrigoffzz@gmail.com>
To: John Johansen <john.johansen@canonical.com>
Cc: apparmor@lists.ubuntu.com,
	Shuah Khan <skhan@linuxfoundation.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Rodrigo Zaiden <rodrigoffzz@gmail.com>
Subject: [PATCH] apparmor: fix kernel-doc warnings
Date: Sun, 31 May 2026 16:36:28 -0300
Message-ID: <20260531193628.286270-1-rodrigoffzz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two kernel-doc warnings:
- non-kernel-doc comment marked with '/**' in af_unix.c
- documented symbol name mismatch for aa_get_i_loaddata() in
  policy_unpack.h

No functional changes.

Signed-off-by: Rodrigo Zaiden <rodrigoffzz@gmail.com>
---
 security/apparmor/af_unix.c               | 2 +-
 security/apparmor/include/policy_unpack.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index fdb4a9f212c3..ec6018662b1a 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -615,7 +615,7 @@ static int unix_peer_perm(const struct cred *subj_cred,
 					  peer_label, &ad));
 }
 
-/**
+/*
  *
  * Requires: lock held on both @sk and @peer_sk
  *           called by unix_stream_connect, unix_may_send
diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
index e5a95dc4da1f..0399cec16fe8 100644
--- a/security/apparmor/include/policy_unpack.h
+++ b/security/apparmor/include/policy_unpack.h
@@ -131,7 +131,7 @@ struct aa_loaddata {
 int aa_unpack(struct aa_loaddata *udata, struct list_head *lh, const char **ns);
 
 /**
- * aa_get_loaddata - get a reference count from a counted data reference
+ * aa_get_i_loaddata - get a reference count from a counted data reference
  * @data: reference to get a count on
  *
  * Returns: pointer to reference
-- 
2.43.0

