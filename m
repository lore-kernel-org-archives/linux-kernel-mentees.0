Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E02FA0E5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131456; cv=none; b=JmxHN6/gkz7F3srB4kDDblRJ1oYB9s/uVONVi13z39OVzpBYhqHY3dsYIVV26iQi8e+iFgeEXKBU33FO2vsjAlQbWeHzpL1krUSuGB3mlDrR7fk4bdmIRbTyouB3BU0qrWZyjj5IwTpJkSkB8WIrRzkojMkGLkPrCgM4zfnGKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131456; c=relaxed/simple;
	bh=XfZ62tLuxByRPYy6WjHQSXBDg1A/cx9UlgBoxSwnUEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3HvVA+7/GJCVj5/bPochLz6kdpsRqcr7bDJF/Kq8liDrz2oZDjAD00XQcvorG4vqTdPJ2/HPbj07uD46uS2/sVtIdV5QF7dRYCkC4wut8P6gJ4yga0w1roADay8F/q6hddkjGpN+p/3mUzuhi/F3D07FXcxQXE7WtQpXzgFqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCbDTOhu; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCbDTOhu"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-30ccea8f43cso2971608fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756131453; x=1756736253; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XfZ62tLuxByRPYy6WjHQSXBDg1A/cx9UlgBoxSwnUEY=;
        b=OCbDTOhugmu6CFE+y1R63RZitexxcUNqgve1ONHB/MAwa2Ufi0crPbNM+GmGMAOJRC
         TjOGjKAwiMIyJaVj+46bgs7NYiFJ70y6WkwfX0te6gtsXq49KwXBnHaQei3CrcD4XLW8
         17NlDFcS89ipOlhhuDvgt94khVIajokbZsNhHRNgjHAQPgnCi2MnMILRZbMPWFRyfK8j
         T2zoQQY2Bdo7e7RIZzmcJ/Llu2pXmBMGe8rEgFQ1r+khamf73OMEg1EJFmSL7I9zHp8s
         xRnE74oa9Ri8UDaRDPDwYBhBKsvtCB/YxS+N6PzHQTYw0qIfgAaTdKbVYzZhoUcslc4p
         NSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131453; x=1756736253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfZ62tLuxByRPYy6WjHQSXBDg1A/cx9UlgBoxSwnUEY=;
        b=Gq/ycH00Dz4qwBZTOls8O5L1llqjcIfmAJRYYD50mF9wD7EeSA7M4AthMX/4j3LUIq
         ETc0viE26uEfXVpzd7LmRVCJG/igwROpx/Hlx4CCfxwWXx7aLck87FOcKtegan4XO4jQ
         80/MQzeYmhRvivZYn80s/8uYy0p/Mb74P7ye4jlu46wFVmFI1at8YypGyu5W613t51Kh
         pJT1X/huJgFUVOjnnMtxovqIFM/YpYzF3X44j+yy7WDnBkZLchnsvfqIcDcA/EMCKq2P
         gIP4SQqOM81LU0fNhP0fhsG8YosvKgao3BGYsaDt/Utb54yyTLK4DnyCeG/7mlzUZa1B
         kgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8EW9R2z1p4wv/Rq12ONUkA4rwDjeXBgKdM/qn1aOuKhUar+VIImf09QlD+T2tOvh0YT4gpcNnh2RF9pNdHYbVCQvVYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTWO64AD1FvkQbSsbU1c90eT5ci8W7TaytXJX2E1TRV0o+QAzp
	pbHAKZSuQr6TG69kp76Kk6TuCBoBzQ/cmcywqhYy9wlznbOjTUZRyCI+Ym0ErcN7xeI8mRDtkU/
	c52gWbL6Qke/SGsz6Znmj+AbhQHp9qG4=
X-Gm-Gg: ASbGnct6HFC1E/mwD32ccrp4WCzZcTxqP7PGAdpaT8fPfRF23Hq96iH4yV7zEAFkbnu
	TLwpY8w66uJCiQm6T6rvWH8UhKyuA4P2TV23yjJivspty0QFhbuhJZIQFl7LzcjmDlvxXN4Kmu7
	RqpsGRGOhDGFIHXsx8KYVRP1FV6cA2qocUGOA0O/OvhASiq1Byj/RjcnCw4P8z9cjNWTjezA8Ds
	lPVS2kWug==
X-Google-Smtp-Source: AGHT+IFSc8yJZYP5++oyX3zmrWa4FAQwXR273vNyQxNEoAE2cLriN8WjmSnBc4L7oE7eTe5khl35lhborZFipbzMxh0=
X-Received: by 2002:a05:6870:9a86:b0:30b:9efd:caaf with SMTP id
 586e51a60fabf-314dd684ff3mr6566294fac.19.1756131453427; Mon, 25 Aug 2025
 07:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
 <aJ-ScOp3ZCG6PQmD@google.com> <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
In-Reply-To: <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Mon, 25 Aug 2025 19:47:22 +0530
X-Gm-Features: Ac12FXx8FORsgG-UWpSZaL1OSNZ7sKM_Gyr2_7qwAfsu43fTiyQJX4R9qb9Mtrk
Message-ID: <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
To: Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-csky@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Aug 2025 at 12:16, Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> Hi Namhyung,
> Thanks for reviewing the patch. I'd like to ask if there's anything
> else I should do regarding this patch, given that it's supported only
> for x86 and powerpc?
>
> Thanks,
> Suchit


Hi Namhyung,
Following up on this patch. I would appreciate any guidance on further
actions needed, considering its current support is only for x86 and
PowerPC.

Thanks,
Suchit
