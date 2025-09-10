Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8B33769A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Sep 2025 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757527594; cv=none; b=kEBR66/JVlHImDF7SOurcOHyuMSDbOtlVYramS9tLjNosSeWhWUtpvFR00U4jGi5bFJs4bF0CJ5JVA/f0wQEyDUzi3yXEwUqkOUoqnErjgX/eW1Ba7/gDzwPpOYcxipUVXNfwbB0+d9NNQ23+3XZwnwKcuSl0yWXruVNax5KI0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757527594; c=relaxed/simple;
	bh=p1K1r7QiSjUuPGqQLi4Dtbb3OFi1h0fLaBfxqHPJQcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWtTNW6XgXz/PsE6pwwkcXi85P4pHZVCEqBQfuyE7l4DpbpzvwTYJWUVbaBq2y0Uw+oaSnKlYpqDV9okB9XKalk4hfc1OPcqzOWtwnAzAdpOydAogM86MGAXI/Oqb7f9qqxCeqU1nob9PiUSaTzhRzBW12FYXWF6xy9eYtDHOWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsSaFcxI; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsSaFcxI"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4B0A83F4C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Sep 2025 18:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jG0qlthyNN84 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Sep 2025 18:06:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 283B483E6C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 283B483E6C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HsSaFcxI
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 283B483E6C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Sep 2025 18:06:31 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-77280e7bde3so387442b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Sep 2025 11:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757527591; x=1758132391; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGGo2FqzU3GfR0P/K8YS6WMuWrLlPcudWZNlFzJbBN0=;
        b=HsSaFcxIZRzEayjtxjhLrSnHwE9cnWOzgndCYuQhHgHEIGvmRDgrcAd+J8+7cEIW71
         TrfsciTlOEXzVhfzcEX6uoTf9DSqY2VaNIgDUJYC1EDQf3dsjuw/mdH+3w8Wt4ar3srX
         vrP13w9e/jkd5EUrWC57Hprj7KGlNuGyosLufgqXu1/ko3W9o79N2f+vVoZRSZo3vHne
         vXsTTib/oAyfoprJG/4B3DnnM080DMdtkkDxvh46MCLt6KlqETaaE1ftoYrASF4Kz2U9
         F7BbQ2B6cSQ5LAFtfahPqV66Ji6NbFXvbZXCKsNvGlzzxidApGtWqE+yd1ad0kmHGmRk
         tuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757527591; x=1758132391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGGo2FqzU3GfR0P/K8YS6WMuWrLlPcudWZNlFzJbBN0=;
        b=FOVI5lcsyOT4B4DOy0U9Tjmf8ChfSXFvUghIXTiOkdkhQRQj4DlDVRGb9bJrrxBsUS
         h5Fp+QOIt4oLAXmhscMnfMqHutjRdtgetbMW8kR2SSVsKbTXoB882nwDcA27ugj2YO9O
         o+dOHSm6UpZBWgLbSQqJ4EAtmjqFfJkOcs62JtQZhPuSxTMvBYeFCJQEcwtHE3kRo4NP
         woFhSNJQfLmFXfDxLwcmcH89jVRYm/l3MihPv1uAhW5WRv5JzowQgkCaU17mOZ/HIbLX
         JuzCzTc2bNCU3atcTH4EAtqayTv2Fk53eezS1vF3+zb5vm08VTS2Yz/oN8/8+H5hzfGa
         BVyA==
X-Forwarded-Encrypted: i=1; AJvYcCUgh4vc1kRRFWAuPZ86ispDDpj3gZbsxTSnUZm4qmvjJQikf0bg1RGVi8JdFcg9Lt3LklEdZAXtbgQBErIbGZHMCmdTCw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw/JF7Xz9aIWeJImLQao8CnCqmVfh6rQlHvBFiCfnqBvL6CNs+J
	MTtj2X89jN2NQ6I4Cp0mQ6Rr1CPF0mI/44hh3uXvCoXyrMEat5G9tLSy
X-Gm-Gg: ASbGncuYCkaHV0Pu7vHn4wXK4zRr10HigCZK88BIUwxLJlpBxd75TLtUZFYe6RSJTI7
	/BFpNOZtjnaDapHRSPZaLM8Mpfa/dt8yGGf6yxsrVT3FzT+3v3k0upm0Mhu06Xvm7o3TH/pgHu8
	623L91a+DC8SB9mRlwLBTKLMVif2u9NrB4pU7rWqeh6iuR7a0nYqauIgNHXHu9IC9m0H711sitv
	d4KURVIW9adPVEZVOf/tcQcN7YIeQHrPIxrRzJJ1M4X7uAklN5GKn4f69/1WBATfuCqtpLM6+m8
	8hEkbHOJy3oo+7Tu+dAHT1f9vHrTU/pMQIrqD7m50ZDbzFTSJQE9MUiPBLzt7D22yVjdC+ikwpg
	i3rNGxvTv3cVzszQvaDvFPOngvt/Ytw==
X-Google-Smtp-Source: AGHT+IEzw+HMhtbClo177HVd/w1cVZeS4EdrLYZApgOY0nZ482UsPgyuJQa51LNrMY3+KaXBnksi2g==
X-Received: by 2002:a17:90b:180d:b0:32b:dfd7:e42c with SMTP id 98e67ed59e1d1-32d43fb8b5amr13570751a91.5.1757527591266;
        Wed, 10 Sep 2025 11:06:31 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:777f:f183:f24a:5cd4:ead3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb313dafsm3279188a91.6.2025.09.10.11.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 11:06:30 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: vnranganath.20@gmail.com
Cc: brauner@kernel.org,
	broonie@kernel.org,
	jlayton@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] selftests/filesystems: Fix build warning on anon_inode_test
Date: Wed, 10 Sep 2025 23:36:15 +0530
Message-ID: <20250910180616.4324-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730192748.39517-1-vnranganath.20@gmail.com>
References: <20250730192748.39517-1-vnranganath.20@gmail.com>
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

Hi,
Please let me know the feedback for this patch.

Thanks,
Ranganath
