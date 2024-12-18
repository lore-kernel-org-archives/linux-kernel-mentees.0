Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47661199934
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Dec 2024 23:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734563673; cv=none; b=aBlUixeS4YMr0d86/C9/4z6R7xKiPA1ESj1rnto+TjjG6qAI5arkKsueTwLTZRYUtIkh9K0dVEdxD1oJd9YSxu4DZXR4lqXnD6VeaXVBXIVqhx9aiHZha3ixM3VBX3e7vZaaOguLKZ0x0Wtk3VO7U5Aepvm3KcjMBBQrc+gPiD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734563673; c=relaxed/simple;
	bh=lyAMNMv5eKSuulZNEc/bdNCuyulKLn44+4F3l6KUPRs=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=st4bHFatQHIplOwJXMPeM9W0Cu+H3s+XQKl1gcuW49q9+05efW2ECR+rWnDWMzkbTvNL4hZKXSxhHjjD8OlX727jsxCvzbv8ATD9ewgHoi86au3TMW6ZXth3hU7n2Psw/n9XdFKyRG5X5b6jndFUcW2EsEVNGk7IrWilOgFOsc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bAvE0l5r; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bAvE0l5r"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd15d03eacso2462936d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Dec 2024 15:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1734563669; x=1735168469; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFXlSpmqndisihDpwgewGal8XJGyYG+RFQb6zfcXijY=;
        b=bAvE0l5rMyaTBeGUxDH43rLN0TRbdG/KmhFKidDnrHjL1aB7TnvFu6Zkrumi9B1Wrb
         +ui6XEOSiS1FddgfWQx9KhMNlWJgJpEXTPm1UqMPXN4N2UBXIZa5k403N0EBiGYJi9dz
         f3DvyDe3Qp1zcv3UaajtIviDnrZ1ofSiWUGCAlYb1NrB6UU9sZU43ldGbg8MphiUU5t7
         bjqwUdpbIAFbCPTwKUMEDm3YVMmfQTGwjEIa+FyL3CBpFH+jQqgGZs99qV/VNnRWh/uj
         syofM1JlQHkSEa6XGnR+wEBeYk6P6MOqbi7lIKivLFDTnDWmauOIG2z2/36jb88qI/eW
         AcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563669; x=1735168469;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fFXlSpmqndisihDpwgewGal8XJGyYG+RFQb6zfcXijY=;
        b=itkiCbM9nDASPX5YsELn1m5LAtoXeEdCBmZ0Egv9Ke5HH33ltY0wWdp8MX8jvOEBr2
         ZWHNZYuPFLaqsuK9MzGvnFddl0weETf8bKFD8cCYJtcqdzTAXHrNJTLISTrG3Z0iWO1a
         pbUpHKF9SgC2U7Gwkp+b5MY6hYVcS0FMjFOsTZuFXJsK+oq5Pxw1omnVhhg7iXmPtuv/
         j7WYy1UtPIlQay7rJ+rVqwgV/J6v5GAs0lide8qhMQoAc6q1y7PnSQ+EhNo3MbqU+Nx9
         pjAbcEx9bG1J+AxDQcoV2B7qcDxDZIh8c4jEW49I867Q8I1oWUA2jKiEqTcA1wumgYBy
         KGug==
X-Forwarded-Encrypted: i=1; AJvYcCXMzzw5L5z5BsVaOoN7vaxaLGLifs9IILnKunboa/aEXwlZfyThkBoEisDGfpopAyNKDk8YmdbfUDX25qyW4qbbCRdhPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYE7evJmOUINRNo1igQw/UbaR4Qt5vpYH4Uk2DwzhZag5BXmYQ
	10sRs7iC09MxlF2vu3jFkqRdi8MbMHWCcaMVvAQq9jv9C3aM00w9ic2PXYbXBg==
X-Gm-Gg: ASbGnctOjS/FJpBLlHaHtiJV4CcBg7WZ9mQnbWlINyzvr3NnhswQxT1ShfL2QuW97oy
	i0NVM7xzub8yqAPc3GzBfzCXzj2IMWwpNGy7sfKR8HzrWthBWRDs89d5sSWQLttkYgpDLlOPkMv
	q+0+lxAwFiB1t4L/A7OVrjH3X7KyaWivg9sm/NF6/apxPqj6AqCAaLqDY9qygnyKjXSYWVFuWJj
	pD2B9ENssgXJeshsS2pBetN2Q869ZKg59yqvA2s49UKwPsG3Zo=
X-Google-Smtp-Source: AGHT+IF812hW3SafWF2rQUyIrEzOBwO01YXN1q6BdXWRjDtGlUPqECITyxWs+43CjiDrTg6b9jZQaA==
X-Received: by 2002:a05:6214:3107:b0:6d8:a3f2:4cc with SMTP id 6a1803df08f44-6dd15547264mr22536116d6.5.1734563669239;
        Wed, 18 Dec 2024 15:14:29 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d3d90sm690556d6.106.2024.12.18.15.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:14:28 -0800 (PST)
Date: Wed, 18 Dec 2024 18:14:28 -0500
Message-ID: <eb8aefa13af635a5275c3ff446cd54f2@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20241218_1749/pstg-lib:20241217_2346/pstg-pwork:20241218_1749
From: Paul Moore <paul@paul-moore.com>
To: Amit Vadhavana <av2082000@gmail.com>, jmorris@namei.org, serge@hallyn.com, casey@schaufler-ca.com, shuah@kernel.org
Cc: ricardo@marliere.net, av2082000@gmail.com, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: lsm: Refactor  `flags_overset_lsm_set_self_attr` test
References: <20241116152136.10635-1-av2082000@gmail.com>
In-Reply-To: <20241116152136.10635-1-av2082000@gmail.com>

On Nov 16, 2024 Amit Vadhavana <av2082000@gmail.com> wrote:
> 
> Remove the temporary context variable `tctx` to simplify the code. use
> the original context `ctx` directly in calls to `lsm_get_self_attr`,
> eliminating redundancy without any functional changes.
> 
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> ---
> V1:- https://lore.kernel.org/all/20241112182810.24761-1-av2082000@gmail.com/
> V1 -> V2 :
> write complete sentences instead of bullet points in the change log.
> ---
>  tools/testing/selftests/lsm/lsm_set_self_attr_test.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Thank you for working on improving the tests, merged into lsm/dev.

--
paul-moore.com
