Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBE8202C3A
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Aug 2025 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755326782; cv=none; b=Gjc/EIaqp19yw2jJy1xId+Rmx/jxrWqrPnGlJol//KAlBFEPowj+AXj3I+7K8i7TdNO9lV0wl9F/spiR+4hGbY1RcRxyV/gzsN4Q1Ilf6RUesJ6jYg2lgIIWqFSSya/L4OW65Jyvup+IFpZh8RAF/d0CsBCgvG/LFixnb000rYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755326782; c=relaxed/simple;
	bh=gAvOBrY5es/yKWkDs7Yk9hOG49QFhgslkJsBwv3zr0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6SgZSeTr5SuLbZwyP7UGp7IYuJjlNItqUhozO84j9kUX6tPRlp6RFgxGNVhWWzFGV3PS7MSPRpaJq5N3NsLvF69suAUo0ORsphoarNpRB3fGDjIfvvikhxd8vZeThMvnz64wcxxfQrC1eqRYHnnHtK8IEcXDLASeRtvuaE3yrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gp/pcih6; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gp/pcih6"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-30cceb3be82so2399268fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 23:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755326778; x=1755931578; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAvOBrY5es/yKWkDs7Yk9hOG49QFhgslkJsBwv3zr0s=;
        b=gp/pcih6NrxJuL8MTXn7d/UuxajYvCBYGJBiAThqJ2g+eE+G6vyBkIblKuTl7C6s+2
         MMEAVQ6KJgH+nN23To/32BCeoLx2/FNEXWldnPTXjl/f+o3Kn+DefdSX/SVDmIf/56qR
         uNsB7gn9V5d/avoGTt1iFEcHfBZtjclGtMPdxXc7H1fpNy91qiW+/sjuXTDdp0PtP36D
         Pe2EKJU2Sk/DVMFURG+Eok3emtNgb2Q0/02An5XbZkHGCaPVaj5fXzHTzk2laiihseEo
         cLFI1b88sUFof4iah1AJiLnodFk675HIM5nDpgE5ubciYAxe1XJGG3UIzcjRZwBpP28T
         EYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755326778; x=1755931578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAvOBrY5es/yKWkDs7Yk9hOG49QFhgslkJsBwv3zr0s=;
        b=Zh3NEhFANYGNcGfnZOMMrBQZxz1wxw/DpeGD9QSlawzFgdmHLgHYFLZxh8WtX97qCX
         MeRDH9ybn4DQHLOtzmTMkvR46VRu8gTFTDG0bEyRmZ0IVroh82gfjSDRTCkU19HF4Bbp
         ONDoYzWxa0a0xpwDOaWxynjhKV7cZKXNaqudGxnSXTlP7TGxRne5ifKr0QJLuuJHybac
         IZzN62AyFpJIxDhCDlE2yxaFxd5bRx8d9a/9EYz6RZc1EWUjAz+74blZNGrR/5fKB7KE
         DUXrHe9ZZqzoT0UzzKZosBFR5Eu8GyrHiYl2uIT+RnCEjp82hb3lmFy9oX878J3o6LRF
         kgSA==
X-Forwarded-Encrypted: i=1; AJvYcCVO6I3ZgXevmKum/HUwFzUQVFOiJjf2/R4mICulgo19Jj0fAvnhL5HdESrlzw6RWSA6SpH1JkxIYp8Zvbq26usR/wkjzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYThYU80XIz9D7RIrRNwKCI6VOUvB7H4LN1gv9xKKyIUQAqwqR
	JF/ANBhHLPO60zO2LGTFH9XF5Izdmax/vyEhiG4YoAWusZ2u5WcntqVAdBw584Ia8DsSHQx67Dv
	ur+z4yxA1oLqfd+UM8XFo2GJfFezYjCo=
X-Gm-Gg: ASbGnctdEhFZerRdPsllVm74oT2gxY2FvQof6mKvbZ9Nrsub2/O6jMCPGGsZjsdpth/
	pc/GuczhGl2+93r75jkzn9OPZryZxBmxIMAqzHrsehB39WLJEBZ9d+2fnxJne8u399KugroPrAC
	vLEvBE1yOtHb8Mj9WdQoSoqknbO5L08zOkBiTEQi3PhPPbiGBuBphERnHXcKnwvEj7SuW3h2oBy
	EM2ztDiPMT6cFyY1tu07Qqkz/G0QizHpeqFKpk=
X-Google-Smtp-Source: AGHT+IGjUuTFMbcHoxRQ16+EoLIDzFiULTRGmEHr00m0tAm0LGBEAq+siKWzqCMyJm8+Yk6JcOtKE+H+Yf8xIItqBpE=
X-Received: by 2002:a05:6870:8910:b0:2d4:d9d6:c8d2 with SMTP id
 586e51a60fabf-310aaec9831mr3004527fac.35.1755326778529; Fri, 15 Aug 2025
 23:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com> <aJ-ScOp3ZCG6PQmD@google.com>
In-Reply-To: <aJ-ScOp3ZCG6PQmD@google.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Sat, 16 Aug 2025 12:16:07 +0530
X-Gm-Features: Ac12FXycVXpv53_SMZYPs1lhxZFFkJf2blSiPR5TbUndixnCz2Z4HJEjGK5pwjQ
Message-ID: <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
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

Hi Namhyung,
Thanks for reviewing the patch. I'd like to ask if there's anything
else I should do regarding this patch, given that it's supported only
for x86 and powerpc?

Thanks,
Suchit
