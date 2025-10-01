Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DC22EE5F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759350200; cv=none; b=k52EyntzyiwicKrHiWA5pvII6lWTo0Wk9oq9vj1DP5BR7KmU7gD9x7QxHlkAvsFH/zFkJBcq5OhHCMFLkwa7AoPuPQOlLumhv9kRcYuKqkzhCOIAxqrCbKsLD94HM1GWTVsAgv7aSmX4PeDidhEC3WgMfnOjFCQvBIuU/At30Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759350200; c=relaxed/simple;
	bh=sDgjk+ktzv45pAziz/W/rEGBe9ilvei4D3+TtKwEeiI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=icOrVWNc2CD6Ul0Idb5qe8B2KBz4CMXdTy/OrMpdEjQqaSk3HpjJU+7j5HbP7WkHtSFzOAMgzMsPvbNeGKXAs9w+ufaIKTKIP9cuuJIrUeoZwkyOEEyasvUqZ6juShfH8Q90kE1iLOXa1hxvU96tSzdU+Q22kQEhtquraxtL9t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbjagv5+; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbjagv5+"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54ACA8408C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 20:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXv1RkaH8hRP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 20:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=eddyz87@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A572D84086
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A572D84086
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kbjagv5+
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A572D84086
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 20:23:18 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso267012b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759350198; x=1759954998; darn=lists.linuxfoundation.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sDgjk+ktzv45pAziz/W/rEGBe9ilvei4D3+TtKwEeiI=;
        b=kbjagv5+cYcyBbkbbuZ+V95uXdmGIg3hUByNGktsjCmfNevZEbhzFGOyBG8f9AC6wQ
         kkTtq6fk9M5ZqQFNhqJYxdTxn5UwwYgn0WepEdxJPmQBA8hnyMSzBCpXYRU8breJvbbV
         TDPXjji9A7gdzoE6fO4CN+eH/fu93NGNAFXABmj4v0yNufQSwvjrrznbBn1spXHgFKlj
         SfTuaESTYu9pdbF5OliaIIAI9xUR2qXRUtnWYt7xHZ0YgdWAbIbITxWL+bNkPo0IGyI0
         POHvRZ61z8RQZCwrqmXQCFvOOPeQM+0IZipJNHuT3J/V0YA91gc70ghzGaGr4rxpybN1
         BciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759350198; x=1759954998;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDgjk+ktzv45pAziz/W/rEGBe9ilvei4D3+TtKwEeiI=;
        b=Y6rzAzlWu9nQpbwOJABLchFomUKII+ddpnuGTMs93zLZp+f6+2zWCO4LRL5fZz7w8Z
         8o8qY9WmYThh/Ye2lnMJv+d1tSXxzACtSCzgOvbQbqrKkeG4nS6qoqgAaz0N2lrpR8Ho
         VZuxDAt2u6S1mQo5xe2vFcVgbhDASLlpkKJHWngjxSvGVBrnEsLU/TZ9rGfoK5JRjGwh
         PcS7Shg+tHqJhBUwUp2ZsEGrMhHTnCdWOjWlEMSsxD6dknpejJmSmkLsrA/6xJVzcSoV
         2LuKGUFXcMtZx6/B9JDCD3jzBke5LI7Rx6R0F7pQkeBG5FAXNdeP/I+iz0dZg9oBL+9+
         oFhg==
X-Forwarded-Encrypted: i=1; AJvYcCU8voL6pj+Xjm73VrwCX7Rvzr4Q7EeN/awES6Vhu1TGTO7m3XcVtgaQCjjs1uf6Oaacutdz8ID1y9tTKQ+XadKgH2vTpQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw+R+HYvslRVmcXipXz8djj+a21iPDdznvrp+wfHPlxGM3jmYoy
	jMaFHGMNmNygba7jpJk5+Y0UHTM05xhwzhEHB2g7OpaGQb1jWv1buF0U
X-Gm-Gg: ASbGncsj0e+X0Gm6ocAEiBm8DW5eY9HTtgRkLlHK0Gp7tn3+cWc1cfCwAoPZa4bX/m0
	5DXRaGbpItmTkM/MxWx7iKDja5wbvnDoK0WfFlGPVleIPKnNExDEpDt4LPDhaGKkNv+nhwmqFq6
	XZq31D958XFbrRkL00p35ZI/qL9sT9JSv8uMDKZ5R0s99c5TsF+0Pp3vV+fUgfueC7mUYLFlImm
	UktvlQdghY6q9mA2UKKeDIKpkUU3+8zgqcD54+rCo0nd6IixK+CQ5Mny5i8I1lvMLlpunK+RNbR
	rl8ox3CCgEDHQ2cAP4tcE+265wLtK71Wi/OKMBk9mZ6zSUuCZE7+Lhc8WjZd2fwblpNbQM9XJvj
	GeubwRDInVv+sgTUsFJPjODD2E+BvT6Aq2fb4DpBhcE2jXsT5yrepP+wpx7FVxXfvNGisx68=
X-Google-Smtp-Source: AGHT+IEzLJ6xMI4TZdMZ4T+zFjMdd8zd+FBTLRL34IcHix6v7TwCxHpmo0m7KR94VG++00tXP6UsNg==
X-Received: by 2002:a05:6a00:8d3:b0:776:138a:ec97 with SMTP id d2e1a72fcca58-78af4176ab3mr5284861b3a.28.1759350197746;
        Wed, 01 Oct 2025 13:23:17 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:1ed4:e17:bedc:abbb? ([2620:10d:c090:500::6:420a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9dae7sm531831b3a.9.2025.10.01.13.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 13:23:17 -0700 (PDT)
Message-ID: <fbbeeee096dc14332c50b1086b2089f1b2f496d9.camel@gmail.com>
Subject: Re: [PATCH] selftests/bpf: Add -Wsign-compare C compilation flag
From: Eduard Zingerman <eddyz87@gmail.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, 
	andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, 	song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, 	kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, 	shuah@kernel.org, matttbe@kernel.org,
 martineau@kernel.org, geliang@kernel.org, 	davem@davemloft.net,
 kuba@kernel.org, hawk@kernel.org, linux@jordanrome.com, 
	ameryhung@gmail.com, toke@redhat.com, houtao1@huawei.com,
 emil@etsalapatis.com, 	yatsenko@meta.com, isolodrai@meta.com,
 a.s.protopopov@gmail.com, dxu@dxuuu.xyz, 	memxor@gmail.com,
 vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org, 
	gregkh@linuxfoundation.org, paul@paul-moore.com,
 bboscaccy@linux.microsoft.com, 	James.Bottomley@HansenPartnership.com,
 mrpre@163.com, jakub@cloudflare.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 mptcp@lists.linux.dev, 	linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, 	david.hunter.linux@gmail.com
Date: Wed, 01 Oct 2025 13:23:13 -0700
In-Reply-To: <20250924162408.815137-1-mehdi.benhadjkhelifa@gmail.com>
References: <20250924162408.815137-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-09-24 at 17:23 +0100, Mehdi Ben Hadj Khelifa wrote:
> -Change all the source files and the corresponding headers=20
> to having matching sign comparisons.
>=20
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
> As suggested by the TODO, -Wsign-compare was added to the C compilation
> flags for the selftests/bpf/Makefile and all corresponding files in
> selftests and a single file under tools/lib/bpf/usdt.bpf.h have been
> carefully changed to account for correct sign comparisons either by
> explicit casting or changing the variable type.Only local variables
> and variables which are in limited scope have been changed in cases
> where it doesn't break the code.Other struct variables or global ones=20
> have left untouched to avoid other conflicts and opted to explicit=20
> casting in this case.This change will help avoid implicit type=20
> conversions and have predictable behavior.
>=20
> I have already compiled all bpf tests with no errors as well as the
> kernel and have ran all the selftests with no obvious side effects.
> I would like to know if it's more convinient to have all changes as
> a single patch like here or if it needs to be divided in some way=20
> and sent as a patch series.
>=20
> Best Regards,
> Mehdi Ben Hadj Khelifa
> ---

I don't understand why this change is necessary.
Have you found any bugs while doing this conversion?

[...]
