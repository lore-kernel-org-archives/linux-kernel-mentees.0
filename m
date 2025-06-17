Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7022E7197
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166101; cv=none; b=MNeCq2OFr65daoKnUmiqNGKgIgNa9YD28Lhn1BtBkOay3Wp0QggFqGqq3qk5i4tED4YBbm2Su6XCght9K3e2/egneXoXw2lf+pcYPPcrTIzI8acPm2dryX4Z4OKLN9s1JOtt54faW7UbByGNJrq0yxtpLBgeClIDyLtlPIpWKeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166101; c=relaxed/simple;
	bh=p7DOfF+FVsKwThiS6DtW1TTjKjyRC+p9KTOjsE2PN9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WMRmr3I6xtJt0czo69+ZXSiwyHAgaDlEfVl2nCbFI4hVVhHTiONNCaiKkHOxcXg2zS7cEbmk7bboCxOEc2EMiQgQhn6QtROukIaOCwhaA4XAxWoKGWDPh20M46030shFsccYEio4yXMXnxhCw5SMmE7l+v5Hxh5xF8SXbytgEZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NT5NTayj; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NT5NTayj"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7481600130eso6241087b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750166099; x=1750770899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qdj6PEXQSBqXoHF+okOiKXmDKN7rBK1h3xMiJzkSQlg=;
        b=NT5NTayj8htCAxFN2bN2bPr3OEJ71bgL+Uuieeprkq52H3kA+x60tt8O7tQoEqIVMP
         +yBvftBQbgdghRkLZCBc35myPehlqHe0puG0Wtf5qvDXb174Zq55LX8qMdEru894Kuzw
         0AulaRHfSuFYHcTp7EAp3ZaI8aesqGLF0MR6z6zX6zjr1oVF0Ihn50gLdt3duGvuW5rX
         O6yXB3S4IS5rCuwLLeTXE3kpFcas7N4+VbNGi8sl70PHWKnyc4yyVNYaGMvcZuBf9iKx
         cH+x5eAS5jYceoGPoF1Bcck9JNVyeGuxN1Hg/cEP6ayJ+7Euxdb5dPZ4hpCCs8dwrVvx
         lFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750166099; x=1750770899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qdj6PEXQSBqXoHF+okOiKXmDKN7rBK1h3xMiJzkSQlg=;
        b=unn0pzQghUTgcEw246zT5VG9ILAQ0dK0aMaGKgtodGmig22RtihL2Eb2YTtehmkE7R
         hzZWdyytl0nAMq5aQ9H7u7vB6/xCR/scCvEoppONLKoR68rq9WrnQ2MhyCp30B4JXFFV
         NYEmGgoodmHET3dWzskxyhpjRC6x9AbxkudF2tk/LAPeneISjX6+gbsa5Lzyig4bZMqX
         /nOBaW3HJdoTHDERSYi7nDz7eb8ZrYsdFFHKnJJdti2oASJSI5HxMQoAEjDTICzQo4G1
         SdsgxzpbY7rFMf8WGI1cNxCHJ8qVXySkCWiMFzPXG5s4r7StIbl2E9NgyKR3SUNlpaIn
         KptQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdd8SRCioDE1FtYxDtMtWoBaVrWz/WHVBvZdkiURDu7sZlkGjGRJeBevyOkgOPQkkOO6N8F7hMVxBzsJC2FHq+1mLxyw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm5+etKMfVBP4BstP/2wsEf5B8bSl6g2YHc31T1H+a7AgndmTL
	8vSbRNKhloBq7oD+dj3XpD3KGcVyGseu4dH5DYxNpy7QZKY8XnFxBZBy
X-Gm-Gg: ASbGncskjS8bllF85NnkKAfY+/HdSfHHIvbgQcyDqJZP0qKwyOt9p/ekXDQNXKoJGSj
	tPvX8aiT8u2nSR4WhcpihcRI7fg3I/Tz58JTQL+JJQNB3XizTZE74lygRzJBBpf6sCeNibZXCK9
	7csiGGN6NwlfoYi+8zmu952krs9BLpx9z0+NoUUkx2Clvqrw8CcPTPiHR/EgI3hitr3X9MO9OhR
	+DJSC7P7dsdd9ZCZlrAh6cObNOFZaiSwGsrUchRB99kWaBMAk9QYd/kK5FaI22P2WKnrvHMiRtx
	ZD/NOZ2zBI+FJMWX7JCXTYywsZ68ZK5rRY+W4mVb58b/gIP0mpbGonoMngcL0Sdq+IB3t+xDRId
	RnK4OC7M=
X-Google-Smtp-Source: AGHT+IEj47XzIhTDcSayzRQ0CFz7ib3XQdJW80v1f1Wk6QFx4GpfqPmgDq8HhOc7YT3tqSGvz5AKdw==
X-Received: by 2002:a05:6a00:13a9:b0:740:9c57:3907 with SMTP id d2e1a72fcca58-7489d175260mr18366198b3a.19.1750166099185;
        Tue, 17 Jun 2025 06:14:59 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900cec7dsm8775059b3a.153.2025.06.17.06.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:14:58 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: cem@kernel.org
Cc: skhan@linuxfoundation.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] xfs: replace strncpy with memcpy in xattr listing
Date: Tue, 17 Jun 2025 18:44:46 +0530
Message-ID: <20250617131446.25551-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use memcpy() in place of strncpy() in __xfs_xattr_put_listent().
The length is known and a null byte is added manually.

No functional change intended.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/xfs/xfs_xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
index 0f641a9091ec..ac5cecec9aa1 100644
--- a/fs/xfs/xfs_xattr.c
+++ b/fs/xfs/xfs_xattr.c
@@ -243,7 +243,7 @@ __xfs_xattr_put_listent(
 	offset = context->buffer + context->count;
 	memcpy(offset, prefix, prefix_len);
 	offset += prefix_len;
-	strncpy(offset, (char *)name, namelen);			/* real name */
+	memcpy(offset, (char *)name, namelen);			/* real name */
 	offset += namelen;
 	*offset = '\0';
 
-- 
2.49.0

