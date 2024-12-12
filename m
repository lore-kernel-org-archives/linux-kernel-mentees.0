Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD20223E77
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734027500; cv=none; b=DOKR1oBzuOpnbpiSSTUmLl/zz8lu+ssa/30hNfyjftQo9L41Xwy0z6iS1zjIAqVKj4TB8bOAzSaXzd+/MzadrtpySWKgBvi4fIP8FF9wHQBqzJGwkts9NZi3vVhtA4g7/uQFGS9GUsRB9SRGXYkNP8bVBXYbWQHNfPdmxrSJNgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734027500; c=relaxed/simple;
	bh=IIpcnOmv8gXyAskv5AC++X5FTUcu1O349J09UOMhC/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFEgkUUWRaJfM9ymCGfg1WyfmYd4tDy6/c2U3B2/q5mKH3PigvheSQJjLStgL+4C5BRVfJHKrUf1Fm1cuALdh2eq6tKXTJaMVgGYAU5s+lp7z/VxxIl/TSzLd4sv3Ax+iWOuG1eqtrVmpAJ7MglZn3veM8jx389gUm0Ntw0ZGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+n+gCds; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+n+gCds"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A04845BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 18:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksccGv_a9kVo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2024 18:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D548845BD
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D548845BD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+n+gCds
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3D548845BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 18:18:16 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e387ad7abdaso670633276.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 10:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734027495; x=1734632295; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zo9PMMRdvR4TWcHlbTqdY4+03Oq9+8RRn1FRR6QdKck=;
        b=D+n+gCdsLklaQ+4C57RL750Z8lajCClDH6hj48YZmAokYaVit+m1lYVfTOK9CtSjAF
         1zikt07uE+efk2nUGlljmRcPURN8ZvOWvvvsatLOFml0ZpiJzloqvtmzx12X6AM+KkpY
         Pv3YcMsKE1kO4aODkplHFro2iiymhJmnlz5z8Hv1ssDwQ1JNuA0t6kPrva+LnvneA/r0
         SBB+nuH7qgK2FdStP18J3LTTOofQK1ufD9SGFOe0xvDEtS13Ee6GDrY6AxqJ4JJVk7TG
         RgLUfP5PkT7e7BnfgvbuwsjxHUtbosqFdaGodZfYNavY7hMuhevpj+LfneMg9qCsI/lk
         +jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734027495; x=1734632295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zo9PMMRdvR4TWcHlbTqdY4+03Oq9+8RRn1FRR6QdKck=;
        b=SZCeS7epHQSMUuCgMzDY8iRsLJGcTY6vnX0RVMjzjwxg0RE1om3qZYl/riTZtFUOw6
         c4EtLFOyIFc+Z6czI2hFZ5rKvKEBLlC3psh8I8EnJSWJQ9SR7XpzTKtmO7hfr7TSiXPm
         BmSEpcfqnjl+f7eMQMy/bNGLiga7Q+uTBcUM8IWWZFVfJXNtoNnO/jbiAynF3MVmzCoA
         5T1tAVjkd8MEeRRBTM0dlWTl9jvn5yDgvlqHkffEnTnA+ZGXh+19uqrCQepH8LH8cwZK
         I94bbgV+JUC9TesMjGyMjRkqw1HtdCN86K1wpzQCvO9swz9q/KBAvxHE36gHKUYimw0Y
         q4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVV6N0EXzWDCLO5QCXgpcz6JzsGl44oePRmQn5XBupyCxN3SzSOP6JcaMTPV8NYAlsUJYs8eehw0xsULNMgXlIkItZGA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxSJ2f9Wr+X+A3jc1KbzEl//B4TM+1I48DB+xWUgRNMJpIT5G/D
	aasLSS5DY7HC2YbxAE5iQInIKBDDSBUZDU1q17VSfLHQ1vY8gDxU
X-Gm-Gg: ASbGncuhSCh1F43UkSRLRfwt6ceZ7ITcc5xX4xJSsUjewBmR/frSx7FSXNhzWa3hfjw
	6GHQOU2shCm6Y7ehCGBsHTYwlOqgU2K1lj/Tmk4bbfG9O77kD1Uf2V2o3FhYxx9GCZY2U6bb0i5
	4abCrpstJDzwdHIkOPllzym8SW9i357twMBD6LfjJp7I3Zv/N6rtU9vxrnyfxVC6epicvPOmpv9
	nVk4xnzIqAqNQNgF+aVLktIvPElYZWq8bKnwewElEwKCD9KiaBji+Y=
X-Google-Smtp-Source: AGHT+IF43XnGa+0BJH8Q9ln131urn1VtN6bAa4xSBCHe/VTCeJaVJATTOpDT1RGSea2nTOBEF6F7Ww==
X-Received: by 2002:a05:6902:1105:b0:e3a:47ba:84c4 with SMTP id 3f1490d57ef6-e41c1289ca8mr1546792276.4.1734027494884;
        Thu, 12 Dec 2024 10:18:14 -0800 (PST)
Received: from x13 ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3fbc7f9e1csm385702276.21.2024.12.12.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:18:14 -0800 (PST)
Date: Thu, 12 Dec 2024 13:18:12 -0500
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: davidgow@google.com, npitre@baylibre.com, stern@rowland.harvard.edu,
	u.kleine-koenig@baylibre.com, skhan@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com, rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] lib/math: Add int_sqrt test suite
Message-ID: <Z1so5J9BaXYUF2fo@x13>
References: <20241212021259.20591-1-luis.hernandez093@gmail.com>
 <20241211231816.9857d14e07251165e247eb51@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211231816.9857d14e07251165e247eb51@linux-foundation.org>

On Wed, Dec 11, 2024 at 11:18:16PM -0800, Andrew Morton wrote: 
> my x86_64 allmodconfig build says
> 
>   AR      built-in.a
>   AR      vmlinux.a
> error: the following would cause module name conflict:
>   lib/math/tests/int_pow_kunit.ko
>   lib/math/tests/int_pow_kunit.ko
> make[1]: *** [/usr/src/25/Makefile:1925: modules_check] Error 1
> 
Hi Andrew,

Thank you for your time and pointing out the issue. The duplicate entry
for int_pow_kunit in lib/math/Makefile and lib/math/tests/Makefile stems
from my attempt to align this patch with another[1] I had authored in a
series by David Gow that moves all lib/math/ KUnit tests to lib/math/tests/.

Since that series hasn’t landed yet, I’ll update this patch by reverting to the
current mainline approach, keeping the object file assignment in lib/math/Makefile.
This avoids assuming the approach in the David's patch series and prevents conflicts.
Once both patches are merged, I'll create a follow-up patch to align everything properly.

I apologize for the confusion and back-and-forth on this patch.
In reviewing your earlier feedback from v3 of this patch[2], I now realize
what you were referring to regarding the conflict. At the time, I failed to
fully understand the issue.

I appreciate your patience, and I’ll do my best to resolve this in a way that
minimizes further disruption.

[1] https://lore.kernel.org/all/20241202075545.3648096-2-davidgow@google.com/
[2] https://lore.kernel.org/all/20241031173941.3487ccbfd7421d81d9b0cb97@linux-foundation.org/

Best,

Felipe
