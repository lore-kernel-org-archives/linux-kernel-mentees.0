Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185AF23EA86
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  6 Jan 2026 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702552; cv=none; b=Xb+CyZm9OpvVqXOrWDLWD9n44A3hI1385jretkvz6r7qKtxdl+QOdwRGWAMTvpnxT8R1xUyXvGo5IZBzkJyekguFt2haMp212XoccSvIDddtPqDMlBtu7ccCYYvUSPPttCzRpglCuGWKopCTB3lll7YkE+IbUs3/WZrMb4NQyE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702552; c=relaxed/simple;
	bh=wXZzH27gnUDagNl5a0ME5KVazZHyReqGn/kmzzyAPc4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c8Ot7rS868hi/RC3FfRkZN71wF3djHBxrtJFhVGSduYG4Zt8E/6RR0hUJx+xjWfyYSn4H9CQGrJyN5ABognahIOYq3Kp/NmZ3ZvLL+Q6buqN18Xc4zFzsdklqSmSuY38KwOB/YBKw1epoA4VNfwAkp4qao0FUIISaBdc72x33BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfngdJbq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfngdJbq"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4792bd2c290so9400255e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 06 Jan 2026 04:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767702549; x=1768307349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pZdwAP/wq9kuKKVzLJ5M0q6p8KUwTZW9kKk5Fbt3zQ=;
        b=sfngdJbqdrnfO2IMm9SYPI1fLAV/OiBuWQLQgMcP0J/WMyiNs7Iq3BkrUww6xaWumS
         MF207PlEokRinFIUiMzHkDnwXxbUC9HUxquLzOS3MYia3mAavY9svSYmpcacymLv6PKO
         w/Q4i6iV4QUkQW5Yyplh3ilADs8z6OeXqxZuN5z9hOEA9Np8CaLmoIWvEm8bzgNm3dTu
         JZkDr4/GGsyVtmXFAeJpmwuqYT8W6z3/c6Lx26iGkW4L4DCH3CoHsVpHJaeWhn891vgj
         K+Fj6p+rI+yZ9qRNtaS8+Vz3L/NB6pF9DWs77TqKubZKqmCSTmb5E/0LHkUB0pSYJ7zD
         4FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767702549; x=1768307349;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/pZdwAP/wq9kuKKVzLJ5M0q6p8KUwTZW9kKk5Fbt3zQ=;
        b=vWK06CxoORTcapuQDImUmZ9psZ95OUA71Rnui2wL9gPUqeUQQdytQiTBRpLDiQCXY3
         de7NmqLibaxJLEQAeKOHw3aGPDlp725oQCwv2CFwS8mZ8jK8DEFIo81a91ShMeSz0fAC
         xbu9Krma2vqgcTpzW4pLsJHFfMf2uECR4DH/Da3WNdGWjd3nCnYBKFwjLlPUxpyth4OG
         OqSyH/GP9FJKF+W7LkNOOoADXaoIf8LUKedXW5iv7jOq0FbZOcTJrIxMH9KYgJMCkJKN
         pIjDU0tuxmyV/al7IhXORvG474tE9Jn5wrDJDloaCP3S0PErrtvwDiwAbt1aSZ8tkuc0
         4/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUVNi1zwmH9j9OLu5ztVzhF45W+kCt5v+2wnU4o/Wzq9IIHx7Zzgwbbbz1O8y8eNmymwawiF1iKnOfLO4vfuuNsrc3G8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YynHgJtmuE59PdAQ+cfNAZvqG3LJzXfXFRpLUXpezUhI+OeB8Km
	/X+Rw51O3CwVhP9mmSUpLyW5+2c3t2v4ksViQBQjbbLzYzz1j4wZm7bKc1C08IfdaieQjWJR3sz
	Ycccv2HWn3rnYbQ==
X-Google-Smtp-Source: AGHT+IGDb5uS6PkHdgGZm/vN+neaeuomXNsUF5fH4vDNKaBbgCTUgMqpCF8VtoYm6kaWCOvj+sJGU4W9OTyeoQ==
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:479:36b0:ff54])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b27:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-47d7f062feamr32360515e9.1.1767702549472;
 Tue, 06 Jan 2026 04:29:09 -0800 (PST)
Date: Tue, 06 Jan 2026 12:29:08 +0000
In-Reply-To: <20251016104409.68985-1-reddybalavignesh9979@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250830163949.20952-1-reddybalavignesh9979@gmail.com> <20251016104409.68985-1-reddybalavignesh9979@gmail.com>
X-Mailer: aerc 0.21.0
Message-ID: <DFHI984SEFV3.2JL88CLHNT2SO@google.com>
Subject: Re: [PATCH v3] selftests: complete kselftest include centralization
From: Brendan Jackman <jackmanb@google.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, <akpm@linux-foundation.org>, 
	<shuah@kernel.org>, <richard.weiyang@gmail.com>
Cc: <david.shane.hunter@gmail.com>, <khalid@kernel.org>, 
	<Liam.Howlett@oracle.com>, <davem@davemloft.net>, <david@redhat.com>, 
	<edumazet@google.com>, <gnoack@google.com>, <horms@kernel.org>, 
	<kuba@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>, 
	<linux-security-module@vger.kernel.org>, <lorenzo.stoakes@oracle.com>, 
	<mhocko@suse.com>, <mic@digikod.net>, <ming.lei@redhat.com>, 
	<pabeni@redhat.com>, <surenb@google.com>, <vbabka@suse.cz>, 
	<linux-kernel-mentees@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu Oct 16, 2025 at 10:44 AM UTC, Bala-Vignesh-Reddy wrote:
> This follow-up patch completes centralization of kselftest.h and
> ksefltest_harness.h includes in remaining seltests files, replacing all
> relative paths with a non-relative paths using shared -I include path
> in lib.mk

This seems to be breaking the x86 build for me:

=E2=9D=AF=E2=9D=AF  git checkout e6fbd1759c9ece5044d3470f30a5e2166dc9de89
=E2=9D=AF=E2=9D=AF  make -j mrproper
=E2=9D=AF=E2=9D=AF  make -sj100 defconfig
=E2=9D=AF=E2=9D=AF  make -sj100 headers
=E2=9D=AF=E2=9D=AF  make -sj100 -C tools/testing/selftests  TARGETS=3D"x86"
In file included from syscall_nt.c:17:
helpers.h:10:10: fatal error: kselftest.h: No such file or directory
   10 | #include "kselftest.h"
      |          ^~~~~~~~~~~~~
[...]
=E2=9D=AF=E2=9D=AF  git checkout HEAD^
=E2=9D=AF=E2=9D=AF  make -sj100 -C tools/testing/selftests  TARGETS=3D"x86"
[builds]

If I just revert all the changes to tools/testing/selftests/x86/, it
builds again.
