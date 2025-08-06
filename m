Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF83F1A23A9
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754498926; cv=none; b=l+CjOrHV1YRQ4dIL61ehgOs9uvzCZ8cuXJp1iPUN4kGL0U/Uh5PLID799arIR10nwf9o1yliRc7yHQ/yb/zI+fUyhJw+gBKycVrl3A5GSSCKps7M8iYffkKTpTdO86GpJwuGdd+vlYifjwUBNFP1KpWpnZvLLLr0vYRXHO4fGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754498926; c=relaxed/simple;
	bh=Nj6Kj0pTvlfrTjXPR98i4jM0LzpSrnHx5CdkZlWr77Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5sexuO2TD9OXFWpWTC9balriOC53HI57NuULuyuh0YH8/z13kzLG7x0OG6CpxLQlvF1eNVsSHQk7Rlgvwrr+TRNzj7kPpz3CxJdZd67WonoJ2+NX65FrmFEGZgO0TTMUKJpst580oYT0Qeg20bVtRXvfxh1nDQfP5/c8D9N7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOkIvKb/; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOkIvKb/"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7086dcab64bso208007b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754498924; x=1755103724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmPrYTqmetQZf+sYTQVyZTC/l5DEffFetmuMkntNP/s=;
        b=KOkIvKb/4c7oJaT7M8YDNNtL2ojP/67tgtbOg4Czc7KYlIRSuZit3tz6XNxFccazOh
         v6v07SP6LQqbJVeTbTyWolD11tMgpeO5dSgf1I4zjrr2yi4COQC69NfzatOeZWFcrBpH
         NUFlPXwj+Fnk9OfO/GtlQjxnaaWcrdjoQa1agz8U2IluCuQj7gmavh36f+GHt+Y+66Ce
         9+AZkTlbmdItsU/QUpyTrr2JjZALA6Zt9JGbQ4HSQW/HMw8ZJ94bQ7M/BIobdYBZ3aTt
         PPvvgFs+uuzRY3Z2+b+s2bK1qI2tT7BTRby0lE8qHZ6q8zk4Tlb+YKZ1KaURZaZ0K7W5
         wnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754498924; x=1755103724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmPrYTqmetQZf+sYTQVyZTC/l5DEffFetmuMkntNP/s=;
        b=inxAcCQOhe6HgNZ4js1mDo8Wc4mbwCKj2XovCW3+PpZIw3lPo20WjkDTGle8H6Hivz
         4E3oVecLtajW/9R8mxPsqZ31pk0xRz8Su/cOxQ3z5c3ND2JApHSP+1ntF+5bk6nNEqWk
         qVL4kC/xeXYiSk4UOxNuaVQ1XKjHCMEKZdca8cGBNF8Sgn5bYkaYrFpiiavsoHguADEy
         FgoUEC3Cuqhcu3CWd6qaAWsO3UceBATVO4HfugoGRVWenL3KiJpPntpAp6EqQNvKbATv
         qh5T1mXXFt2+Mlp73lNn2G+hmwNwRhMld0bDG3f2XpYUgY70XDcHIi3Rba/BqPI6zhRn
         W6cg==
X-Forwarded-Encrypted: i=1; AJvYcCVayIDZURal4bKOJ+/jm/Jc2z0T81jBtKsJeHzQp3FCtbffJOcjIRqNaYB5ugGTTOM3Wru5yv9FlzfpawBsxi/Z/uVE+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjezc7Ar81HTx2bMaH6Q73g9orMJ4Iu0Dg19GSUCdh1tt50x73
	UVWUZVd2KrgW4kRSW8faWrIhgYU4ThYzYB9gR909kNp8lGMke9wCXLwo
X-Gm-Gg: ASbGnctAW9vOZcS1CvuJJrzkqf8nSmI8Px3nHyKyRCkb3Me7iuNJ0DeNUf+rguSLurj
	3QsJEff0URT5FCCBY8KbtqA8EsXfoklZ7AFCd+lAcSEd2pPRi+Awz/g/rAb3TP/Gr9kAog4knRI
	GaXjUrbiycu9fcZZB/eyyBJyofFz8fs+bzXIIH3Pg39e0DnzntSVZLZUXMyy3m4dz4zrPM63XLl
	lf6CMQ8EIv3Ybne34h/9btYywLVdlXvJ54M0gKUwaMxiltZkJRb5OMavEx4aKT9ofpsjLVYaq7L
	dZ3N48o9gIcqaKDM2hyAbCRJPKwTEvjIGkCtz1lrKGYo4zCGmdhbmIFYqx4aKlEshc+cdXjrB/Z
	/Ll+ByHiQjQvw1a78rSLc
X-Google-Smtp-Source: AGHT+IEstsp2gFEGgrxRdxUAUocyEahZ2ZYPH2AcZjPGnW3zAFBwgU5t1obUzLf4lsOZgrRjSOzrgw==
X-Received: by 2002:a05:690c:a87:b0:710:f39f:4d3f with SMTP id 00721157ae682-71bcc68007bmr34294307b3.5.1754498923579;
        Wed, 06 Aug 2025 09:48:43 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71b5a3f9ebfsm40251297b3.30.2025.08.06.09.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 09:48:43 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: akpm@linux-foundation.org,
	peterx@redhat.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] selftests/mm: use __auto_type in swap() macro
Date: Wed,  6 Aug 2025 09:48:40 -0700
Message-ID: <20250806164841.2907972-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250730142301.6754-1-pranav.tyagi03@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 30 Jul 2025 19:53:01 +0530 Pranav Tyagi <pranav.tyagi03@gmail.com> wrote:

Hi Pranav,

Thank you for this patch! Sorry for the late response, thank you for bumping
the patch. I just have a few comments about the commit message.

> Replace typeof() with __auto_type in the swap() macro in uffd-stress.c.
> __auto_type was introduced in GCC 4.9 and reduces the compile time for
> all compilers. No functional changes intended.

From what I understand, the compiler optimizations from typeof() --> __auto_type
applies when the argument is a variably modified type. It seems like this
internal definition of swap() is only used within selftests/mm/uffd-stress.c,
and in particular is only used twice, in these two lines:

/* prepare next bounce */
swap(area_src, area_dst);

swap(area_src_alias, area_dst_alias);

Where area_src, area_dst, area_src_alias, area_dst_alias are all char * which
the compiler knows the size of at compile time. Given this, I wonder if there
are any compile time speedups.

But this is just my understanding, based on a quick look at the code. Please
feel free to correct me, if I am incorrectly understanding your changes or if
my understanding of __auto_type is incorrect : -)

With that said, I think the main benefit that we get from using __auto_type
has more to do with readability. Since __auto_type can only be used to
declare local variables (as we are doing here), maybe we can rephrase the
commit to be about improving readability, and not compile time?

Again, please let me know if I am overlooking something.

One other thought -- while this internal definition of swap() is confined to
selftests/mm/uffd-stress.c, there is another identical definition in
include/linux/minmax.h that may be used more widely across not only mm
stresstests, but across subsystems as well. Without having taken a deeper
look into this, perhaps this version of swap is indeed called on some data
structures with variable type, and we might be able to see some tangible
compile time improvements?

In any case, this change looks good to me, but maybe a new commit message
that can more closely describe the effects would be better : -) Once you add
those changes, please feel free to add my review tag for the mm selftest change:

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  tools/testing/selftests/mm/uffd-stress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
> index 40af7f67c407..c0f64df5085c 100644
> --- a/tools/testing/selftests/mm/uffd-stress.c
> +++ b/tools/testing/selftests/mm/uffd-stress.c
> @@ -51,7 +51,7 @@ static char *zeropage;
>  pthread_attr_t attr;
>  
>  #define swap(a, b) \
> -	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
> +	do { __auto_type __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
>  
>  const char *examples =
>  	"# Run anonymous memory test on 100MiB region with 99999 bounces:\n"
> -- 
> 2.49.0

Sent using hkml (https://github.com/sjp38/hackermail)
