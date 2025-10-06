Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E1C257820
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759736602; cv=none; b=ssRLu3LEfNEkEQqQPRTnN7YF83n3ZVJzzWD4ygdRjfYIcbG7iUYt4IfgZTW9qsvnWWYoDCFLf06X0QX+ePRHsvtKxXt66XOd4SKsSxM2QVFTGETiDVGCrKRpNrkZu8o5f9X7AMHlQeUKGBzooKBdbfXZVxKtOnhhVwlkRG03Keo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759736602; c=relaxed/simple;
	bh=C/mZn+WHYcVqu0T+c/x5PT79Zv6hxCKk90h2Bfu7lJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cg/TjJWp6XVjAORJVK9rSRu3MY32w8B81OB2KaitoPR3sHmV0ORMiIjq/1diaUzU38pk+hNFKLp2gcN8T7BCbFMvvY2iH2FuMXofAf/lJ8+4XGT7jnv1W4iQGFacI2YORMBFeB7qteWbyg7LjTl7TW8a6xTS/++Qmib3L5UmSCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQ70SRGy; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQ70SRGy"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFB806116A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 07:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIDBxFQ75P-D for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Oct 2025 07:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC772611D1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC772611D1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gQ70SRGy
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AC772611D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  6 Oct 2025 07:43:19 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2ea21430so256804b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 06 Oct 2025 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759736599; x=1760341399; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw/9lPWHfMPkffQmkaSdCiEp9p7tCzCfQj89DSw96nE=;
        b=gQ70SRGyZzczm+qFTRuT5ULiqdB2OPEr6/kUDr/vAZ1OtsuaCL3g+ddqVBALfC09Cr
         k9SwpfJum1MGG0olCBJeUepBwz869WWE62Zvpn4CW/ycK1YgfGS3Hw6RfmO+yvKzZP44
         d/X3G+5iOm/qRzbmoVAtQxlWIN5ZZUjZFEHCAfVqias5QEn/54y4rtOrx2zitLVvTn4a
         8zibnMi9UMd1XeP0sojrOS+7pzmyIQD6N3/fYG2TPPymKj1oiKeAKQO0UyPCNcAbTK2L
         hjz5uvx7TWSRx5fa7498XzUHTFJp1y2BSfWp306dYqQqsqxyPe+sfaVc8vS7Eee1pyyY
         Qgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759736599; x=1760341399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw/9lPWHfMPkffQmkaSdCiEp9p7tCzCfQj89DSw96nE=;
        b=fDDif5QLEhiWB3Mktm1OYSzXwDsSdGiK5zSZgKqosYLuubPGnJWu3l+gfESW2UStFq
         fiTzzIqlgedFqeMyrALsXwL/5p1IBhmmMiD4fLjcUmlPqDVvx4vBL66EFhjvVQ44rfHb
         AGwAPJ7azLNgIGIplzLPrXxjxBd3DNnUlt7s+2bfBjHoYuHf4t8U55Tkr18NCt0fiOBM
         2zS42OExn1+GB4NIKmh3PmrtiEUWtxKd8fY9n1rz0HGL4RWpekHbtvBxieLtHO4gWRTf
         iQSXMR2zFZZn3QbkD8cUYpwieWrKWGcmoTLTH2HR4s+2za1YnU/lMT6WAdYlNr90/2yh
         QP+w==
X-Gm-Message-State: AOJu0Yz3KnJjcB+2vcAXbb3BbbB3PdCQ7vN4YAffHuXIV7SelKviax+6
	Qte2h/gcj/jasQcmLChskMmL9tnR82r4BEuCao1lPao1+LO9FK/QRS23
X-Gm-Gg: ASbGnctMZdFdX5PpJoGCj4vhPYNy5D318CaEQe0oomxbztKQvBpUhyP0U4WCbl8yO2m
	yP5XyC081CS2T6OtlXj/uPP0SjsntWiI/clgCPlEPtVdMGbGR1cBmyjklQmCwHlwPzBMOfMEqMp
	typpVwwrbQ2JHxaRozftPkGlAIYXgJY/nAfNeq4QIzbMIFUj8Rsa0d9BVAJb4HngiwvLRUwiHiO
	AyAvQ+kUQf0zxXx3Wn4dtcpMmoY1pwqIL7KLNyo2N07etakupHJFpwxE39DmwyzsDtNftLmUAAH
	3L/I9EOxYDD3rlczhrI1FV+/wcx7ueuD0Gkag4/+IXl9dRJ6Sk3ojz5jqZqbr/XlCIJGdjtxNRT
	1g4H+IHdfqUPXN0QedcdB7NMepa/YiknJ9r8P1iPUrLJsXT09y56YyQs=
X-Google-Smtp-Source: AGHT+IEMB07ViPSEotVWrOcwSD9ma9t+HQ//zB3NHR8w0pPltXfnUy8JcwvN3opxQHM+UsEYUSNjJw==
X-Received: by 2002:a05:6300:6675:b0:2bd:d83a:d1b3 with SMTP id adf61e73a8af0-32b61b2e1ecmr8038240637.0.1759736598836;
        Mon, 06 Oct 2025 00:43:18 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:f9ad:a206:7416:2450:6aa2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f58ac2sm11231639a12.35.2025.10.06.00.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:43:18 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: brauner@kernel.org,
	broonie@kernel.org,
	jlayton@kernel.org,
	shuah@kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/filesystems: Fix build warning on anon_inode_test
Date: Mon,  6 Oct 2025 13:13:08 +0530
Message-ID: <20251006074309.4348-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919104948.67953-1-vnranganath.20@gmail.com>
References: <20250919104948.67953-1-vnranganath.20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>clang warning null passed where non-null argument is expected.
>
>anon_inode_test.c:45:19: warning: argument 3 null where non-null expected [-Wnonnull]
>   45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
>      |                   ^~~~~~~~
>
>Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
>---
>Adding missed mainters to the patch
>
> tools/testing/selftests/filesystems/anon_inode_test.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/tools/testing/selftests/filesystems/anon_inode_test.c b/tools/testing/selftests/filesystems/anon_inode_test.c
>index 73e0a4d4fb2f..f796dad679db 100644
>--- a/tools/testing/selftests/filesystems/anon_inode_test.c
>+++ b/tools/testing/selftests/filesystems/anon_inode_test.c
>@@ -38,11 +38,13 @@ TEST(anon_inode_no_chmod)
> TEST(anon_inode_no_exec)
> {
> 	int fd_context;
>+	static char *argv[] = { NULL };
>+	static char *envp[] = { NULL };
> 
> 	fd_context = sys_fsopen("tmpfs", 0);
> 	ASSERT_GE(fd_context, 0);
> 
>-	ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
>+	ASSERT_LT(execveat(fd_context, "", argv, envp, AT_EMPTY_PATH), 0);
> 	ASSERT_EQ(errno, EACCES);
> 
> 	EXPECT_EQ(close(fd_context), 0);

Hi Christian Brauner,

I just wanted to kindlyfollow up on this patch.
I'd appreicate any feedback or comments when you have chance.

Regards,
Rangaanth
